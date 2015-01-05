// Device independent RGB Color.
// Use real values 0.00 to 1.00 instead of device-dependent 0 to 255.
// Don't bother making a TRealColor class, since this is intended to
// be a low-level wrapper so a RGB triple can be passed as a single parameter.
//
// efg, Oct 2003
//
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

UNIT RealColorLibrary;

INTERFACE
  USES
    TypesLibrary;  // TReal

  TYPE

    TRealColor  =
    RECORD
      Red  :  TReal;
      Green:  TReal;
      Blue :  TReal;  
    END;

  CONST   // "real" colors by name
    realBlack  :  TRealColor = (Red: 0.0; Green: 0.0; Blue: 0.0);
    realWhite  :  TRealColor = (Red: 1.0; Green: 1.0; Blue: 1.0);

    realRed    :  TRealColor = (Red: 1.0; Green: 0.0; Blue: 0.0);
    realGreen  :  TRealColor = (Red: 0.0; Green: 1.0; Blue: 0.0);
    realBlue   :  TRealColor = (Red: 0.0; Green: 0.0; Blue: 1.0);

    realCyan   :  TRealColor = (Red: 0.0; Green: 1.0; Blue: 1.0);
    realMagenta:  TRealColor = (Red: 1.0; Green: 0.0; Blue: 1.0);
    realYellow :  TRealColor = (Red: 1.0; Green: 1.0; Blue: 0.0);

  FUNCTION RealColor(CONST R,G,B:  TReal):  TRealColor;
  FUNCTION RealGray (CONST level:  TReal):  TRealColor;


IMPLEMENTATION

  FUNCTION RealColor(CONST R,G,B:  TReal):  TRealColor;
  BEGIN
    RESULT.Red   := R;
    RESULT.Green := G;
    RESULT.Blue  := B
  END {RealColor};

  FUNCTION RealGray(CONST level:  TReal):  TRealColor;
  BEGIN
    RESULT := RealColor(level, level, level)
  END {RealColor};

END.
