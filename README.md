# Handyscripts
Handy POSIX(mostly) scripts I made for personal use.
##  Clone to /usr/local/bin and add to PATH. Set executable bit with chmod +x if necessary. These should work on most POSIX systems. I try to minimize dependency on sucky software like that made by the FSF/GNU. If these script are not suckless, or do not work with any POSIX compatible system, please let me know, also, if you make changes, I'd be grateful if you made a PR.

### Explanation of the scripts:
 - TTTS(Tiktok Text-To-Speech) is a script that abuses an API, that also abuses the Tiktok API: The unnoficial API it uses to connect to tiktok's API can only parse 300 characters per request. In this script that is contemplated and so the text is cut into parts. You can also pass the voice you want to use, like this: ttts "Gangzta!" "en_us_009". Or use it along with TGPT and whisper.cpp's "command" tool to make an assistant that can even run commands(using tgpt -s you can ask tgpt to produce commands).
 - OG++4.8 Is a wrapper for using an online compiler's API, currently, it does not support stdin or many libraries apart from those that come with g++. You can edit the og++4.8 script and change its version in the "compiler_cmd" variable. It is very OG.
 - ccat, or ColorCat is simply a wrapper for cat that uses source-highlight to highlight text whenever a deffinition file matches the content of the text. Really handy! I recommend doing an alias, since it behaves exactly like cat.
 - catservice and dogservice deliver fresh cat/dogs photos to your terminal (See the script and API documentation to change sizes, breeds, etc. Add to your shell's rc for maximum productivity)
 - bdl, or Binary Downloader is a simple script that downloads statically linked, pre-built programs to .local/shared/bin, it uses the most execellent collection of statically linked binaries: https://github.com/Azathothas/static-toolbox It has a hard dependency on eget(https://github.com/zyedidia/eget), jq and curl.
 - xpointerkeys simply enables X's pointerkeys feature "setxkbmap -option "keypad:pointerkeys".
 - Baker, it receives a file as an argument and copies it to <file>.bak, when invoked with -R it moves <file>.bak to <file>. When using -R do not suppply files ending in .bak, the script automatically detects them, if you want, you can do .bak.bak by using "baker <file>.bak", though I do not recommend you do that, it quickly becomes confusing. Keep in mind that -R does not switch places with <file> and <file>.bak, it moves <file>.bak to <file>.
 - woch is REALLY HANDY when working with a big PATH variable, or with "replacing" commands, woch receives a command as an argument and acts the same way as which, however, woch prints out an ordered list of where that command is in your PATH. If you have /usr/local/bin/cargo and /usr/bin/cargo, if woch were invoked with "cargo" as argument it'd print out this:
```
/usr/local/bin/cargo
/usr/bin/cargo
It is indeed really handy.
```

![image](https://github.com/xplshn/Handyscripts/assets/114888778/442b2ff0-ec1a-49eb-abf4-9eef15ecfcd0)
