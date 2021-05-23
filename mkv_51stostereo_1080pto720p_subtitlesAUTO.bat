@echo off
if %errorlevel%==131 echo do pause 10
cd C:\Users\jamesmiller\Downloads\

REM Introduction splash
echo Jimmy's - ffmpeg: '5.1(side) to Stereo' AND '1080p to 720p' AND 'Subtitles' AUTOMATED converter
@echo:
@echo:



REM List out directories
REM ~echo List of directories in Downloads
REM ~dir /b/A:D
REM @echo:



REM Select Video folder
REM ~set /p fromFolder="SELECT VIDEO FOLDER ~~ Enter a directory from Downloads. If the file is in 'Downloads', press 'Enter': "



REM Change to video folder
REM ~@echo:
cd %fromFolder%
REM ~echo Files within %fromFolder%
REM ~dir /b/o



REM Select the video file to convert
REM @echo:
REM @echo:
REM ~set /p fileToConvert="SELECT FILE FOR CONVERSION ~~ Enter file to convert: "
REM ~set fileToConvert=%fileToConvert:"=%



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
set fileMetadataName=%fileOutputName:~0,-7%



REM Perform ffmpeg conversion
@echo:


for %%a in ("%fromFolder%") do ffmpeg -i "%fileToConvert%" -c:v libx264 -crf 20 -vf scale=1280:720 -acodec aac -af:a:0 "pan=stereo|FL=FC+0.50*FL+0.50*SL+0.50*LFE|FR=FC+0.50*FR+0.50*SR+0.50*LFE" -metadata title="%fileOutputName%" "%fileOutputName%.mp4"



REM Transfer option
@echo:
@echo:

echo Copy to NAS - Movies? Press <spacebar> to transfer file. Press 'c' to cancel transfer.
pause
copy "%fileOutputName%.mp4" Y:\
