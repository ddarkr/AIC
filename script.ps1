$version = 0.1

$host.ui.RawUI.WindowTitle = 'AutoInstall-Chocolatey v' + $version # Set title

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression

choco install nodejs-lts vscode git phpstorm php composer -y
