@echo off
color 5f
title ***Saints Row Save Manager***
echo \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo \\\WARNING: THIS SOFTWARE IS QUITE BUGGY TO USE!\\
echo \\\MAKE SURE YOU HAVE ONLY ONE SAVE SLOT         \\
echo \\\sr3save_00.sr3s_pc !! !! !! !!                 \\
echo \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
set filename=

:menu
set /A randomseed = "%random% * %random%"
echo 1 = [36mLoad Character[0m
echo 2 = [32mSave Character[0m
echo 3 = [37mCharacter List[0m
echo 4 = [34mEdit Description[0m
echo 5 = [36mOpen Save Folder[0m
echo 6 = [31mDelete Character[0m
echo 7 = [37mRename Character[0m
echo 8 = [31mQuit[0m


set /P input=
goto :main

:main
if /i %input% == 1 goto :load
if /i %input% == 2 goto :save
if /i %input% == 3 goto :list
if /i %input% == 4 goto :desc
if /i %input% == 5 goto :expl
if /i %input% == 6 goto :delet
if /i %input% == 7 goto :renam
if /i %input% == 8 goto :eof

:load
SET /P "filename=Enter character name:"
if exist "%filename%\description.txt" (
type "%filename%\description.txt"
) ELSE (
echo No description.txt found.
)
copy /Y "%filename%\sr3save_00.sr3s_pc" "%cd%" >nul
copy /Y "%filename%\savedir.sr3d_pc" "%cd%" >nul
echo+"%filename% loaded."
goto :menu

:save
SET /P "filename=Enter character name: "
if exist "%filename%\description.txt" (
type "%filename%\description.txt"
) ELSE (
echo No description.txt found.
)
mkdir "%filename%"
ren "%filename%\sr3save_00.sr3s_pc" "sr3save_00.sr3s_pc.%randomseed%.bak" >nul
ren "%filename%\savedir.sr3d_pc" "savedir.sr3d_pc.%randomseed%.bak" >nul
copy /Y sr3save_00.sr3s_pc "%filename%" >nul
copy /Y savedir.sr3d_pc "%filename%" >nul
echo+"%filename% saved."
goto :menu

:desc
SET /P "filename=Enter character name: "
if exist "%filename%\description.txt" (
notepad "%filename%\description.txt"
goto :menu
) ELSE (
echo No description.txt found.
)
mkdir "%filename%" >nul
echo+%filename%>description.txt
move /Y "description.txt" "%cd%\%filename%\" >nul
notepad "%filename%\description.txt"
goto :menu

:delet
SET /P "filename=Enter character name: "
if exist "%filename%\description.txt" (
type "%filename%\description.txt"
) ELSE (
echo No description.txt found.
)
echo "Do you want to delete %filename%? (Y/N)"
del "%filename%" >nul
rd /S /Q "%filename%" >nul
echo+"%filename% deleted."
goto :menu

:expl
explorer %cd%
goto :menu

:renam
SET /P "filename=Enter character name: "
SET /P "filename2=Enter new character name: " 
ren "%filename%" "%filename2%" >nul
goto :menu

:list
dir /A:D /B
goto :menu
