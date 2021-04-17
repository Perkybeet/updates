@ECHO OFF
ECHO YNotes Actualizacion
ECHO =============================
ECHO.
ECHO.
ECHO Cerrando aplicación...

:LOOP
tasklist ynotes >nul 2>&1
IF ERRORLEVEL 1 (
  GOTO CONTINUE
) ELSE (
  TIMEOUT /T 5
  GOTO LOOP
)

:CONTINUE
ECHO.
ECHO Borrando archivos...
del /f /q YNotes.deps.json
del /f /q YNotes.dll
del /f /q Ynotes.exe
del /f /q Ynotes.pdb
del /f /q YNotes.runtimeconfig.dev.json
del /f /q YNotes.runtimeconfig.json
timeout /T 1
ECHO Actualizando archivos...
ren 1.temp YNotes.deps.json
ren 2.temp YNotes.dll
ren 3.temp Ynotes.exe
ren 4.temp Ynotes.pdb
ren 5.temp YNotes.runtimeconfig.dev.json
ren 6.temp YNotes.runtimeconfig.json
timeout /T 1
start YNotes.exe