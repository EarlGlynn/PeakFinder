// PeakFinder Splash screen
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

unit ScreenSplash;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Gauges, jpeg;

type
  TFormSplash = class(TForm)
    FloatingPanel: TPanel;
    PanelTitle: TPanel;
    LicenseLabel: TLabel;
    CopyrightLabel: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    ImageLogo: TImage;
    Label2: TLabel;
    Panel2: TPanel;
    Image3: TImage;
    procedure EarlyOutClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  FormSplash:  TFormSplash;

implementation
{$R *.DFM}

  VAR
    EarlyOut :  BOOLEAN;
    StartTime:  TDateTime;

procedure TFormSplash.EarlyOutClick(Sender: TObject);
begin
  EarlyOut := TRUE
end;

INITIALIZATION
  EarlyOut := FALSE;
  StartTime := Now;

  FormSplash := TFormSplash.Create(Application);
  FormSplash.Show;

  REPEAT
    Sleep(100);
    Application.ProcessMessages;
  UNTIL  EarlyOut OR ((Now - StartTime) > 3.0/86400);  // 3 second delay

  FormSplash.Close;
END.
