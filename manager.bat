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
echo 1 = [36mLoad Character[0m
echo 2 = [32mSave Character[0m
echo 3 = [37mCharacter List[0m
echo 4 = [34mEdit Description[0m
echo 5 = [36mOpen Save Folder[0m
echo 6 = [31mQuit[0m


set /P input=
goto :main

:main
if %input% == 1 (
goto :load

) ELSE if %input% == 2 (
goto :save
) ELSE if %input% == 3 (
dir /A:D /B
pause>nul
goto :menu
) ELSE if %input% == 4 (
goto :desc
)
) ELSE if %input% == 5 (
goto :expl
)
) ELSE if %input% == 6 (
goto :eof
)

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
pause>nul
goto :menu

:save
SET /P "filename=Enter character name: "
if exist "%filename%\description.txt" (
type "%filename%\description.txt"
) ELSE (
echo No description.txt found.
)
mkdir "%filename%"
copy /Y sr3save_00.sr3s_pc "%filename%" >nul
copy /Y savedir.sr3d_pc "%filename%" >nul
echo+"%filename% saved."
pause>nul
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
pause>nul
goto :menu

:expl
explorer %cd%
goto :menu
