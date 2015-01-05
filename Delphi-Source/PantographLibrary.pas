//  efg, January 1999.  Extracted simpler version of "full" pantograph
//  www.efg2.com/Lab
//
// "Canvas" here is used in a generic sense, i.e., a digital drawing surface.
//
// efg, Oct 2003.  Modified to use CanvasDriver or PostScriptDriver
//
// **************************************************************************
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

UNIT PantographLibrary;

INTERFACE

  USES
    WinTypes,               // TRect, TPoint
    TypesLibrary,           // THorizTextJustify
    GraphicsDriverLibrary;  // TGraphicsDriver

  // Define "Real" analogs to TPoint and TRect
  TYPE
    TReal       = Double;   // World Coordinates
    TPixelIndex = INTEGER;  // Canvas Coordinates

    TRealPoint =
    RECORD
      x:  TReal;
      y:  TReal
    END;

    TRealRect =
    RECORD
      CASE Integer OF
        0:  (Left, Top, Right, Bottom:  TReal);
        1:  (TopLeft, BottomRight:  TRealPoint)
    END;

    ////// TPantograph ///////////////////////////////////////////////////
    TPantograph =  // map world coordinates to digital pantograph coordinates
    CLASS(TObject)
      PRIVATE
        FCanvasRect:  TRect;       // World mapped to Canvas
        FWorldRect :  TRealRect;

        FCanvasDeltaOverWorldDeltaHorizontal:  TReal;
        FCanvasDeltaOverWorldDeltaVertical  :  TReal;

        FWorldDeltaOverCanvasDeltaHorizontal:  TReal;
        FWorldDeltaOverCanvasDeltaVertical  :  TReal;

        FDriver                             :  TGraphicsDriver;

        FWorldDeltaHorizontal               :  TReal;
        FWorldDeltaVertical                 :  TReal;

        PROCEDURE UpdateMapping;
        PROCEDURE SetWorldRect(WorldRect:  TRealRect);

      PUBLIC
        CONSTRUCTOR Create(Driver:  TGraphicsDriver;
                           CanvasRect:  TRect; WorldRect:  TRealRect);

        PROCEDURE MapWorldToCanvas(CONST xWorld,yWorld  :  TReal;
                                   VAR   iCanvas,jCanvas:  TPixelIndex);
        PROCEDURE MapCanvasToWorld(CONST iCanvas,jCanvas:  TPixelIndex;
                                   VAR   xWorld,yWorld:  TReal);

        PROCEDURE MoveTo(CONST xWorld,yWorld:  TReal);
        PROCEDURE MoveToPercent(CONST xPcnt,yPcnt:  TReal);

        PROCEDURE LineTo(CONST xWorld,yWorld:  TReal);
        PROCEDURE LineToPercent(CONST xPcnt,yPcnt:  TReal);

        PROCEDURE Circle (CONST xWorld, yWorld,  radiusWorld:  TReal);
        PROCEDURE Ellipse(CONST xWorld1,yWorld1, xWorld2,yWorld2:  TReal);
        PROCEDURE Rectangle(CONST xWorld1,yWorld1, xWorld2,yWorld2:  TReal);

        PROCEDURE TextOut(CONST xWorld,yWorld:  TReal;
                          CONST s:  STRING;
                          CONST HorizTextJustify:  THorizTextJustify = textLeft);
        PROCEDURE TextOutPercent(CONST xPcnt,yPcnt:  TReal;
                                 CONST s:  STRING;
                                 CONST HorizTextJustify:  THorizTextJustify = textLeft);

        // Location 0 to 100% in World Coordinates
        FUNCTION xPercent(CONST percent:  TReal):  TReal;
        FUNCTION yPercent(CONST percent:  TReal):  TReal;

         // Relative location 0 to 100% in World Coordinates
        FUNCTION xPercentDelta(CONST percent:  TReal):  TReal;
        FUNCTION yPercentDelta(CONST percent:  TReal):  TReal;

        PROPERTY CanvasRect    :  TRect      READ FCanvasRect;
        PROPERTY WorldRect     :  TRealRect  READ FWorldRect WRITE SetWorldRect;

        PROPERTY GraphicsDriver:  TGraphicsDriver READ FDriver;
    END;


    FUNCTION RealPoint(CONST aX, aY:  TReal):  TRealPoint;
    FUNCTION RealRect(CONST aLeft, aTop, aRight, aBottom:  TReal):  TRealRect;


