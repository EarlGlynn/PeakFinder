// "INI Library" to store user-specific information about application.
// Copyright © 2003, Stowers Institute for Medical Research.
//
// This program is free software that can be redistributed and/or
// modified under the terms of the GNU General Public License as
// published by the Free Software Foundation (version 2 of the
// License, or (at your option) any later version).
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY and without even the implied warranty
// of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
// the GNU General Public License for more details.
//
// If a copy of the GNU General Public License is not received with
// this program, contact the Free Software Foundation, Inc.,
// 675 Mass Ave, Cambridge MA 02139, USA or
// http://www.gnu.org/copyleft/gpl.html?cid=6.

// Written by Earl F. Glynn, Stowers Institute for Medical Research.
//
// Please submit all inquiries regarding this software to
// Earl F. Glynn, Stowers Institute for Medical Research,
// 1000 East 50th Street, Kansas City, MO 64110,
// e f g @ s t o w e r s - i n s t i t u t e . o r g
//
// Solely with respect to any use of this program outside the scope
// of the GNU General Public License, the following disclaimers shall
// apply.  This software and any associated documentation are provided
// "as is."  THE STOWERS INSTITUTE MAKES NO REPRESENTATIONS OR WARRANTIES,
// EXPRESSED OR IMPLIED, INCLUDING THOSE OF MERCHANTABILITY, FITNESS FOR
// A PARTICULAR PURPOSE OR NON-INFRINGEMENT.  Neither the Stowers Institute
// nor any of its directors, officers, employees or agents shall be liable
// under any circumstances for any damages of any type with respect to any
// claim by a user of this software or any third party on account of or
// arising from the use or inability to use this software, modifications
// hereto or associated documentation.


unit INILibrary;

interface

  FUNCTION LocalApplicationDataPath:  STRING;
  FUNCTION AppINIFilename(CONST Vendor:  STRING):  STRING;

implementation

  USES
    Windows,  // MAX_PATH
    SysUtils,
    SHFolder;

  // Application Data Path:
  //     NT:  "C:\Documents and Settings\<user>\Application Data"
  //  95/98:  use same directory as executable
  //
  //  Adapted and extended from http://delphi.about.com/bltip0703.htm
  FUNCTION LocalApplicationDataPath:  STRING;
    CONST
      SHGFP_TYPE_CURRENT  = 0;
    VAR
      OSVersionInfo:  TOSVersionInfo;
      path         :  ARRAY[0..MAX_PATH] OF CHAR;
  BEGIN
    OSVersionInfo.dwOSVersionInfoSize := SizeOf(OSVersionInfo);
    GetVersionEx(OSVersionInfo);

    IF   OSVersionInfo.dwPlatformID = VER_PLATFORM_WIN32_NT
    THEN BEGIN
      // Valid only for  Windows NT/2000/XP.
      SHGetFolderPath(0,CSIDL_LOCAL_APPDATA,0,SHGFP_TYPE_CURRENT,@path[0]);
      RESULT := StrPas(path)
    END
    ELSE BEGIN
      // Define something that can be used in Win 95/98
      RESULT := ExcludeTrailingBackSlash( ExtractFilePath( ParamStr(0) ) )
    END
  END {LocalApplicationDataPath};


  FUNCTION AppINIFilename(CONST Vendor:  STRING):  STRING;
    VAR
      AppName  :  STRING;
      IniDir   :  STRING;
      ShortName:  STRING;
  BEGIN
    AppName := ParamStr(0);
    Shortname := ExtractFilename(AppName);
    Shortname := COPY(Shortname, 1, LENGTH(Shortname) -
                                  LENGTH( ExtractFileExt(Shortname) ));

    IniDir := LocalApplicationDataPath + '\' + Vendor + '\' + Shortname;
    IF   NOT DirectoryExists(IniDir)
    THEN ForceDirectories(IniDir);
    RESULT := IniDir + '\' + ShortName + '.INI';
  END {APPINIFilename};


end.
