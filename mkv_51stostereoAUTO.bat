@echo off
if %errorlevel%==131 echo do pause 10
cd C:\Users\jamesmiller\Downloads\

REM Introduction splash
echo Jimmy's - ffmpeg: '5.1(side) to Stereo' AUTOMATED converter
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
set fileMetadataName=%fileOutputName:~0,-7%



REM Perform ffmpeg conversion
@echo:

for %%a in ("%fromFolder%") do ffmpeg -i "%fileToConvert%" -vcodec copy -acodec aac -af:a:0 "pan=stereo|FL=FC+0.50*FL+0.50*SL+0.50*LFE|FR=FC+0.50*FR+0.50*SR+0.50*LFE" -metadata title="%fileMetadataName%" "%fileOutputName%.mp4"

timeout 2 > NUL

REM Transfer option
@echo:
@echo:

echo Copy to NAS - Movies? Press <spacebar> to transfer file. Press 'c' to cancel transfer.

echo File transferring........
copy "%fileOutputName%.mp4" Y:\