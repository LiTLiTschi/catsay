Unicode True
Name "catsay"
OutFile "catsay-setup.exe"
InstallDir "$LOCALAPPDATA\Programs\catsay"
InstallDirRegKey HKCU "Software\catsay" "Install_Dir"
RequestExecutionLevel user
ShowInstDetails show

Section "Install"
  SetOutPath "$INSTDIR"
  File "catsay.exe"
  WriteRegStr HKCU "Software\catsay" "Install_Dir" "$INSTDIR"
  ReadRegStr $0 HKCU "Environment" "PATH"
  StrCmp $0 "" 0 +2
  StrCpy $0 "$INSTDIR"
  StrCpy $0 "$0;$INSTDIR"
  WriteRegExpandStr HKCU "Environment" "PATH" "$0"
  SendMessage ${HWND_BROADCAST} ${WM_WININICHANGE} 0 "STR:Environment" /TIMEOUT=1000
  WriteUninstaller "$INSTDIR\uninstall.exe"
SectionEnd

Section "Uninstall"
  Delete "$INSTDIR\catsay.exe"
  Delete "$INSTDIR\uninstall.exe"
  RMDir "$INSTDIR"
  DeleteRegKey HKCU "Software\catsay"
SectionEnd
