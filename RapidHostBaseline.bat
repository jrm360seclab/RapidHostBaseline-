@echo off
setlocal enabledelayedexpansion

:: ==========================================
:: RapidHostBaseline v1.0.0
:: Author: JRM360SecLab
:: Lightweight Windows host snapshot script
:: Captures system state for baseline comparison
:: ==========================================

:: ---- Create timestamp ----
:: Format: YYYY-MM-DD_HH-MM
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do set d=%%d-%%b-%%c
for /f "tokens=1-2 delims=: " %%a in ("%time%") do set t=%%a-%%b
set stamp=%d%_%t%

:: Remove spaces or invalid characters from time
set stamp=%stamp: =0%
set stamp=%stamp::=-%

:: ---- Output directory ----
:: Creates folder in current directory
set out=%~dp0Baseline_%stamp%
mkdir "%out%"

:: ---- System Information ----
:: OS, hardware, patch level, hostname, etc.
systeminfo > "%out%\systeminfo.txt"

:: ---- Running Processes ----
:: Includes PID, session, memory usage
tasklist /v > "%out%\processes.txt"

:: ---- Network Connections ----
:: Shows open ports + owning executables
netstat -bano > "%out%\netstat.txt"

:: ---- ARP Cache ----
:: Displays local network device mappings
arp -a > "%out%\arp.txt"

:: ---- Routing Table ----
:: Shows how traffic is routed from host
route print > "%out%\routes.txt"

:: ---- DNS Cache ----
:: Recently resolved domains
ipconfig /displaydns > "%out%\dns_cache.txt"

:: ---- Installed Programs ----
:: Pulls software list from registry
powershell "Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion | Format-Table -AutoSize" > "%out%\installed_programs.txt"

:: ---- Services ----
:: All services + states
sc query type= service state= all > "%out%\services.txt"

:: ---- Startup Entries ----
:: Programs configured to run at boot/login
powershell "Get-CimInstance Win32_StartupCommand | Select-Object Caption, Command | Format-Table -AutoSize" > "%out%\startup.txt"

:: ---- Scheduled Tasks ----
:: Includes hidden + verbose task details
schtasks /query /fo LIST /v > "%out%\scheduled_tasks.txt"

:: ---- User Accounts ----
:: Local users on system
net users > "%out%\users.txt"

:: ---- Local Administrators ----
:: Members of admin group
net localgroup administrators > "%out%\admins.txt"

:: ---- Firewall Rules ----
:: Full Windows Firewall rule listing
netsh advfirewall firewall show rule name=all > "%out%\firewall_rules.txt"

:: ---- Completion Message ----
echo.
echo RapidHostBaseline v1.0.0 complete.
echo Output saved to: %out%
pause
