@echo off

:main
cls
echo.
echo.
echo       =====================================
echo          ChargeThreshold Easier UI    
echo.
echo        1.-Status  =^> Shows current 
echo                      configuration if any.
echo        2.-Set up  =^> Set up and enable
echo                      threshold.
echo        3.-Disable =^> Disables threshold.
echo.
echo        4.-Leave
echo                                      -Jir
echo       =====================================
echo.



Choice /C 1234 /N /M "[Command Number?]:"

if errorlevel 4 (
        goto end
    ) else if errorlevel 3 (
        goto disable
    ) else if errorlevel 2 (
        goto setup
    ) else if errorlevel 1 (
        goto status
    ) 
goto :eof

:status
ChargeThreshold status

pause>nul
goto main

:setup
echo  Set up: Input the battery percentage to stop charging
echo          then, input the percentage to restart charging,
echo          second field is optional.
echo.
set /p max=[Percentage to stop]:
set /p min=[Percentage to recharge]:
echo.

if [%min%]==[] (
	ChargeThreshold on %max% 
) else (
	ChargeThreshold on %max% %min%
)


pause>nul
goto main

:disable
ChargeThreshold off

pause>nul
goto main

:end
echo.
echo See ya ^<3 &pause>nul
goto :eof