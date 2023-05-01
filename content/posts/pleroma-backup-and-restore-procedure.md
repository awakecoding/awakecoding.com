+++
title = "Pleroma Backup and Restore Procedure"
slug = "pleroma-backup-and-restore-procedure"
date = 2022-12-04
+++

In previous posts, I have covered how to self-host your own [Mastodon-interoperable Pleroma server](https://cohost.org/awakecoding/post/390625-pleroma-same-fedive) and how to get access to a [free ARM server with 4 CPUs and 24GB of RAM](https://cohost.org/awakecoding/post/384627-free-arm-server-with). After running my own Pleroma server for two weeks, I looked at the resource usage history: CPUs barely do any work, and memory usage is less than 1GB on average. While Pleroma can run on 1 CPU and 2GB of RAM for single-user instance, I have decided to play it safe and downsize to 2 CPUs and 8GB of RAM for now.

# Backup Procedure

If you are like me and have limited system administration experience, then following official [Pleroma backup/restore documentation](https://docs.pleroma.social/backend/administration/backup/) doesn't feel straightforward. The first issue I encountered is that I didn't keep a copy of the setup_db.sql script created during the initial configuration generation. If you still have it, keep a copy under /etc/pleroma/setup_db.psql.

If you lost it, generate a dummy configuration file using the answers matching the current server. Don't worry about using the right database password, we'll fix it in a moment:

```bash
export MIX_ENV="prod"
sudo -Hu pleroma pleroma_ctl instance gen --output /tmp/config.exs --output-psql /etc/pleroma/setup_db.psql
```

Grab the database password from `/etc/pleroma/config.exs` and update `/etc/pleroma/setup_db.sql' with the right value. This is what the setup_db.sql script should look like:

```
CREATE USER pleroma WITH ENCRYPTED PASSWORD 'SuperSecret123!';
CREATE DATABASE pleroma OWNER pleroma;
\c pleroma;
--Extensions made by ecto.migrate that need superuser access
CREATE EXTENSION IF NOT EXISTS citext;
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS rum;
```

Create a new backup Pleroma backup script (`sudo nano /etc/cron.daily/pleroma-backup`) with the following contents:

```
#!/bin/sh
systemctl stop pleroma
sudo -Hu postgres pg_dump -d pleroma --format=custom -f /tmp/pleroma.pgdump
mv /tmp/pleroma.pgdump /etc/pleroma/pleroma.pgdump
tar -czf /tmp/pleroma-backup.tar.gz -C / /opt/pleroma /etc/pleroma /var/lib/pleroma
mv /tmp/pleroma-backup.tar.gz /var/backups/pleroma-`date +%F`.tar.gz
systemctl start pleroma
```

Make the backup script executable, then run it manually at least once:

```bash
sudo chmod +x /etc/cron.daily/pleroma-backup
sudo /etc/cron.daily/pleroma-backup
```

This script will be run daily as a cron job, and create backup tarballs under /var/backups:

```bash
$ ls /var/backups/pleroma*.tar.gz
/var/backups/pleroma-2022-12-04.tar.gz
```

Copy the latest backup file from the virtual machine to another location. For regular backups, use additional storage attached to the virtual machine, and ensure that if the virtual machine is lost, you can still access the backups.

Last but not least, take note of the uid of the `postgres` and `pleroma` users on the current machine.

```
id -u postgres
112
id -u pleroma
113
```

The uid values will differ, but in order to avoid additional `chown` commands when restoring the backup, it is easier to use matching uid values for the same users on the new machine.

# Restore Procedure

Follow the instructions from my original [Pleroma blog post](https://cohost.org/awakecoding/post/390625-pleroma-same-fedive) and stop when you reach the configuration generation command.

At this point, you should have the `postgres` and `pleroma` users. Use the following commands to change the uid values such that they match the previous machine:

```
sudo usermod -u 112 postgres
sudo usermod -u 113 pleroma
```

Transfer the backup file to the new machine, in the same location (/var/backups). When you are ready, restore the Pleroma backup on the new machine. Beware: this operation will overwrite existing Pleroma files, so don't restore a backup unless you intend to do it.

```
sudo tar -xzf /var/backups/pleroma-2022-12-04.tar.gz -C /
```

Delete existing pleroma database and user (may not be required on a new server):

```
sudo -Hu postgres psql -c 'DROP DATABASE pleroma;'
sudo -Hu postgres psql -c 'DROP USER pleroma;'
```

Run pleroma database setup script:

```
sudo -Hu postgres psql -f /etc/pleroma/setup_db.psql
```

Restore database backup (this can take a few minutes):

```
sudo -Hu postgres pg_restore -d pleroma -v -1 /etc/pleroma/pleroma.pgdump
```

Run database internal cleanup to optimize queries:

```
sudo -Hu postgres vacuumdb --all --analyze-in-stages
```

You can resume following instructions from the original [Pleroma blog post](https://cohost.org/awakecoding/post/390625-pleroma-same-fedive), starting from the enabling and starting of the Pleroma system service:

```bash
sudo cp /opt/pleroma/installation/pleroma.service /etc/systemd/system/pleroma.service
sudo systemctl enable --now pleroma.service
```

Make sure that the Pleroma service is running before continuing further:

```bash
$ netstat -tln | grep 4000
tcp        0      0 127.0.0.1:4000          0.0.0.0:*               LISTEN
```

If it does, then congratulations! The trickiest part of the restore procedure has worked. You can now update DNS records to point your domain name to the public IP address of the new virtual machine and request a new certificate from [letsencrypt](https://letsencrypt.org/).

Once everything is up and running, don't forget to flush the DNS cache (`ipconfig /flushdns` on Windows), shut down the previous machine, and try loading Pleroma from the new machine. If it works, you can now safely delete the older virtual machine, and consider the migration a success!