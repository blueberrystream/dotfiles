@echo off

del /F "%USERPROFILE%\.bash_profile"
del /F "%USERPROFILE%\.bashrc"
del /F "%USERPROFILE%\.bashrc-alias"
del /F "%USERPROFILE%\.bashrc-function"
del /F "%USERPROFILE%\.bashrc-windows"
del /F "%USERPROFILE%\.gitconfig"
del /F "%USERPROFILE%\.gitignore"

mklink /H "%USERPROFILE%\.bash_profile" "%~dp0.bash_profile"
mklink /H "%USERPROFILE%\.bashrc" "%~dp0.bashrc"
mklink /H "%USERPROFILE%\.bashrc-alias" "%~dp0.bashrc-alias"
mklink /H "%USERPROFILE%\.bashrc-function" "%~dp0.bashrc-function"
mklink /H "%USERPROFILE%\.bashrc-windows" "%~dp0.bashrc-windows"
mklink /H "%USERPROFILE%\.gitconfig" "%~dp0.gitconfig"
mklink /H "%USERPROFILE%\.gitignore" "%~dp0.gitignore"

mklink /H "%USERPROFILE%\.git-completion" "%~dp0git\git\contrib\completion\git-completion.bash"
mklink /H "%USERPROFILE%\.git-prompt" "%~dp0git\git\contrib\completion\git-prompt.sh"
mklink /H "%USERPROFILE%\.dircolors" "%~dp0git\dircolors-solarized\dircolors.256dark"
