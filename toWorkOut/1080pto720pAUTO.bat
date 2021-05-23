REM 1080p to 720p conversion compontent for ffmpeg AUTOMATED process
echo '1080p to 720p' conversion compontent for ffmpeg AUTOMATED process

@echo off
if %errorlevel%==131 echo do pause 10
cd C:\Users\jamesmiller\Downloads\

REM Introduction splash
echo Jimmy's - ffmpeg: '5.1 to Stereo' AND '1080p to 720p' converter
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
