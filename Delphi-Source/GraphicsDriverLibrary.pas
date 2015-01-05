// Generic graphics "base class" for use with normal Windows graphics, or
// Postscript output.
//
// Based on generic "virtual" DeviceDriver unit dating back to Nov 1981!
//
// Device is assumed to be of arbitrary digital size.  An analog device
// can be approximated by a very high-resolution digital device.
//
// Minimal implementation.  Only features needed in current projects are
// implemented now, which is minimial TCanvas drawing and postscript output.
//
// Initial derived classes:
//  TCanvasDriver     for using Delphi TCanvas
//  TPostscriptDriver for Postscript output for display in GSView or other programs
//
// ************************************************************************
//
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

UNIT GraphicsDriverLibrary;

INTERFACE

  USES
    TypesLibrary,       // TPixelIndex, TTextJustify
    RealColorLibrary;   // TRealColor

  TYPE
    TGraphicsDriver =
    CLASS(TObject)
      PRIVATE
        FWidth :  TPixelIndex;
        FHeight:  TPixelIndex;

      PROTECTED

      PUBLIC
        CONSTRUCTOR Create(CONST width, height:  TPixelIndex);

        // Drawing Methods
        PROCEDURE LineTo(CONST i,j:  TPixelIndex);
          VIRTUAL; ABSTRACT;

        PROCEDURE MoveTo(CONST i,j:  TPixelIndex);
          VIRTUAL; ABSTRACT;

          PROCEDURE Circle(CONST i,j, radius:  TPixelIndex);
          VIRTUAL; ABSTRACT;

        PROCEDURE Ellipse(CONST i1,j1, i2,j2:  TPixelIndex);
          VIRTUAL; ABSTRACT;

        PROCEDURE Rectangle(CONST i1,j1, i2,j2:  TPixelIndex);
          VIRTUAL; ABSTRACT;


        PROCEDURE Text(CONST i,j:  TPixelIndex; CONST s:  STRING;
                       CONST justify:  THorizTextJustify = textLeft);
          VIRTUAL; ABSTRACT;

        // Control Methods
        PROCEDURE SetBrush(CONST RealColor:  TRealColor);
          VIRTUAL; ABSTRACT;

        PROCEDURE SetPen(CONST RealColor:  TRealColor; CONST width:  BYTE = 1);
          VIRTUAL; ABSTRACT;

        PROCEDURE SetFont(CONST name:  STRING; CONST pointsize:  BYTE;
                          CONST RealColor:  TRealColor);

          VIRTUAL; ABSTRACT;

        PROCEDURE SetTransparency(CONST mode:  TTransparency);
          VIRTUAL; ABSTRACT;

        PROCEDURE Control(CONST s:  STRING);
          VIRTUAL; ABSTRACT;

        PROPERTY Width :  TPixelIndex READ FWidth;
        PROPERTY Height:  TPixelIndex READ FHeight;

    END;

IMPLEMENTATION

  CONSTRUCTOR TGraphicsDriver.Create (CONST width, height:  TPixelIndex);
  BEGIN
    FWidth  := width;
    FHeight := height
  END {Create};

END.
