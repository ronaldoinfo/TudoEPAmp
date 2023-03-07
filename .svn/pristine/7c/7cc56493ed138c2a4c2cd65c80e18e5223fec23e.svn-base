FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019

EXPOSE 80
EXPOSE 51329

RUN powershell c:\windows\system32\inetsrv\appcmd.exe set config \
-section:system.applicationHost/sites \
/siteDefaults.logFile.directory:"c:\logfiles" /commit:apphost

RUN powershell C:\Windows\System32\inetsrv\appcmd add apppool \
/apppool.name:TudoEpAmp /managedRuntimeVersion:v4.0 \
/managedPipelineMode:Classic \
/startMode:AlwaysRunning

RUN powershell New-Item -ItemType directory -Path C:\inetpub\wwwroot -Force

RUN powershell New-Item -Path "C:\temp" -Type Directory

RUN powershell New-Website -Name "TudoEpAmp" -Port 51329 -PhysicalPath "C:\inetpub\wwwroot" -ApplicationPool "TudoEpAmp"

RUN powershell C:\Windows\System32\inetsrv\appcmd set app "TudoEpAmp/" /preloadEnabled:true

RUN dism.exe /online /enable-feature /all /featurename:iis-webserver /NoRestart

COPY ./ ./inetpub/wwwroot