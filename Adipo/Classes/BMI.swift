//
//  BMI.swift
//  Body-Mass-Index
//
//  Created by Volker Schering on 13.07.18.
//  Copyright © 2018 Volker Schering. All rights reserved.
//

import UIKit
import Foundation

class BMI {
   
   var gewicht: Int {
      didSet {
         print(String(format:"BMI.gewicht has been set: %d", self.gewicht))
      }
   }
   var größe: Int {
      didSet {
         print(String(format:"BMI.größe has been set: %d", self.größe))
      }
   }
   
   var wert: Double { return _bmi() }
   var kategorie: String { return _kategorie() }
   var color: UIColor { return _color() }

   // MARK: Initializer
   
   internal init() {
      self.gewicht = 100
      self.größe = 188
   }
   
   internal init(GewichtInKG: Int, GrößeInCM: Int) {
      self.gewicht = GewichtInKG
      self.größe = GrößeInCM
   }
   
   // MARK: Internal Functions
   
   internal func _bmi() -> Double {
      return (Double(self.gewicht) / (Double(self.größe)/100 * Double(self.größe)/100))
   }
   
   internal func _kategorie() -> String {
      var kat: String = ""
      if (self.wert > 0.0 && self.wert <= 16.0) {
         kat =  "kritisches Untergewicht"
      } else if (self.wert > 16.0 && self.wert <= 20.0) {
         kat =  "Untergewicht"
      } else if (self.wert > 20.0 && self.wert <= 25.0) {
         kat =  "Normalgewicht"
      } else if (self.wert > 25.0 && self.wert <= 30.0) {
         kat =  "Übergewicht"
      } else if (self.wert > 30.0 && self.wert <= 35.0) {
         kat =  "Adipositas Grad I"
      } else if (self.wert > 35.0 && self.wert <= 40.0) {
         kat =  "Adipositas Grad II"
      } else if (self.wert > 40.0) {
         kat =  "Adipositas Grad III"
      }
      return kat
   }

   internal func _color() -> UIColor {
      var color = UIColor.init()
      if (self.wert > 0.0 && self.wert <= 16.0) {
         color = UIColor.red
      } else if (self.wert > 16.0 && self.wert <= 20.0) {
         color = UIColor.orange
      } else if (self.wert > 20.0 && self.wert <= 25.0) {
         color = UIColor.green
      } else if (self.wert > 25.0 && self.wert <= 30.0) {
         color = UIColor.orange
      } else if (self.wert > 30.0 && self.wert <= 35.0) {
         color = UIColor.red
      } else if (self.wert > 35.0 && self.wert <= 40.0) {
         color = UIColor.red
      } else if (self.wert > 40.0) {
         color = UIColor.red
      }
      return color
   }
   
   
   /*
   double bmi = [bmiNumber doubleValue];
   if (bmi > 0.0 && bmi <= 16.0) {
       self.bmiCategory = @"kritisches Untergewicht";
       self.bmiColor = [UIColor redColor];
   } else if (bmi > 16.0 && bmi <= 20.0) {
       self.bmiCategory = @"Untergewicht";
       self.bmiColor = [UIColor orangeColor];
   } else if (bmi > 20.0 && bmi <= 25.0) {
       self.bmiCategory = @"Normalgewicht";
       self.bmiColor = [UIColor greenColor];
   } else if (bmi > 25.0 && bmi <= 30.0) {
       self.bmiCategory = @"Übergewicht";
       self.bmiColor = [UIColor orangeColor];
   } else if (bmi > 30.0 && bmi <= 35.0) {
       self.bmiCategory = @"Adipositas Grad I";
       self.bmiColor = [UIColor redColor];
   } else if (bmi > 35.0 && bmi <= 40.0) {
       self.bmiCategory = @"Adipositas Grad II";
       self.bmiColor = [UIColor redColor];
   } else if (bmi > 40.0) {
       self.bmiCategory = @"Adipositas Grad III";
       self.bmiColor = [UIColor redColor];
   }
   */
   
}


