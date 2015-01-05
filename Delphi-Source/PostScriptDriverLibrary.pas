// Simple Postscript "driver"
// efg, Oct 2003.

// **************************************************************************
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

UNIT PostScriptDriverLibrary;

INTERFACE

  USES
    Classes,                // TStringList
    TypesLibrary,           // TPIxelIndex
    RealColorLibrary,       // TRealColor
    GraphicsDriverLibrary;  // TGraphicsDriver

  CONST
    psClosePath = 'closepath';
    psEOF       = '%%EOF';
    psNewPath   = 'newpath';
    psFill      = 'fill';
    psShowPage  = 'showpage';
    psStroke    = 'stroke';

  TYPE
    TPostScriptDriver =
    CLASS(TGraphicsDriver)
      PRIVATE
        FDigitsWidth:  INTEGER;   // 4 + LogFactor
        FFactor     :  TReal;     // 1, 10, 100, 1000, 10000, ...
        FLogFactor  :  INTEGER;   // 0,  1,   2,    3,     4, ...
        FTextFactor :  TReal;

        FList  :  TStringList;
      PROTECTED

      PUBLIC
        CONSTRUCTOR Create(CONST width, height:  TPixelIndex;
                           CONST caption:  STRING;
                           CONST ScaleLogFactor:  INTEGER = 0;
                           CONST TextFactor    :  TReal   = 1.0);

        // Drawing Methods
        PROCEDURE LineTo(CONST i,j:  TPixelIndex);                   OVERRIDE;
        PROCEDURE MoveTo(CONST i,j:  TPixelIndex);                   OVERRIDE;

        PROCEDURE Circle(CONST i,j, radius:  TPixelIndex);           OVERRIDE;
        PROCEDURE Ellipse(CONST i1,j1, i2,j2:  TPixelIndex);         OVERRIDE;
        PROCEDURE Rectangle(CONST i1,j1, i2,j2:  TPixelIndex);       OVERRIDE;

        PROCEDURE Text(CONST i,j:  TPixelIndex; CONST s:  STRING;
                       CONST justify:  THorizTextJustify = textLeft);     OVERRIDE;

        // Control Methods
        PROCEDURE SetBrush(CONST RealColor:  TRealColor);            OVERRIDE;
        PROCEDURE SetPen(CONST RealColor:  TRealColor; CONST width: BYTE = 1); OVERRIDE;
        PROCEDURE SetFont(CONST name:  STRING; CONST pointsize:  BYTE;
                          CONST RealColor:  TRealColor);             OVERRIDE;
        PROCEDURE SetTransparency(CONST mode:  TTransparency);       OVERRIDE;
        PROCEDURE Control(CONST s:  STRING);                         OVERRIDE;

        PROPERTY List:  TStringList READ FList;
    END;

