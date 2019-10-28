$version = 0.1

$host.ui.RawUI.WindowTitle = 'AutoInstall-Chocolatey v' + $version # Set title

Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression

choco install nodejs-lts -y

choco install vscode -y

choco install chromium -y

choco install git -y