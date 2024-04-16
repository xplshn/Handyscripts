
<p align="center">
    <a href="https://github.com/xplshn/Handyscripts">Handyscripts</a>
  <br>
  <img src="https://github.com/xplshn/Handyscripts/assets/58171889/8f887560-c782-4060-af7c-48072733d86b" width="200" />
</p>


#### These should work on most POSIX systems. I try to minimize dependency on sucky software like that made by the FSF/GNU. If these script are not suckless, or do not work with any POSIX compatible system, please let me know, also, if you make changes, I'd be grateful if you made a PR.
---
- #### Setup & Config
> 1. **Clone** to `/usr/local/bin` and OR/AND any place in your `$PATH`
> 2. Set executable bit with `chmod +x`.
---
- [**Baker**<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bash/bash-original.svg" width="30" height="30">](https://github.com/xplshn/Handyscripts/blob/main/baker) **➼** Rreceives a file as an argument and copies it to `<file>.bak`, when invoked with `-R` it moves `<file>.bak` to `<file>`.
> - When using -R do not suppply files ending in .bak, the script automatically detects them, if you want, you can do .bak.bak by using "baker <file>.bak", though I do not recommend you do that, it quickly becomes confusing. Keep in mind that -R does not switch places with <file> and <file>.bak, it moves <file>.bak to <file>.
---
- [**bdl (Binary Downloader)**<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bash/bash-original.svg" width="30" height="30">](https://github.com/xplshn/Handyscripts/blob/main/ccat) **➼** Simple script that downloads `~ 1000` *statically linked*, *pre-built programs* to `.local/shared/bin` from : [Azathothas/Toolpacks](https://github.com/Azathothas/Toolpacks) `|` [Azathothas/Static-Binaries](https://github.com/Azathothas/Static-Binaries) `|` [Azathothas/static-toolbox](https://github.com/Azathothas/static-toolbox)
> - It can Run(without installing), Install, Remove, List or give Info about programs or Search them (Fuzzy search that matches agains descriptions and package names).
> > ```bash
> > ❯ Usage: bdl {run|install|remove|search|info|list|tldr} <PACKAGE_NAME>
> > 
> > curl -qfsSL "https://raw.githubusercontent.com/xplshn/Handyscripts/main/bdl" | bash -s -- {OPTIONS_HERE}
> > #Example
> > curl -qfsSL "https://raw.githubusercontent.com/xplshn/Handyscripts/main/bdl" | bash -s --  run neofetch
> > ```
> - The Run option runs programs from /tmp, it caches them to a file, so if you run a program with the flag run more than one time, the second time it will not have to download the program anymore, if more than 40+ programs are cached, the cache deletes the first 40+ programs. It uses TMPFS for this behavior. Please edit the script to your likings, the first part of it contains variables you can change.
> - It is not POSIX, but it works under BASH and shells which support extended POSIX. If you know how to fix that, how to make it suck less, I'd be grateful if you'd make an issue or a PR. For now, in the first run it will bootstrap bash by grabbing the binary from the Buildbase repo and then on subsequent runs it will use bash. The syntax is POSIX but MIGHT rely on undefined behaviour (When running under SH).
> - Implemented in 363LOC! # Could be smaller but has many features.
> - Rewritten in Golang: [bigDL](https://github.com/xplshn/bigdl)
[![asciicast](https://asciinema.org/a/FzUYlDLumlbv3vYWjAa1BmYBx.svg)](https://asciinema.org/a/FzUYlDLumlbv3vYWjAa1BmYBx)
---
- [**ccat (ColorCat)**<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bash/bash-original.svg" width="30" height="30">](https://github.com/xplshn/Handyscripts/blob/main/ccat) **➼** Wrapper for cat that uses source-highlight to highlight text whenever a deffinition file matches the content of the text. Really handy! I recommend doing an alias, since it behaves exactly like cat.
---
- [**catservice**<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bash/bash-original.svg" width="30" height="30">](https://github.com/xplshn/Handyscripts/blob/main/catservice) `|` [**dogservice**<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bash/bash-original.svg" width="30" height="30">](https://github.com/xplshn/Handyscripts/blob/main/dogservice) **➼** catservice and dogservice deliver fresh cat/dogs photos to your terminal (See the script and API documentation to change sizes, breeds, etc. Add to your shell's rc for maximum productivity)
> ![image](https://github.com/xplshn/Handyscripts/assets/114888778/442b2ff0-ec1a-49eb-abf4-9eef15ecfcd0)
---
- [**OG++4.8**<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bash/bash-original.svg" width="30" height="30">](https://github.com/xplshn/Handyscripts/blob/main/og%2B%2B4.8) **➼** Wrapper for using an online compiler's API, currently, it does not support stdin or many libraries apart from those that come with g++. You can edit the og++4.8 script and change its version in the "compiler_cmd" variable. It is very OG.
---
- [**TTTS(Tiktok Text-To-Speech)**<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bash/bash-original.svg" width="30" height="30">](https://github.com/xplshn/Handyscripts/blob/main/ttts) **➼** is a script that abuses an API, that also abuses the Tiktok API
> - The unnoficial API it uses to connect to tiktok's API can only parse 300 characters per request. In this script that is contemplated and so the text is cut into parts. You can also pass the voice you want to use, like this: ttts "Gangzta!" "en_us_009". Or use it along with TGPT and whisper.cpp's "command" tool to make an assistant that can even run commands(using tgpt -s you can ask tgpt to produce commands).
> - See [voices_ttts.md](https://github.com/xplshn/Handyscripts/blob/main/voices_ttts.md)
---
- [**whoch**<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bash/bash-original.svg" width="30" height="30">](https://github.com/xplshn/Handyscripts/blob/main/whoch) **➼** REALLY HANDY when working with a big PATH variable, or with "replacing" commands, whoch receives a command as an argument and acts the same way as which, however, whoch prints out an ordered list of where that command is in your PATH.
> - If you have `/usr/local/bin/cargo` and `/usr/bin/cargo`, if whoch were invoked with "cargo" as argument it'd print out this:
> ```bash
> $ whoch cargo
> #output
> /usr/local/bin/cargo
> /usr/bin/cargo
> ```
- [**pelf**<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bash/bash-original.svg" width="30" height="30">](https://github.com/xplshn/Handyscripts/blob/main/pelf) **➼** PELF or rather, portable elf is a utility that creates a bundle of a dynamic binary, it takes a binary and budles its dependencies into a single, executable file.
> - It needs tar, base64, tail and other commands. It is POSIX2008 compatible. It has proven to work on Alpine and .blobs generated across other systems work too (There might be some exceptions due to ABI differences.) of the same libc, one may use patchelf to change the interpreter prior to packing the binary. The compression can be changed by modifying the script, keep in mind that using base64 will expand the size of data by 37.6%, one can also use [`ascii85`](https://github.com/xplshn/m_ascii85) which only expands size by 13%.
> ```sh
> $ pelf $(which chocolate-doom) ./chocolate-doom.blob # The name can not be set arbitrarily.
> $ ./chocolate-doom.blob
>                          Chocolate Doom 3.0.1
> Z_Init: Init zone memory allocation daemon. 
> zone memory: 0x7fd294494020, 1000000 allocated for zone
> Using /tmp/.local/share/chocolate-doom/ for configuration and saves
> V_Init: allocate screens.
> M_LoadDefaults: Load system defaults.
> saving config in /tmp/.local/share/chocolate-doom/default.cfg
> Game mode indeterminate.  No IWAD file was found.  Try
> specifying one with the '-iwad' command line parameter.
> # as you can see, it works. Most programs can be packed this way, even graphical ones ; Some others may require you to create wrappers, to add extra binaries or libraries which do not appear in ldd's output.
> # I've also managed to pack my window manager along with a few X utils into a single file (programs packed alongside each other can be accessed from the main program's PATH)
> # An example you can try to see the capabilities of PELF is to pack the xfce4-terminal into a single binary, ofc PELF won't track python dependencies, or schemas or other misc files a program may need, but you can still use the --add-arbitrary functionality and create a wrapper for the main binary, then add the real binary with --add-binary.
> # You can also create "development boxes", a binary which when executed launches a shell with a custom PATH and LD_LIBRARY_PRELOAD, the dev box can contain Golang, Make, Zig C as a portable C compiler, Rust's Cargo, etc, all by creating a wrappper that modifies some env variables (e,g for Go; GOROOT="$(dirname "$devbox_bindir")/go") and using --add-arbitrary to add the necessary folders which contain the language's files
> ```
- [**xpointerkeys**<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bash/bash-original.svg" width="30" height="30">](https://github.com/xplshn/Handyscripts/blob/main/xpointerkeys) **➼** Enables X's pointerkeys feature "setxkbmap -option "keypad:pointerkeys".
---
