REM Combine multiple mp3 file into 1 file for audiobook

@echo off
setLocal EnableDelayedExpansion

dir/s/b *.mp3 > input.txt

for /f "tokens=* delims= " %%a in (input.txt) do (
set /a N+=1
echo ^file '%%a^'>>mylist.txt
)

ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp3
del input.txt
del mylist.txt