IMPLEMENTATION
  USES
    Math,       // Power
    SysUtils;


  CONSTRUCTOR TPostScriptDriver.Create(CONST width, height:  TPixelIndex;
                                       CONST caption:  STRING;
                                       CONST ScaleLogFactor:  INTEGER = 0;
                                       CONST TextFactor    :  TReal = 1.0);
  BEGIN
    INHERITED Create(width, height);
    FList := TStringList.Create;
    FLogFactor := ScaleLogFactor;
    IF   FLogFactor  < 0
    THEN FLogFactor := 0;
    FFactor := Power(10, FLogFactor);
    FDigitsWidth := 4 + FLogFactor;

    FTextFactor := TextFactor;

    FList.Add('%!PS-Adobe-3.0 EPSF-3.0');
    FList.Add('%%Creator:  ' + caption);
    FList.Add('%%BoundingBox: 0 0 ' +
              Format('%d %d', [Round(Width/Ffactor),
                               Round(Height/Ffactor)] ) );
    FList.Add('%%Pages:  1');
    FList.Add('%%EndComments');
    FList.Add('%%LanguageLevel:  2');
    FList.Add('%%DocumentData:  Clean7Bit');
    Flist.Add('%%Page: 1 1');

    FList.Add('/rightshow  {dup stringwidth pop       neg 0 rmoveto show} def');
    FList.Add('/centershow {dup stringwidth pop 2 div neg 0 rmoveto show} def');
  END {Create};

  //// Drawing Methods ///////////////////////////////////////////////////////

  PROCEDURE TPostScriptDriver.LineTo(CONST i,j:  TPixelIndex);
  BEGIN
    IF   FLogFactor = 0
    THEN FList.Add( Format('%5d %5d       lineto', [i,j]) )
    ELSE FList.Add( Format('%*.*f %*.*f   lineto', [FDigitsWidth, FLogFactor, i/Ffactor,
                                                    FDigitsWidth, FLogFactor, j/Ffactor]) )
  END {LineTo};


  PROCEDURE TPostScriptDriver.MoveTo(CONST i,j:  TPixelIndex);
  BEGIN
    IF   FLogFactor = 0
    THEN FList.Add( Format('%5d %5d       moveto' , [i,j]) )
    ELSE FList.Add( Format('%*.*f %*.*f   moveto', [FDigitsWidth, FLogFactor, i/Ffactor,
                                                    FDigitsWidth, FLogFactor, j/Ffactor]) )
  END {MoveTo};


  PROCEDURE TPostScriptDriver.Circle(CONST i,j, radius:  TPixelIndex);
  BEGIN
    IF   FLogFactor = 0
    THEN FList.Add( Format('%5d %5d %5d 0 360 arc' , [i,j,radius]) )
    ELSE FList.Add( Format('%*.*f %*.*f %*.*f  0 360 arc',
                    [FDigitsWidth, FLogFactor, i/Ffactor,
                     FDigitsWidth, FLogFactor, j/Ffactor,
                     FDigitsWidth, FLogFactor, radius/Ffactor]) )
  END {Circle};

  PROCEDURE TPostScriptDriver.Ellipse(CONST i1,j1, i2,j2:  TPixelIndex);
  BEGIN

  END {Ellipse};

  PROCEDURE TPostScriptDriver.Rectangle(CONST i1,j1, i2,j2:  TPixelIndex);
  BEGIN

  END {Ellipse};


  PROCEDURE TPostScriptDriver.Text(CONST i,j:  TPixelIndex; CONST s:  STRING;
                                   CONST justify:  THorizTextJustify = textLeft);
  BEGIN
    MoveTo(i,j);

    CASE justify OF
      textLeft  :  FList.Add('(' + s + ') show');
      textCenter:  FList.Add('(' + s + ') centershow');
      textRight :  FList.Add('(' + s + ') rightshow');  
    END;
  END {Text};

  //// Control Methods ///////////////////////////////////////////////////////

  PROCEDURE TPostScriptDriver.SetBrush(CONST RealColor:  TRealColor);
  BEGIN
    // not needed for postscript?
  END {SetBrush};

  PROCEDURE TPostScriptDriver.SetPen(CONST RealColor:  TRealColor; CONST width:  BYTE);
  BEGIN
    FList.Add( Format('%5.3f %5.3f %5.3f setrgbcolor' ,
                     [RealColor.Red,
                      RealCOlor.Green,
                      RealCOlor.Blue]) );
    FList.Add( Format('%5d             setlinewidth' , [width]))
  END {SetPen};

  PROCEDURE TPostScriptDriver.SetFont(CONST name:  STRING; CONST pointsize:  BYTE;
                                      CONST RealColor:  TRealColor);
  BEGIN
    FList.Add('/' + name + ' findfont');
    FList.Add(Format('%6.2f', [FTextFactor*pointsize]) + ' scalefont');
    FList.Add('setfont');
    FList.Add( Format('%5.3f %5.3f %5.3f setrgbcolor' ,
       [RealColor.Red, RealColor.Green, RealColor.Blue]) );
  END {SetFont};

  PROCEDURE TPostScriptDriver.SetTransparency(CONST mode:  TTransparency);
  BEGIN
    // Not needed in Postscript driver?
  END {SetTransparency};

  // pass through of postscript command
  PROCEDURE TPostScriptDriver.Control(CONST s:  STRING);
  BEGIN
    FList.Add(s);
  END {Control};

END.
