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

   private var _Categories: [String] =
      ["","kritisches Untergewicht","Untergewicht","Normalgewicht","Übergewicht","Adipositas"]
   private var _Colors: [UIColor] =
      [UIColor.clear, UIColor.red, UIColor.orange, UIColor.green, UIColor.orange, UIColor.red]
   
   var weight: Int {
      didSet {
         print(String(format:"BMI.weight has been set: %d", self.weight))
      }
   }
   var size: Int {
      didSet {
         print(String(format:"BMI.size has been set: %d", self.size))
      }
   }
   
   var value: Double { return _bmi() }
   var category: String { return _Categories[_generateIndex()] }
   var color: UIColor { return _Colors[_generateIndex()] }
   var imageName: String { return String(format: "adipo_%02d", _generateIndex())}
   
   
   // MARK: Initializer
   
   internal init() {
      self.weight = 100
      self.size = 188
   }
   
   // MARK: Internal Functions
   
   internal func _bmi() -> Double {
      return (Double(self.weight) / (Double(self.size)/100 * Double(self.size)/100))
   }
   
   internal func _generateIndex() -> Int {
      if (self.value > 0.0 && self.value <= 16.0) {
         return 1
      } else if (self.value > 16.0 && self.value <= 20.0) {
         return 2
      } else if (self.value > 20.0 && self.value <= 25.0) {
         return 3
      } else if (self.value > 25.0 && self.value <= 30.0) {
         return 4
      } else if (self.value > 30.0) {
         return 5
      }
      return 0
   }
   
}


