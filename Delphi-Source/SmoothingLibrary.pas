// 2N+1-Point Moving Average
// efg, May 2003
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

UNIT SmoothingLibrary;

INTERFACE

  PROCEDURE Smooth(VAR X:  Array OF Double;
                   CONST HalfRange:  WORD; CONST RoundCount:  INTEGER);

  PROCEDURE GaussianSmooth(VAR X:  Array OF Double;
                           CONST HalfRange:  WORD; CONST RoundCount:  INTEGER);

IMPLEMENTATION

  USES
    fspec;   // from Jean DeBord's TPMath 

  // Use brute force for 2*HalfRange+1-point moving average.
  // Use as many points as possible at the ends of the array.
  PROCEDURE Smooth(VAR X:  Array OF Double;
                   CONST HalfRange:  WORD; CONST RoundCount:  INTEGER);

    VAR
      i    :  INTEGER;
      k    :  INTEGER;
      kMin :  INTEGER;
      kMax :  INTEGER;
      N    :  INTEGER;
      Round:  INTEGER;
      sum  :  Double;
      Y    :  Array OF Double;
  BEGIN
    SetLength(Y, High(X)+1);

    FOR Round := 1 TO RoundCount DO
    BEGIN

      FOR i := Low(X) To High(X) DO
      BEGIN
        Y[i] := X[i]
      END;

      FOR i := Low(X) To High(X) DO
      BEGIN
        kMin := i - HalfRange;
        IF   kMin < 0
        THEN kMin := 0;
        kMax := i + HalfRange;
        IF   kMax >  High(X)
        THEN kMax := High(X);

        N := kMax - kMin + 1;   // Usually 2*HalfRange + 1

        sum := 0.0;
        FOR k := kMin TO kMax DO
        BEGIN
          sum := sum + Y[k];
        END;

        X[i] := sum / N;

      END

    END
  END;

  // Use "fnorm" from Jean DeBord's TPMath to create gaussian weights.
  // http://www.unilim.fr/pages_perso/jean.debord/tpmath/tpmath.htm

  PROCEDURE GaussianSmooth(VAR X:  Array OF Double;
                           CONST HalfRange:  WORD; CONST RoundCount:  INTEGER);

    VAR
      i        :  INTEGER;
      k        :  INTEGER;
      kMin     :  INTEGER;
      kMax     :  INTEGER;
      Round    :  INTEGER;
      sum      :  Double;
      Y        :  ARRAY OF Double;
      weight   :  ARRAY OF Double;
      weightsum:  Double;

    FUNCTION NormDiff(CONST x1,x2:  DOuble):  Double;
    BEGIN
      NormDiff := fnorm(x2) - fnorm(x1)
    END {NormDiff};

    // See separate efg "Gaussian" project (efg-2003-F, pp. 130-131).
    // Create "weight" array that is local to GaussianSmooth
    PROCEDURE CreateWeights(CONST N:  INTEGER);
      VAR
        Delta :  Double;
        i     :  INTEGER;
        k     :  INTEGER;
        sum   :  Double;
        temp  :  ARRAY OF Double;
    begin
      ASSERT(N >= 0);

      SetLength(temp,   N+1);
      SetLength(weight, 2*N+1);

      Delta := 4/(2*N + 1);  // assume -2 sigma to +2 sigma = 4 sigma
                             // divided into 2N+1 intervals

      // "Raw" weights
      temp[0] := 2*NormDiff(0.0, Delta/2);
      sum := temp[0];

      FOR i := 1 TO N DO
      BEGIN
        temp[i] := NormDiff(Delta/2 + (i-1)*Delta, Delta/2 + i*Delta);
        sum := sum + 2*temp[i]
      END;

      // Normalize
      FOR i := 0 TO N DO
      BEGIN
        temp[i] := temp[i] / sum;
      END;

      // Symmetric weights for moving average
      k := -1;
      FOR i := N DOWNTO 0 DO
      BEGIN
        INC(k);
        weight[k] := temp[i]
      END;

      FOR i := 1 TO N DO
      BEGIN
        INC(k);
        weight[k] := temp[i]
      END;
    end;


  BEGIN
    CreateWeights(HalfRange);

    SetLength(Y, High(X)+1);

    FOR Round := 1 TO RoundCount DO
    BEGIN

      FOR i := Low(X) To High(X) DO
      BEGIN
        Y[i] := X[i]
      END;

      FOR i := Low(X) To High(X) DO
      BEGIN
        kMin := i - HalfRange;
        IF   kMin < 0
        THEN kMin := 0;
        kMax := i + HalfRange;
        IF   kMax >  High(X)
        THEN kMax := High(X);

        sum := 0.0;
        weightsum := 0.0;
        FOR k := kMin TO kMax DO
        BEGIN
          sum := sum + Y[k]*weight[k-kMin];
          weightsum := weightsum + weight[k-kMin];
        END;

        // Normally weightsum should be 1.00, except on left/right
        // boundaries.
        X[i] := sum / weightsum;

      END

    END
  END;

END.
