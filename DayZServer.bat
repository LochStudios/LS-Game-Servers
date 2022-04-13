@echo off
:handles
::Server name (This is just for the bat file)
set serverName=[AU] Sentral.Network Dayz Server Starter
::Server files location
set serverLocation="C:\Program Files (x86)\Steam\steamapps\common\DayZServer"
::Server Port
set serverPort=2302
::Server config
set serverConfig=serverDZ.cfg
::Logical CPU cores to use (Equal or less than available)
set serverCPU=4
::Sets title for terminal (DONT edit)
title %serverName% batch
cls

:start
echo (%time:~0,-6%) %serverName% started.
::Launch parameters (edit end: -config=|-port=|-profiles=|-doLogs|-adminLog|-netLog|-freezeCheck|-filePatching|-BEpath=|-cpuCount=)
start "DayZ Server" /min "DayZServer_x64.exe" -config=%serverConfig% -port=%serverPort% "-profiles=config" "-mod=@CF;@Community-Online-Tools;@[AU] Sentral.Network Dayz LoadingScreen;@Airdrop-Upgraded;@InventoryPlusPlus;@BulletStacksPlusPlus;@Advanced Weapon Scopes;@TeddysWeaponPack;@VanillaPlusPlusMap;@TraderFixesAndFeatures;@BaseBuildingPlus;@Code Lock;@Unlimited Stamina;@DinkyItems;@Trader" -cpuCount=%serverCPU% -dologs -adminlog -netlog -freezecheck

:TimedRestart
IF %time:~0,-6%==06:00 goto kill
IF %time:~0,-6%==12:00 goto kill
IF %time:~0,-6%==18:00 goto kill
IF %time:~0,-6%==00:00 goto kill
goto TimedRestart

:kill
taskkill /im DayZServer_x64.exe /F
::Time in seconds to wait before..
timeout 10
::Go back to the top and repeat the whole cycle again
goto start