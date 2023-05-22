//
//  MR.swift
//  Adipo - Metabolic rate
//
//  Created by Volker Schering on 21.05.23.
//

import Foundation

class MR {
   
   var sex: Sex {
      didSet {
         logger.trace("MR: Sex set to \(self.sex.hashValue)")
      }
   }
   var age: Int {
      didSet {
         logger.trace("MR: Age set to \(self.age)")
      }
   }
   var size: Int {
      didSet {
         logger.trace("MR: Size set to \(self.size)")
      }
   }
   var weight: Int {
      didSet {
         logger.trace("MR: Weight set to \(self.weight)")
      }
   }
   
   private let _unit: String
   
   init() {
      self.sex = .female
      self.age = 50
      self.size = 170
      self.weight = 100
      
      self._unit = "kcal/24h"
   }
   
   var metabolicRate: Int {
      switch self.sex {
         case .male:
            let a: Double = 66.47
            let b: Double = 13.7 * Double(self.weight)
            let c: Double = 5.0 * Double(self.size)
            let d: Double = 6.8 * Double(self.age)
            return Int(a + b + c - d)
            //return Int( 66.47 + (13.7 * self.weight) + (5.0 * self.size) - (6.8 * self.age) )
         case .female:
            let a: Double = 655.1
            let b: Double = 9.6 * Double(self.weight)
            let c: Double = 1.8 * Double(self.size)
            let d: Double = 4.7 * Double(self.age)
            return Int(a + b + c - d)
            //return Int( 655.1 + (09.6 * self.weight) + (1.8 * self.size) - (4.7 * self.age) )
      }
   }
   
   public func text() -> String {
      return String(format: "Dein berechneter täglicher Grundumsatz ist %d %@", self.metabolicRate, self._unit)
   }
}

/*
 Harris-Benedict-Formel
 Männer:
 Grundumsatz [kcal/24 h] = 66,47 + (13,7 × Körpergewicht (kg]) +
 (5 × Körpergröße [cm]) - (6,8 x Alter [Jahre])
 Frauen:
 Grundumsatz [kcal/24 h] = 655,1 + (9,6 × Körpergewicht [kg]) +
 (1,8 × Körpergröße [cm]) - (4,7 × Alter (Jahre])
 */
