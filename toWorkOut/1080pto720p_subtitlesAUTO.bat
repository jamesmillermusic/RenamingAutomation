REM 'Subtitles' AND '1080p to 720p' conversion compontents for ffmpeg AUTOMATED process
echo 'Subtitles' AND '1080p to 720p' conversion compontents for ffmpeg AUTOMATED process

@echo off
if %errorlevel%==131 echo do pause 10

cd %fromFolder%


REM Select the subtitle folder
@echo:
@echo:
set /p subtitleFolder="SELECT SUBTITLE FOLDER ~~ Enter a directory from Downloads. If the subtitle file is in this folder, press 'Enter': "
set subtitleFolder
cd %subtitleFolder%
copy *.srt  C:\Users\jamesmiller\Downloads\%fromFolder%



REM Navigate up one directory
cd ..



REM Choose the subtitle file to convert to .ass
@echo:
@echo:
set /p subtitleFileConvert="SELECT SUBTITLE ~~ Choose subtitle file (without the extension): "
set subtitleFileConvert=%subtitleFileConvert:"=%



REM ffmpeg Conversion from .srt to .ass
for %%a in ("%fromFolder%") do ffmpeg -i "%subtitleFileConvert%.srt" "%subtitleFileConvert%.ass"



REM Rename the file to convert
@echo:
@echo:
set /p fileOutputName="RENAME FILE FOR CONVERSION ~~ Set new filename (without the extension): "
set fileOutputName=%fileOutputName:"=%



REM Perform ffmpeg conversion
@echo:


for %%a in ("%fromFolder%") do ffmpeg -i "%fileToConvert%" -c:v libx264 -crf 20 -vf scale=1280:720 -acodec aac -af:a:0 "pan=stereo|FL=FC+0.50*FL+0.50*BL+0.50*LFE|FR=FC+0.50*FR+0.50*BR+0.50*LFE" -metadata title="%fileOutputName%" "%fileOutputName%.mp4"



REM Transfer option
@echo:
@echo:

echo Copy to NAS - Movies? Press <spacebar> to transfer file. Press 'c' to cancel transfer.
pause
copy "%fileOutputName%.mp4" Y:\
