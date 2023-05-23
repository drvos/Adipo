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
   
   private var _Categories: [String] =
      ["","","","Normalgewicht","Übergewicht","Adipositas"]
   private var _Colors: [UIColor] =
      [UIColor.clear, UIColor.red, UIColor.orange, UIColor.green, UIColor.orange, UIColor.red]
   
   var sex: Sex {
      didSet {
         print(String(format:"WHR.sex has been set: %@", self.sex.rawValue))
      }
   }
   var hip: Int {
      didSet {
         print(String(format:"WHR.hip has been set: %d", self.hip))
      }
   }
   var waist: Int {
      didSet {
         print(String(format:"WHR.waist has been set: %d", self.waist))
      }
   }
   
   var value: Double { return _whr() }
   var category: String { return _Categories[_generateIndex(sex: self.sex)] }
   var color: UIColor { return _Colors[_generateIndex(sex: self.sex)] }
   var imageName: String { return String(format: "adipo_%02d", _generateIndex(sex: self.sex))}
   
   // MARK: Initializer
   
   internal init(values: Values) {
      self.hip = values.hip
      self.waist = values.waist
      self.sex = values.sex
   }
   
   // MARK: Internal Functions
   
   private func _whr() -> Double {
      return (Double(self.waist) / Double(self.hip))
   }
   
   private func _generateIndex(sex: Sex) -> Int {
      switch sex {
         case .male:
            if (self.value < 0.9) {
               return 3
            } else if (self.value >= 0.9 && self.value < 1) {
               return 4
            } else if (self.value >= 1.0) {
               return 5
            }
         case .female:
            if (self.value < 0.8) {
               return 3
            } else if (self.value >= 0.8 && self.value < 0.85) {
               return 4
            } else if (self.value >= 0.85) {
               return 5
            }
      }
      return 0
   }
}
