// Pass-through "driver" to use Delphi TCanvas object for drawing in Windows
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

UNIT CanvasDriverLibrary;

INTERFACE

  USES
    TypesLibrary,           // TPixelIndex
    RealColorLibrary,       // TRealColor
    GraphicsDriverLibrary,  // TGraphicsDriver
    Graphics;               // TCanvas

  TYPE
    TCanvasDriver =
    CLASS(TGraphicsDriver)
      PRIVATE

      PROTECTED
        FCanvas:  TCanvas;

      PUBLIC
        CONSTRUCTOR Create(CONST width, height:  TPixelIndex; CONST canvas:  TCanvas);

        // Drawing Methods
        PROCEDURE LineTo(CONST i,j:  TPixelIndex);                    OVERRIDE;
        PROCEDURE MoveTo(CONST i,j:  TPixelIndex);                    OVERRIDE;

        PROCEDURE Circle(CONST i,j, radius:  TPixelIndex);            OVERRIDE;
        PROCEDURE Ellipse(CONST i1,j1, i2,j2:  TPixelIndex);          OVERRIDE;
        PROCEDURE Rectangle(CONST i1,j1, i2,j2:  TPixelIndex);        OVERRIDE;

        PROCEDURE Text(CONST i,j:  TPixelIndex; CONST s:  STRING;
                       CONST justify:  THorizTextJustify = textLeft); OVERRIDE;

        // Control Methods
        PROCEDURE SetBrush(CONST RealColor:  TRealColor);             OVERRIDE;
        PROCEDURE SetPen(CONST RealColor:  TRealColor;
                         CONST width: BYTE = 1);                      OVERRIDE;
        PROCEDURE SetFont(CONST name:  STRING; CONST pointsize:  BYTE;
                          CONST RealColor:  TRealColor);              OVERRIDE;
        PROCEDURE SetTransparency(CONST mode:  TTransparency);        OVERRIDE;
        PROCEDURE Control(CONST s:  STRING);                          OVERRIDE;
    END;

    // Conversions between device-independent and device-dependent color
    PROCEDURE RealColorToRGB255(CONST RealColor:  TRealColor; VAR R,G,B:  BYTE);
    FUNCTION  RealColorToColor(CONST RealColor:  TRealColor):  TColor;
    FUNCTION  ColorToRealColor(CONST Color:  TColor): TRealColor;

IMPLEMENTATION

  USES
    Windows;  // RGB

  FUNCTION Color8Bits(CONST value:  TReal):  BYTE;
    VAR
      component:  INTEGER;
  BEGIN
    component := ROUND(255 * value);
    IF   component >  255
    THEN component := 255;
    IF   component <  0
    THEN component := 0;

    RESULT := component
  END {Color8Bits};

  PROCEDURE RealColorToRGB255(CONST RealColor:  TRealColor; VAR R,G,B:  BYTE);
  BEGIN
    R := Color8Bits(RealColor.Red);
    G := Color8Bits(RealColor.Green);
    B := Color8Bits(RealColor.Blue)
  END {RealColorToRGB255};

  FUNCTION  RealColorToColor(CONST RealColor:  TRealColor):  TColor;
    VAR
      R,G,B:  BYTE;
  BEGIN
    RealColorToRGB255(RealColor, R,G,B);
    RESULT := RGB(R,G,B)
  END {RealColorToColor};

  FUNCTION ColorToRealColor(CONST Color:  TColor): TRealColor;
    VAR
      R,G,B:  BYTE;
  BEGIN
    R := GetRValue(Color);
    G := GetGValue(Color);
    B := GetBValue(Color);
    RESULT := RealColor(R/255, G/255, B/255);
  END {ColorToRealColor};


  CONSTRUCTOR TCanvasDriver.Create(CONST width, height:  TPixelIndex; CONST canvas:  TCanvas);
  BEGIN
    INHERITED Create(width, height);
    FCanvas := Canvas;
  END {Create};

  //// Drawing Methods ///////////////////////////////////////////////////////

  PROCEDURE TCanvasDriver.LineTo(CONST i,j:  TPixelIndex);
  BEGIN
    FCanvas.LineTo(i,j)
  END {LineTo};


  PROCEDURE TCanvasDriver.MoveTo(CONST i,j:  TPixelIndex);
  BEGIN
    FCanvas.MoveTo(i,j)
  END {MoveTo};


  PROCEDURE TCanvasDriver.Circle(CONST i,j, radius:  TPixelIndex);
  BEGIN
    FCanvas.Ellipse(i-radius, j-radius, i+radius, j+radius)
  END {Circle};

  PROCEDURE TCanvasDriver.Ellipse(CONST i1,j1, i2,j2:  TPixelIndex);
  BEGIN
    FCanvas.Ellipse(i1,j1, i2,j2)
  END {Ellipse};

  PROCEDURE TCanvasDriver.Rectangle(CONST i1,j1, i2,j2:  TPixelIndex);
  BEGIN
    FCanvas.Ellipse(i1,j1, i2,j2)
  END {Ellipse};


  PROCEDURE TCanvasDriver.Text(CONST i,j:  TPixelIndex; CONST s:  STRING;
                               CONST justify:  THorizTextJustify = textLeft);
    VAR
      jAdjust:  TPixelIndex;
  BEGIN
    // Alter "origin" for text string from upper left to lower left.
    // Compromise to reconcile Windows and Postscript -- easier to get text
    // metrics in Windows than in Postscript.
    jAdjust := j - FCanvas.TextHeight(s);

    CASE justify OF
      textLeft  :   FCanvas.TextOut(i,                              jAdjust, s);
      textCenter:   FCanvas.TextOut(i - FCanvas.TextWidth(s) DIV 2, jAdjust, s);
      textRight :   FCanvas.TextOut(i - FCanvas.TextWidth(s),       jAdjust, s)
    END;
  END {Text};

  //// Control Methods ///////////////////////////////////////////////////////

  PROCEDURE TCanvasDriver.SetBrush(CONST RealColor:  TRealColor);
    VAR
      R,G,B:  BYTE;
  BEGIN
    RealColorToRGB255(RealColor, R,G,B);
    FCanvas.Brush.Color := RGB(R,G,B)
  END {SetBrush};

  PROCEDURE TCanvasDriver.SetPen(CONST RealColor:  TRealColor; CONST width:  BYTE);
    VAR
      R,G,B:  BYTE;
  BEGIN
    RealColorToRGB255(RealColor, R,G,B);
    FCanvas.Pen.Color := RGB(R,G,B);
    FCanvas.Pen.Width := width
  END {SetPen};

  PROCEDURE TCanvasDriver.SetFont(CONST name:  STRING; CONST pointsize:  BYTE;
                                  CONST RealColor: TRealCOlor);
    VAR
      R,G,B:  BYTE;
  BEGIN
    RealColorToRGB255(RealColor, R,G,B);
    FCanvas.Font.Name := name;
    FCanvas.Font.Size := MulDiv(pointsize,7,10);
    FCanvas.Font.Color := RGB(R,G,B);
  END {SetFont};

  PROCEDURE TCanvasDriver.SetTransparency(CONST mode:  TTransparency);
  BEGIN
    CASE mode of
      transparencyOn :  FCanvas.Brush.Style := bsClear;
      transparencyOff:  FCanvas.Brush.Style := bsSolid
    END
  END {SetTransparency};


  PROCEDURE TCanvasDriver.Control(CONST s:  STRING);
  BEGIN
    // Do nothing for now do nothing; mostly for use by Postscript driver.
  END {Control};


END.
