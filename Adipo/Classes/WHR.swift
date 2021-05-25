//
//  WHR.swift
//  Waist-Hip-Ratio (Taille-Hüft-Quotient)
//
//  Created by Volker Schering on 14.04.21.
//  Copyright © 2021 Volker Schering. All rights reserved.
//

import UIKit
import Foundation

internal class WHR { // waist-hip ratio
   
   private var _idx: Int = 0
   
   struct Gender {
      let short: String
      let name: String
   }
   
   private var _Categories: [String] = ["","","Normalgewicht","Übergewicht","Adipositas"]
   private var _Colors: [UIColor] = [UIColor.red, UIColor.orange, UIColor.green, UIColor.orange, UIColor.red]
   
   var sex: String {
      didSet {
         print(String(format:"WHR.sex has been set: %@", self.sex))
      }
   }
   var hipSize: Int {
      didSet {
         print(String(format:"WHR.hipSize has been set: %d", self.hipSize))
      }
   }
   var waistSize: Int {
      didSet {
         print(String(format:"WHR.waistSize has been set: %d", self.waistSize))
      }
   }
   
   var value: Double { return _whr() }
   var category: String { return _Categories[self._idx] }
   var color: UIColor { return _Colors[self._idx] }
   
   // MARK: Initializer
   
   internal init() {
      self.hipSize = 50
      self.waistSize = 40
      self.sex = "weiblich"
      self._idx = _generateIndex(sex: self.sex)
   }
   
   // MARK: Internal Functions
   
   private func _whr() -> Double {
      return (Double(self.waistSize) / Double(self.hipSize))
   }
   
   private func _generateIndex(sex: String) -> Int {
      switch sex.prefix(1) {
         case "m":
            if (self.value < 0.9) {
               return 3
            } else if (self.value >= 0.9 && self.value < 1) {
               return 4
            } else if (self.value >= 1.0) {
               return 5
            }
         case "w":
            if (self.value < 0.8) {
               return 3
            } else if (self.value >= 0.8 && self.value < 0.85) {
               return 4
            } else if (self.value >= 0.85) {
               return 5
            }
         default:
            return 0
      }
      return 0
   }
}
