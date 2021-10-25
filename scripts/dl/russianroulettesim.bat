@echo off
SetLocal EnableDelayedExpansion

:a
cls
echo Random Russian Roulette Generator
echo ==================================
echo Please give person 1 a name:
set /p "p1=>"
echo Person 1's name is %p1%.
echo ==================================
echo Please give person 2 a name:
set /p "p2=>"
echo Person 2's name is %p2%.
echo ==================================
echo Player 1: %p1%
echo Player 2: %p2%
echo Is this right? (Y/N)
:prompt1
set/p "prompt=>"
if "%prompt%"=="y" goto cont1
if "%prompt%"=="Y" goto cont1
if "%prompt%"=="n" goto a
if "%prompt%"=="N" goto a
goto prompt1

:cont1
echo ==================================
echo Automated, or Manual? (A/M)
echo.
echo Automated: No input from user needed. Script just runs indefinitely.
echo Manual: The user must press a key before the next person attempts.
:prompt2
set /p "autoorno=>"
if "%autoorno%"=="a" goto autorun
if "%autoorno%"=="A" goto autorun
if "%autoorno%"=="m" goto manrun
if "%autoorno%"=="M" goto manrun
goto prompt2

:autorun
cls
echo Random Russian Roulette Generator
echo ==================================
echo Person 1's Name: %p1%
echo Person 2's Name: %p2%
echo Automated: Yes
echo ==================================
echo Assigning Trigger Number... (Loading Gun)
SET /a trignum=(%RANDOM%*6/32768)+1
echo Done.
echo The Trigger Number is %trignum%.
echo ==================================
set tick=1
set /a start=(%random%2/32768)+1
if %start% equ 1 goto p1auto
if %start% equ 2 goto p2auto

:p1auto
echo Shot %tick%
echo ==================================
echo Attemptor: %p1%
echo ==================================
set /a p1shot=(%RANDOM%*6/32768)+1
if %p1shot% equ %trignum% goto p1loss
echo MISS!
echo Trigger Number: %trignum%
echo Hit Number: %p1shot%
echo ==================================
set /a tick=%tick%+1
goto p2auto

:p1loss
echo HIT!
echo Trigger Number: %trignum%
echo Hit Number: %p1shot%
echo ==================================
echo Number of Shots: %tick%
echo ==================================
echo Would you like to go again? (Y/N)
:prompt2
set/p "prompt=>"
if "%prompt%"=="y" goto a
if "%prompt%"=="Y" goto a
if "%prompt%"=="n" exit
if "%prompt%"=="N" exit
goto prompt2

:p2auto
echo Shot %tick%
echo ==================================
echo Attemptor: %p2%
echo ==================================
set /a p2shot=(%random%*6/32768)+1
if %p2shot% equ %trignum% goto p2loss
echo MISS!
echo Trigger Number: %trignum%
echo Hit Number: %p2shot%
echo ==================================
set /a tick=%tick%+1
goto p1auto

:p2loss
echo HIT!
echo Trigger Number: %trignum%
echo Hit Number: %p2shot%
echo ==================================
echo Number of Shots: %tick%
echo ==================================
echo Would you like to go again? (Y/N)
:prompt2
set/p "prompt=>"
if "%prompt%"=="y" goto a
if "%prompt%"=="Y" goto a
if "%prompt%"=="n" exit
if "%prompt%"=="N" exit
goto prompt2

:manrun
cls
echo Random Russian Roulette Generator
echo ==================================
echo Person 1's Name: %p1%
echo Person 2's Name: %p2%
echo Automated: No
echo ==================================
echo Assigning Trigger Number... (Loading Gun)
SET /a trignum=(%RANDOM%*6/32768)+1
echo Done.
echo The Trigger Number is %trignum%.
pause
echo ==================================
set tick=1
set /a start=(%random%2/32768)+1
if %start% equ 1 goto p1man
if %start% equ 2 goto p2man

:p1man
echo Shot %tick%
echo ==================================
echo Attemptor: %p1%
echo ==================================
set /a p1shot=(%random%*6/32768)+1
if %p1shot% equ %trignum% goto p1loss
echo MISS!
echo Trigger Number: %trignum%
echo Hit Number: %p1shot%
pause
echo ==================================
set /a tick=%tick%+1
goto p2man

:p2man
echo Shot %tick%
echo ==================================
echo Attemptor: %p2%
echo ==================================
set /a p2shot=(%random%*6/32768)+1
if %p2shot% equ %trignum% goto p2loss
echo MISS!
echo Trigger Number: %trignum%
echo Hit Number: %p2shot%
pause
echo ==================================
set /a tick=%tick%+1
goto p1man