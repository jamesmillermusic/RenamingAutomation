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
dir /b/A:D
@echo:
@echo:






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
REM set audio_channel_format=for %%a in ("%fromFolder%") do ffprobe -v error -select_streams a:0 -show_entries stream=channel_layout -of csv=s=x:p=0 "%fileToConvert%"
set "CommandLine=ffprobe -v error -select_streams a:0 -show_entries stream=channel_layout -of csv=s=x:p=0 "%fileToConvert%""
setlocal EnableDelayedExpansion
for /F "delims=" %%I in ('!CommandLine!') do set "audio_channel_format=%%I"

echo %audio_channel_format%
timeout 1 > NUL
echo Finding correct batch file . . .

timeout 3 > NUL
cd C:\Users\jamesmiller\Desktop\Hard Drive\Projects\Technology\Scripts and Processes\ffmpeg\Automation\

echo . . . Batch file found. Commencing conversion.
timeout 1 > NUL

if "%audio_channel_format%" == "stereo" call mkv_mp4ATUO.bat
if "%audio_channel_format%" == "5.1" call mkv_51tostereoAUTO.bat
if "%audio_channel_format%" == "5.1(side)" call mkv_51stostereoAUTO.bat
REM if(!"%audio_channel_format%" == "stereo" && !"%audio_channel_format%" == "5.1" && !"%audio_channel_format%" == "5.1(side)")) (echo addThisToTheAuto)
