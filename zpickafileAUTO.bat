@echo off
if %errorlevel%==131 echo do pause 10
cd C:\Users\jamesmiller\Downloads\

REM Introduction splash
echo Jimmy's pick which bat file to process ffmpeg function AUTOMATED process
@echo:
@echo:



REM List out directories
echo List of directories in Downloads
@echo:
@echo:
@echo:
timeout 2 > NUL
dir /b/A:D
@echo:
@echo:



timeout 2 > NUL



REM Select Video folder
set /p fromFolder="SELECT VIDEO FOLDER ~~ Enter a directory from Downloads (press 'Tab' to cycle through folders). If the file is in 'Downloads', press 'Enter': "



REM Change to video folder
@echo:
@echo:
@echo:
@echo:
@echo:
cd %fromFolder%
echo Files within %fromFolder%
dir /b/o



REM Select the video file to convert
@echo:
@echo:
set /p fileToConvert="SELECT FILE FOR CONVERSION ~~ Enter file to convert (press 'Tab' to cycle through files): "
set fileToConvert=%fileToConvert:"=%


REM Analyse file for conversion
for %%a in ("%fromFolder%") do ffprobe -i "%fileToConvert%"

timeout 1 > NUL
@echo:
@echo:
echo   . . . The above output is for the bat file picking option . . .
@echo:
@echo:
@echo off
timeout 1 > NUL

cd C:\Users\jamesmiller\Desktop\Hard Drive\Projects\Technology\Scripts and Processes\ffmpeg\Automation\

echo Pick a bat file:
@echo:
@echo:
dir /b/o
@echo:
@echo:

set /p runThisFile=%runThisFile%

call "%runthisfile%"