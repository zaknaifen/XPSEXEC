@ECHO OFF
IF NOT EXIST "log_track" (
echo .>>log_track)
:START
SET FILE=log_track
rem pause
	rem sprawdzenie wielkosci loga
		SET /a _Lines=0
		FOR /f %%j in ('Type %FILE%^|Find "" /v /c') DO SET /a _Lines=%%j
		rem Echo %FILE% has %_Lines% lines.
		IF %_Lines% GTR 100000 echo RESET>%FILE%
		rem pause
	 FOR /F "tokens=2,8,9 USEBACKQ" %%F IN (`tasklist /FI "USERNAME ne %USERNAME%" /FI "USERNAME ne SYSTEM" /FI "USERNAME ne LOCAL*" /FI "USERNAME ne N*" /V`) DO (
	rem FOR /F "tokens=2,8,9 USEBACKQ" %%F IN (`tasklist /FI "USERNAME eq %username%" /FI "imagename eq explo*" /V`) DO (
	SET @PID=%%F
			IF NOT "%%F"=="========" (
			IF %%F NEQ No (
			IF %%F NEQ Name (
			echo [%time%]%%F[]%%G_%%H>>%FILE%
			
			msg * WARNING[%time%]%%F[]%%G_%%H
			))))
			
GOTO START
:EXIT
rem pause