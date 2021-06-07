# D3D12nBodyGravity with clang build

This repo is the source from https://github.com/Microsoft/DirectX-Graphics-Samples/tree/master/Samples/Desktop/D3D12nBodyGravity, but only changed to using clang on windows to build.

**request**
1. need install [windows 10 SDK](https://developer.microsoft.com/en-US/windows/downloads/windows-10-sdk/) (this demo use 10.0.19041.0)
2. need install clang from conda (currently clang is 12.0)
```
conda install -c conda-forge clang
conda install -c conda-forge lld    # use lld linker instead of the default msvc linker
```
3. no need install visual studio

**build**
use `build.bat` to build, the output exe is located in `out/` directory. You can still use `src\D3D12nBodyGravity.sln` with visual studio to build, but that is not the purpose of this repo.

---
page_type: sample
languages:
- cpp
products:
- windows-api-win32
name: Direct3D 12 n-body gravity sample
urlFragment: d3d12-n-body-gravity-sample-win32
description: This sample demonstrates the use of asynchronous compute shaders (multi-engine) to simulate an n-body gravity system.
extendedZipContent:
- path: LICENSE
  target: LICENSE
---

# Direct3D 12 n-body gravity sample
![nBodyGravity GUI](src/D3D12nBodyGravity.png)

This sample demonstrates the use of asynchronous compute shaders (multi-engine) to simulate an n-body gravity system. Graphics commands and compute commands can be recorded simultaneously, and submitted to their respective command queues when the work is ready to begin execution on the GPU. This sample also demonstrates advanced usage of fences to synchronize tasks across command queues.

### Optional features
This sample has been updated to build against the Windows 10 Anniversary Update SDK. In this SDK a new revision of Root Signatures is available for Direct3D 12 apps to use. Root Signature 1.1 allows for apps to declare when descriptors in a descriptor heap won't change or the data descriptors point to won't change.  This allows the option for drivers to make optimizations that might be possible knowing that something (like a descriptor or the memory it points to) is static for some period of time.