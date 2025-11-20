+++
title = "LLMs on a Plane with LM Studio and VSCode"
slug = "llms-on-a-plane-with-lm-studio-and-vscode"
date = 2025-11-17
description = ""

[taxonomies]
tags = ["AI", "VSCode", "CTO"]

[extra]
banner = "/images/banners/isolating-a-windows-service-process-for-easier-debugging.png"
+++

## Hardware

I've got a Dell XPS 15 9530 with 64GB of RAM and 2 TB of SSD, but what truly matters is my NVIDIA GeForce RTX 4060 Laptop GPU with 8GB of VRAM:

![LM Studio hardware info](/images/posts/llms-on-a-plane-lm-studio-hardware-info.png)

You can load models partially in GPU and CPU memory, but from my experience, it becomes very sluggish the moment you use CPU memory.

## Choosing a model

I recommend starting with a small model that has a good chance of running smoothly. At the time of writing this, `ibm/granite-4-h-tiny` is a good choice. It's just a few GB on disk, and it fits comfortably within my 8GB of GPU memory:

![LM Studio models](/images/posts/llms-on-a-plane-lm-studio-models.png)

I suggest downloading a few additional models to compare. Next, load the model from the chat window. Increase the context length from 4096 to something higher like 10000, make sure GPU offload is at the maximum, check "remember settings" before clicking "load model".

![LM Studio loading IBM granite tiny](/images/posts/llms-on-a-plane-loading-ibm-granite-tiny.png)

In the chat, try the following:

> write the movie plot for "LLMs on a plane"

![LM Studio chat movie plot sample](/images/posts/llms-on-a-plane-chat-movie-plot-sample.png)

If everything worked well, you should see a movie plot generated very smoothly!
