# Handyscripts
Handy POSIX(mostly) scripts I made for personal use.
##  Clone to /usr/local/bin and add to PATH. Set executable bit with chmod +x if necessary. These should work on most POSIX systems. I try to minimize dependency on sucky software like that made by the FSF/GNU. If these script are not suckless, or do not work with any POSIX compatible system, please let me know, also, if you make changes, I'd be grateful if you made a PR.

### Explanation of the scripts:
 - TTTS(Tiktok Text-To-Speech) is a script that abuses an API, that also abuses the Tiktok API: The unnoficial API it uses to connect to tiktok's API can only parse 300 characters per request. In this script that is contemplated and so the text is cut into parts. You can also pass the voice you want to use, like this: ttts "Gangzta!" "en_us_009". Or use it along with TGPT and whisper.cpp's "command" tool to make an assistant that can even run commands(using tgpt -s you can ask tgpt to produce commands).
 - OG++4.8 Is a wrapper for using an online compiler's API, currently, it does not support stdin or many libraries apart from those that come with g++. You can edit the og++4.8 script and change its version in the "compiler_cmd" variable. It is very OG.
 - ccat, or ColorCat is simply a wrapper for cat that uses source-highlight to highlight text whenever a deffinition file matches the content of the text. Really handy! I recommend doing an alias, since it behaves exactly like cat.
 - xpointerkeys simply enables X's pointerkeys feature "setxkbmap -option "keypad:pointerkeys".
