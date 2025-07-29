+++
title = "Vibe coding a Rust MCP proxy in VSCode with GitHub Copilot"
slug = "vibe-coding-a-rust-mcp-proxy-in-vscode-with-github-copilot"
date = 2025-07-28
description = "A hands-off experiment building a Rust-based Model Context Protocol (MCP) proxy tool using only GitHub Copilot agent mode. Covers setup, multi-transport support, and lessons learned from letting Copilot do all the coding."

[taxonomies]
tags = ["MCP", "Rust", "CTO"]

[extra]
banner = "/images/banners/vibe-coding-a-rust-mcp-proxy-in-vscode-with-github-copilot.png"
+++

I set out to build [mcp-proxy-tool](https://github.com/awakecoding/mcp-proxy-tool) - a simple [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) proxy in Rust - without touching the code myself, relying entirely on GitHub Copilot (agent mode, [Claude Sonnet](https://www.anthropic.com/claude/sonnet)) to do the work. This post covers what it was like to let Copilot handle the entire process as a true hands-off coding experiment.

## Getting Started: Setting Up the Environment

First, install Rust using [rustup](https://rustup.rs/).

You'll also need a GitHub account and to register for [GitHub Copilot](https://github.com/features/copilot). While there’s a free version, I recommend the paid tier for access to premium models.

For this project, I used Ubuntu 22.04 in [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) with [mirrored networking mode](https://learn.microsoft.com/en-us/windows/wsl/networking#mirrored-mode-networking) - mainly because I thought it might simplify things. You can follow the same steps on Windows if you prefer.

Create a new Rust project, then open the directory in VSCode:

```bash
cargo new mcp-proxy-tool
cd mcp-proxy-tool
code .
```

Follow the instructions to set up [GitHub Copilot in VSCode](https://code.visualstudio.com/docs/copilot/setup). In the Copilot chat, select [agent mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) and switch to the latest [Claude Sonnet](https://www.anthropic.com/claude/sonnet) model.

## Why MCP? The Microsoft Learn Docs MCP Server

Not so long ago, Retrieval Augmented Generation (RAG) was all the rage for making LLMs more useful. Now, MCP (Model Context Protocol) is taking its place with a different, more direct approach: tool calling. Instead of just retrieving documents, MCP lets agents call real tools and services, making LLMs much more capable and interactive.

What makes MCP so interesting is how simple and powerful it is. It's basically JSON-RPC for LLMs, allowing them to discover and use tools on demand. This opens up a whole new world of possibilities for automation and integration.

![Microsoft Learn Docs MCP Server](/images/posts/vibe-coding-microsoft-learn-docs-mcp-server.png)

The [Microsoft Learn Docs MCP server](https://learn.microsoft.com/en-us/training/support/mcp-get-started) is a great example. It lets you search Microsoft Docs and returns live results for the LLM to use - no more hallucinating or relying on stale data. Try it out, then let's build a simple MCP proxy tool.

## Inspecting MCP Traffic

Once you can use an MCP server, it's helpful to inspect the traffic. The [MCP Inspector](https://github.com/modelcontextprotocol/inspector) is perfect for this. I'm not a fan of installing Python or Node.js tools, but Copilot handled the setup for me:

![Installing MCP inspector](/images/posts/vibe-coding-installing-mcp-inspector.png)

From the [Microsoft Learn Docs MCP Server developer reference](https://learn.microsoft.com/en-us/training/support/mcp-developer-reference), here's what the [mcp.json file used by VSCode](https://code.visualstudio.com/docs/copilot/chat/mcp-servers) should look like:

```json
{
    "servers": {
        "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
        }
    }
}
```

Launch the MCP inspector from the command line, then open the link in your browser:

```bash
mamoreau@DEVOLUTIONS495:~/git/mcp-proxy-tool$ mcp-inspector
Starting MCP inspector...
🔍 MCP Inspector is up and running at http://127.0.0.1:6274 🚀
⚙️ Proxy server listening on 127.0.0.1:6277
🔑 Session token: da40cba93f37728bdd42788abd6c74185eeb280b0bbee9d2de23095376286a4f
Use this token to authenticate requests or set DANGEROUSLY_OMIT_AUTH=true to disable auth

🔗 Open inspector with token pre-filled:
   http://localhost:6274/?MCP_PROXY_AUTH_TOKEN=da40cba93f37728bdd42788abd6c74185eeb280b0bbee9d2de23095376286a4f
```

![MCP Inspector - Microsoft Learn Docs](/images/posts/vibe-coding-mcp-inspector-learn-docs.png)

## Model Context Protocol: The Basics


[MCP is quite simple at its core](https://modelcontextprotocol.io/specification/2025-06-18): it's just JSON-RPC over stdio or HTTP. You can list tools to discover what the MCP server supports, and let the LLM figure out when to call them.

One thing MCP doesn't (yet) support is named pipe transport, which would be useful as an alternative to stdio. Named pipes allow for OS-level access permissions, unlike TCP sockets, and avoid port conflicts. While launching a new process to communicate over stdio isn't practical for existing processes (like GUIs), nothing stops us from building a tool to proxy between stdio and a named pipe - bridging the gap and enabling MCP servers over named pipes.

## Copilot's Inner Loop: Building the MVP

GitHub Copilot in agent mode shines when it can iterate through the full feedback cycle: make changes, build, run, check output, repeat. My first goal was to build a simple command-line tool that acts as an MCP server over stdio, proxying requests to the Microsoft Learn Docs MCP server. Once functional, I could register my tool in VSCode instead of the original MCP server.

Here's how I approached it:

1. Make sample MCP calls to an HTTP MCP server
2. Proxy MCP calls from stdio to an HTTP MCP server
3. Build a command-line interface and remove hardcoded values

Starting with an existing MCP server helped a lot - Copilot could build and test against it, checking for server responses. I provided sample requests and responses from the MCP inspector, and pasted errors back into the chat until it started proxying successfully.

Adding a CLI was as simple as asking for it. Copilot defaulted to [clap](https://docs.rs/clap/latest/clap/) (popular, but increases binary size), so I asked for a lightweight alternative and it found [argh](https://crates.io/crates/argh). I just reviewed the code, requested tweaks, and let Copilot handle the rest. Still no manual code edits!

## Adding Support for More Transports

With a working executable proxying HTTP, I wanted to support more transport types:

1. Add outgoing stdio proxying support (in addition to HTTP)
2. Add outgoing named pipe proxying support (Linux)
3. Add outgoing named pipe proxying support (Windows)

Proxying to another MCP server over stdio was straightforward. Copilot even generated a mock MCP server for testing. For named pipes, it used a sample Python server. Windows named pipe support was trickier (since I was in WSL), so I had to commit, switch to Windows, and let Copilot iterate until it worked. Still, within a few hours, I had a functional multi-transport MCP proxy tool.

## GitHub Actions Workflows

Since my goal was to "vibe code" as much as possible, I resisted the urge to copy one of my existing GitHub Actions workflows. The workflow Copilot generated wasn't ideal: too many platform-specific scripts, not enough cross-platform PowerShell, and too much reliance on third-party actions for things that could be done in a few lines of PowerShell. I had to clarify my preferences.

![Github CLI for GitHub Actions](/images/posts/vibe-coding-github-cli-github-actions.png)

Another challenge: Copilot is great at iterating when it controls the full developer inner loop. With GitHub Actions, you have to push to a branch, launch the workflow, wait for it to finish, and check the logs. There's no MCP server for this (yet), so I used the [GitHub CLI](https://cli.github.com/) and manually instructed Copilot to use it. I worked on a test branch so Copilot could make lots of intermediate commits to squash later. At first, it wanted to test after every change, so I told it to wait until I was ready to run the workflow in CI.

![GitHub Actions workflow success](/images/posts/vibe-coding-github-actions-workflow-success.png)

It took some effort to get the workflow working properly, especially since testing in CI is much slower than building and running locally for all platforms, but I got it done.

## Using mcp-proxy-tool

Let's register and use `mcp-proxy-tool` to see it in action. Build [mcp-proxy-tool](https://github.com:/awakecoding/mcp-proxy-tool) from source, and install it locally:

```bash
git clone https://github.com:/awakecoding/mcp-proxy-tool
cd mcp-proxy-tool
cargo install --path .
```

If you install `mcp-proxy-tool` differently, either ensure it is in the PATH, or use the absolute path to the executable when following these instructions to add a new MCP server:

1. **Open the Command Palette**
   - Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac).
2. **Search for and select** `MCP: Add Server...`.
3. **Choose the 'Command (stdio)' transport**
4. **Enter the command to run:**
   - `mcp-proxy-tool --url https://learn.microsoft.com/api/mcp`
5. **Choose where to save the MCP server configuration**
   - Select `Workspace` (`.vscode/mcp.json` file)

After registering a new MCP server, you should see the mcp.json file in VSCode. Notice how it has clickable actions inside the JSON to start, stop, restart the MCP server. Click Start, and if everything worked, it should report at least one tool:

![VSCode mcp.json workspace file](/images/posts/vibe-coding-vscode-mcp-json-workspace-file.png)

You can see the list of MCP tools by clicking the "tool" icon from the GitHub Copilot chat window:

![VSCode MCP server list with tools](/images/posts/vibe-coding-mcp-server-list-with-tools.png)

Our "microsoft-learn-proxy" MCP server now lists the "microsoft_docs_search" tool, confirming that `mcp-proxy-tool` successfully forwards MCP requests to `https://learn.microsoft.com/api/mcp`!

For the full list of command-line arguments, use `mcp-proxy-tool --help`:

```bash
Usage: mcp-proxy-tool [-u <url>] [-c <command>] [-a <args>] [-p <pipe>] [-t <timeout>] [-v]

MCP Proxy Tool - Proxies MCP requests to remote HTTP-based or STDIO-based MCP servers

Options:
  -u, --url         URL of the remote HTTP-based MCP server to proxy requests to
  -c, --command     command to execute for STDIO-based MCP server
  -a, --args        arguments for the STDIO-based MCP server command
  -p, --pipe        path to named pipe for named pipe-based MCP server (Unix:
                    /path/to/pipe, Windows: pipename or \.\pipe\pipename)
  -t, --timeout     timeout in seconds for HTTP requests (ignored for STDIO and
                    named pipe)
  -v, --verbose     enable verbose logging
  --help, help      display usage information
```

In my case, I wanted this tool to connect to an MCP server using a named pipe transport currently being developed in [Remote Desktop Manager](https://devolutions.net/remote-desktop-manager/). While this MCP server is not yet available publicly, it worked on the first try using `mcp-proxy-tool -p RDM.MCP` for me. Hopefully this tool will pave the way to officially supporting named pipes as a transport in MCP!

## The Verdict

GitHub Copilot in VSCode with Claude Sonnet 4 is a game changer. I used to rely on ChatGPT, constantly copy-pasting code and context, but Copilot's agent mode eliminates all that manual effort. It automatically accesses your workspace, iterates on its own, and handles the entire developer inner loop - using build and run output as feedback to fix issues. The result is a much smoother, more productive coding experience.

## Closing Thoughts

This experiment was a real eye-opener. With Copilot agent mode, I was able to build a functional, multi-transport MCP proxy tool in Rust with minimal manual intervention. The process was fast, iterative, and surprisingly enjoyable. If you haven't tried "vibe coding" with Copilot agent mode yet, I highly recommend giving it a shot!
