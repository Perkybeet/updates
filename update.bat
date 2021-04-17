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
ren YNotes.deps.json.temp YNotes.deps.json
ren YNotes.dll.temp YNotes.dll
ren Ynotes.exe.temp Ynotes.exe
ren Ynotes.pdb.temp Ynotes.pdb
ren YNotes.runtimeconfig.dev.json.temp YNotes.runtimeconfig.dev.json
ren YNotes.runtimeconfig.json.temp YNotes.runtimeconfig.json
timeout /T 1
start YNotes.exe