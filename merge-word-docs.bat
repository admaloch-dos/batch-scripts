@echo off
setlocal enabledelayedexpansion

::location of direc (make sure DocxMerge.exe is located here)
cd /d C:\Users\%USERNAME%\Desktop\react-intro-notes

::file type
set "file_type=.txt"

set "files="

for %%i in (*%file_type%) do set files=!files! "%%i"

::output location
set "name=react-intro-notes"

::run with docMerge
DocxMerge.exe -i %files% -o "%name%.docx" -f