@echo off
setlocal enabledelayedexpansion

::Intro text

echo.
echo    ********************************************************
echo    ********* Florida Memory Combine Word Documents ********
echo    ********************************************************
echo.

echo.
echo Instructions:
echo.
echo 1. Locate the file called Add Word Documents.
echo 2. Drag and drop the files you want to combine.
echo 3. Add a name for the new file below.
echo 4. Click enter when you're ready to create the new file.
echo.

::determine current location
@REM set "main_location=C:\Users\%USERNAME%\Desktop\Merge Word Documents"
set "main_location=%~dp0"
::set word docs file
cd /d %main_location%\add-word-docs-here
::  DocxMerge.exe file
set "merge_tool=%main_location%\DocxMerge.exe"
:: Set the output location
set "output_location=C:\Users\%USERNAME%\Desktop"
::file type
set "file_type=.docx"

set "files="

for %%i in (*%file_type%) do set files=!files! "%%i"

::prompt user for file name
set /p user_name_input="Enter name: "

:: set the file name with timestamp
set TIMESTAMP=%DATE:/=-%_%TIME::=-%
set TIMESTAMP=%TIMESTAMP: =%
set "file_name=%user_name_input%_%TIMESTAMP%"

"%merge_tool%" -i %files% -o "%output_location%\%file_name%.docx" -f