IMPLEMENTATION

  USES
    SysUtils;  // Exception

  TYPE
    EPantographError = CLASS(Exception);

  FUNCTION RealPoint(CONST aX, aY:  TReal):  TRealPoint;
  BEGIN
    WITH RESULT DO
    BEGIN
      X := aX;
      Y := aY
    END
  END {RealRect};

  FUNCTION RealRect(CONST aLeft, aTop, aRight, aBottom:  TReal):  TRealRect;
  BEGIN
    WITH RESULT DO
    BEGIN
      Left   := aLeft;
      Top    := aTop;    // Switch top and bottom in "world coordinates"
      Right  := aRight;
      Bottom := aBottom  // Switch top and bottom in "world coordinates"
    END
  END {RealRect};


  ////// TPantograph ////////////////////////////////////////////////
  PROCEDURE TPantograph.UpdateMapping;
    VAR
      CanvasDeltaHorizontal:  TPixelIndex;
      CanvasDeltaVertical  :  TPixelIndex;
  BEGIN
    CanvasDeltaHorizontal := FCanvasRect.Right  - FCanvasRect.Left;
    CanvasDeltaVertical   := FCanvasRect.Bottom - FCanvasRect.Top;

    IF   (CanvasDeltaHorizontal = 0)   OR (CanvasDeltaVertical = 0)
    THEN RAISE EPantographError.Create('Invalid Rectangle');

    FWorldDeltaHorizontal := FWorldRect.Right   - FWorldRect.Left;
    FWorldDeltaVertical   := FWorldRect.Top     - FWorldRect.Bottom;

    IF   (FWorldDeltaHorizontal = 0.0) OR (FWorldDeltaVertical = 0.0)  // fuzzy compare here?
    THEN RAISE EPantographError.Create('Invalid Real Rectangle');

    FWorldDeltaOverCanvasDeltaHorizontal := FWorldDeltaHorizontal / CanvasDeltaHorizontal;
    FWorldDeltaOverCanvasDeltaVertical   := FWorldDeltaVertical / CanvasDeltaVertical;

    FCanvasDeltaOverWorldDeltaHorizontal := CanvasDeltaHorizontal / FWorldDeltaHorizontal;
    FCanvasDeltaOverWorldDeltaVertical   := CanvasDeltaVertical   / FWorldDeltaVertical
  END {UpdateMapping};


  PROCEDURE TPantograph.SetWorldRect(WorldRect:  TRealRect);
  BEGIN
    FWorldRect := WorldRect;
    UpdateMapping
  END {SetWorldRect};

  
  CONSTRUCTOR TPantograph.Create(Driver    :  TGraphicsDriver;
                                 CanvasRect:  TRect;
                                 WorldRect :  TRealRect);
  BEGIN
    FDriver     := Driver;
    FCanvasRect := CanvasRect;
    FWorldRect  := WorldRect;
    UpdateMapping
  END {Create};


  PROCEDURE TPantograph.MapWorldToCanvas(CONST xWorld,yWorld:  TReal;
                                         VAR   iCanvas,jCanvas:  TPixelIndex);
    VAR
      xCanvas, yCanvas:  TReal;
  BEGIN
    xCanvas := FCanvasRect.Left + (xWorld - FWorldRect.Left) *
               FCanvasDeltaOverWorldDeltaHorizontal;
    iCanvas := ROUND(xCanvas);

    yCanvas := FCanvasRect.Top  - (yWorld - FWorldRect.Top)  *
               FCanvasDeltaOverWorldDeltaVertical;
    jCanvas := ROUND(yCanvas)
  END {MapWorldToCanvas};


  PROCEDURE TPantograph.MapCanvasToWorld(CONST iCanvas,jCanvas:  TPixelIndex;
                                         VAR   xWorld,yWorld:  TReal);
  BEGIN
    xWorld := FWorldRect.Left +
              (iCanvas - FCanvasRect.Left) * FWorldDeltaOverCanvasDeltaHorizontal;
    yWorld := FWorldRect.Top  -
              (jCanvas - FCanvasRect.Top)  * FWorldDeltaOverCanvasDeltaVertical

  END {MapCanvasToWorld};


  PROCEDURE TPantograph.MoveTo(CONST xWorld,yWorld:  TReal);
    VAR
      iCanvas, jCanvas:  TPixelIndex;
  BEGIN
    MapWorldToCanvas(xWorld,yWorld, iCanvas,jCanvas);
    FDriver.MoveTo(iCanvas,jCanvas)
  END {MoveTo};

  PROCEDURE TPantograph.MoveToPercent(CONST xPcnt,yPcnt:  TReal);
  BEGIN
    MoveTo(xPercent(xPcnt), yPercent(yPcnt))
  END {MoveToPercent};


  PROCEDURE TPantograph.LineTo(CONST xWorld,yWorld:  TReal);
    VAR
      iCanvas,jCanvas:  TPixelIndex;
  BEGIN
    MapWorldToCanvas(xWorld,yWorld, iCanvas,jCanvas);
    FDriver.LineTo(iCanvas,jCanvas)
  END {LineTo};

  PROCEDURE TPantograph.LineToPercent(CONST xPcnt,yPcnt:  TReal);
  BEGIN
    LineTo(xPercent(xPcnt), yPercent(yPcnt))
  END {MoveToPercent};


  PROCEDURE TPantograph.TextOut (CONST xWorld,yWorld:  TReal;
                                 CONST s:  STRING;
                                 CONST HorizTextJustify:  THorizTextJustify = textLeft);
    VAR
      iCanvas,jCanvas:  TPixelIndex;
  BEGIN
    MapWorldToCanvas(xWorld,yWorld, iCanvas,jCanvas);
    FDriver.Text(iCanvas,jCanvas, s, HorizTextJustify)
  END {TextOut};

  PROCEDURE TPantograph.TextOutPercent(CONST xPcnt,yPcnt:  TReal;
                                       CONST s:  STRING;
                                       CONST HorizTextJustify:  THorizTextJustify = textLeft);
  BEGIN
    TextOut(xPercent(xPcnt), yPercent(yPcnt), s, HorizTextJustify)
  END {TextOutPercent};

  // radius is assumed to be defined in terms of the yWorld coordinates,
  // which could be a problem if dimensions are anisotropic
  PROCEDURE TPantograph.Circle (CONST xWorld, yWorld,  radiusWorld:  TReal);
    VAR
      iCanvas:  TPixelIndex;
      i1,i2  :  TPixelIndex;
      jCanvas:  TPixelIndex;
      j1,j2  :  TPixelIndex;
      radius :  TPixelIndex;
  BEGIN
    MapWorldToCanvas(xWorld,yWorld, iCanvas,jCanvas);

    MapWorldToCanvas(0,          0, i1,j1);
    MapWorldToCanvas(0,radiusWorld, i2,j2);
    radius := ABS(j2-j1);

    FDriver.Circle(iCanvas, jCanvas, radius);
  END {Circle};

  PROCEDURE TPantograph.Ellipse(CONST xWorld1,yWorld1, xWorld2,yWorld2:  TReal);
    VAR
      iCanvas1,iCanvas2:  TPixelIndex;
      jCanvas1,jCanvas2:  TPixelIndex;
  BEGIN
    MapWorldToCanvas(xWorld1,yWorld1, iCanvas1,jCanvas1);
    MapWorldToCanvas(xWorld2,yWorld2, iCanvas2,jCanvas2);
    FDriver.Ellipse(iCanvas1,jCanvas1, iCanvas2,jCanvas2)
  END {Ellipse};


  PROCEDURE TPantograph.Rectangle(CONST xWorld1,yWorld1, xWorld2,yWorld2:  TReal);
    VAR
      iCanvas1,iCanvas2:  TPixelIndex;
      jCanvas1,jCanvas2:  TPixelIndex;
  BEGIN
    MapWorldToCanvas(xWorld1,yWorld1, iCanvas1,jCanvas1);
    MapWorldToCanvas(xWorld2,yWorld2, iCanvas2,jCanvas2);
    FDriver.Rectangle(iCanvas1,jCanvas1, iCanvas2,jCanvas2)
  END {Rectangle};


  // Location 0 to 100% in World Coordinates
  FUNCTION TPantograph.xPercent(CONST percent:  TReal):  TReal;
  BEGIN
    RESULT := FWorldRect.Left + xPercentDelta(percent)
  END {xPercent};

  FUNCTION TPantograph.yPercent(CONST percent:  TReal):  TReal;
  BEGIN
    RESULT := FWorldRect.Bottom + yPercentDelta(percent)
  END {yPercent};

  // Relative location 0 to 100% in World Coordinates
  FUNCTION TPantograph.xPercentDelta(CONST percent:  TReal):  TReal;
  BEGIN
    RESULT := 0.01 * percent * FWorldDeltaHorizontal
  END {xPercentDelta};

  FUNCTION TPantograph.yPercentDelta(CONST percent:  TReal):  TReal;
  BEGIN
    RESULT := 0.01 * percent * FWorldDeltaVertical
  END {yPercentDelta};


END.
