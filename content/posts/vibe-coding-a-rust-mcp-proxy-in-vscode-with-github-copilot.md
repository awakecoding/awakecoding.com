+++
title = "Vibe coding a Rust MCP proxy in VSCode with GitHub Copilot"
slug = "vibe-coding-a-rust-mcp-proxy-in-vscode-with-github-copilot"
date = 2025-07-28
description = ""

[taxonomies]
tags = ["MCP", "Rust", "CTO"]

[extra]
banner = "/images/banners/vibe-coding-a-rust-mcp-proxy-in-vscode-with-github-copilot.png"
+++

This blog post relates my experience vibe coding [mcp-proxy-tool](https://github.com/awakecoding/mcp-proxy-tool), a simple MCP proxying tool in Rust.

Until recently, I was still doing most of my development work in ChatGPT, with a lot of back and forth and copy/pasting of error messages, and requests for modifications. I was not prepared for what I had missed with the GitHub Copilot agent mode with Claude Sonnet, and I will never look back. I wanted to try developing a fully functional tool without touching a single line of code manually, and it did not disappoint.

Install Rust using [rustup](https://rustup.rs/).

You will need a GitHub account, and to register for [GitHub Copilot](https://github.com/features/copilot). Don't worry, there's a free version, but I recommend looking into the paid tier for access to the premium models.

I'll be using Ubuntu 22.04 in WSL with the [mirrored networking mode](https://learn.microsoft.com/en-us/windows/wsl/networking#mirrored-mode-networking). Why? Just a hunch that it'll make some things easier.

```bash
cargo new mcp-proxy-tool
cd mcp-proxy-tool
code .
```

Follow the instructions to set up [GitHub Copilot in VSCode](https://code.visualstudio.com/docs/copilot/setup).

In the Copilot chat, select the [agent mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) and [change the model](https://code.visualstudio.com/docs/copilot/language-models) to the latest version of [Claude Sonnet](https://www.anthropic.com/claude/sonnet) available.

## Microsoft Learn Docs MCP Server

Do you remember when RAG (Retrieval Augmented Generation) was all the rage? Models are trained on large data sets. While they can provide impressive results with training data alone, they usually fall short or "hallucinate" unless augmented by live, known-to-be-accurate data. Here comes the Model Context Protocol (MCP), which is pretty much JSON-RPC for LLMs. Now your agent can just... call tools from MCP servers as needed instead of relying on solely on trained data. The Microsoft Learn Docs MCP server is just that: a single tool to search the docs and return live search results that the LLM will use. Simple, but effective.

[Get started with the Microsoft Learn Docs MCP server](https://learn.microsoft.com/en-us/training/support/mcp-get-started)

Try it out! Then we'll work on building a simple MCP proxy tool.

## Inspecting MCP Traffic

Now that you can *use* an MCP server, let's move to inspecting it more closely using the [MCP Inspector](https://github.com/modelcontextprotocol/inspector). Now if there's one thing I loathe more than installing Python tools, it's installing a tool that uses [Node.js](https://nodejs.org/). To be fair, it probably isn't that bad, but I'm just not familiar with the tooling and I usually run into errors I don't feel like researching. Thankfully, I could leave that boring work to the GitHub Copilot agent to figure out for me:

![Installing MCP inspector](/images/posts/vibe-coding-installing-mcp-inspector.png)

From the [Microsoft Learn Docs MCP Server developer reference](https://learn.microsoft.com/en-us/training/support/mcp-developer-reference), we know that the [mcp.json file used by VSCode](https://code.visualstudio.com/docs/copilot/chat/mcp-servers) should look like this:

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

Launch the MCP inspector from the command-line, then open the link in your browser:

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

## Model Context Protocol

At its core, [MCP is quite simple](https://modelcontextprotocol.io/specification/2025-06-18): JSON-RPC over [stdio or HTTP](https://modelcontextprotocol.io/specification/2025-06-18/basic/transports). You list tools to discover what the MCP server supports, and then you let the LLM figure out when to call them.

One thing MCP doesn't (yet) support is a named pipe transport, which would be very useful as an alternative to the standard input/output transport. For local IPC, named pipes have the advantage of supporting operating system access permissions in the same way filesystem access does. TCP sockets don't support this, and also have the issue of running too easily into port conflicts. Launching a new process to communicate with it over standard input/output is not practical when you want it to talk to an *existing* process, especially for a GUI application. However, nothing prevents us from building a simple tool to proxy between stdio and a named pipe to bridge this gap, and start building MCP servers over named pipes.

## Building the MVP

GitHub Copilot in Agent mode works best when it can iterate with a full feedback cycle it can control: make changes, build project, run it, check output, repeat. The first goal will be to build a simple command-line tool that acts as an MCP server over stdio that proxies the requests to the Microsoft Learn Docs MCP server. Once this is functional, we should be able to register our tool in VSCode instead of the original MCP server. Here is what the first steps looked like:

1. Make sample MCP calls to an HTTP MCP server
2. Proxy MCP calls from stdio to an HTTP MCP server
3. Build command-line interface, remove hardcoded values

To get boostrapped, what really helped was starting with an *existing* MCP server, because GitHub Copilot could build and test against it, checking for server responses. It had to iterate a few times to get it right, and I provided it with sample requests and responses obtained from the MCP inspector tool. I then used MCP inspector to connect to my executable, and pasted the errors back into the chat until it finally started proxying MCP successfully.

Adding a command-line interface was as simple as asking for it. By default, it used [clap](https://docs.rs/clap/latest/clap/) which is a very popular Rust crate for CLI parsing, with the downside of increasing executable size. I asked for a lightweight alternative, and it found [argh](https://crates.io/crates/argh) which is optimized for code size. All I had to do what look at the code, see what I'd like changed, and ask for it. That's it, I still haven't touched a single line of code manually.

## Adding support for more transports

Now that I've got an executable that can act as an MCP server that proxies requests to an outgoing HTTP server, I want to expand the supported transport types. Here are the steps I took, in order:

1. Add outgoing stdio proxying support (in addition to HTTP)
2. Add outgoing named pipe proxying support (for Linux)
3. Add outgoing named pipe proxying support (for Windows)

Proxying MCP requests to another MCP server executable over stdio was relatively easy. What surprised me is that GitHub Copilot used the output from the HTTP-based MCP server and generated a mock MCP server from it to test against, iterating until everything was working as expected. For the named pipe transport, it used the same strategy with a sample Python named pipe server. Where it started falling short is with the Windows named pipe support: I'm in WSL, so it could not easy test it. It generated code which didn't build, so I had to commit the code, switch to Windows, then let it iterate until it worked.

This being said, this is very impressive: with a few hours I already had a functional multi-transport MCP proxying tool.

## GitHub Actions Workflows

Because my goal was to see how far I could "vibe code" a simple tool, I had to resist the urge of copying and adapting one of my existing GitHub Actions workflows. The workflow it generated wasn't to my liking: too much platform-specific scripts instead of cross-platform PowerShell, and too much reliance on third-party GitHub Actions for things that can be done with a few lines of PowerShell. Granted, this is not what most developers do, so I had to tell it my personal preferences.

![Github CLI for GitHub Actions](/images/posts/vibe-coding-github-cli-github-actions.png)

The second problem is obvious in hindsight: GitHub Copilot is *really* good at iterating by itself if it can do the full "developer inner loop" by itself. With a GitHub Actions workflow, you have to push to a branch, launch the workflow, wait for it to finish, check the logs, etc. As far as I know there's no MCP server for this yet, so I used the [GitHub CLI](https://cli.github.com/) and manually instructed GitHub Copilot to use it. I made sure to use a test branch first so it could make a lot of intermediate commits that I could squash later. At first, it would test after every change, so I had to tell it to wait until I was ready to do test workflow run in the CI.

![GitHub Actions workflow success](/images/posts/vibe-coding-github-actions-workflow-success.png)

I'll admit it took a bit of effort to get the workflow working properly, especially since it's much slower to test when you can't just build and run locally for all platforms in the same way the CI environment does, but I managed to get it done nonetheless.
