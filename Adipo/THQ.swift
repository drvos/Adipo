//
//  THQ.swift
//  Taille-Hüft-Quotient
//
//  Created by Volker Schering on 14.04.21.
//  Copyright © 2021 Volker Schering. All rights reserved.
//

import UIKit
import Foundation

class THQ {
   
   var geschlecht: String {
      didSet {
         print(String(format:"THQ.geschlecht has been set: %@", self.geschlecht))
      }
   }
   var hüftumfang: Double {
      didSet {
         print(String(format:"THQ.hüftumfang has been set: %.2f", self.hüftumfang))
      }
   }
   var taillenumfang: Double {
      didSet {
         print(String(format:"THQ.taillenumfang has been set: %.2f", self.taillenumfang))
      }
   }
   
   var wert: Double { return _thq() }
   var kategorie: String { return _kategorie(geschlecht: self.geschlecht) }
   
   // MARK: Initializer
   
   internal init() {
      self.hüftumfang = 50
      self.taillenumfang = 40
      self.geschlecht = "weiblich"
   }
   
   internal init(HüftumfanginCM: Int, TaillenumfanginCM: Int, Geschlecht: String) {
      self.hüftumfang = Double(HüftumfanginCM)
      self.taillenumfang = Double(TaillenumfanginCM)
      self.geschlecht = Geschlecht
   }
   
   // MARK: Internal Functions
   
   internal func _thq() -> Double {
      return (self.taillenumfang / Double(self.hüftumfang))
   }
   
   internal func _kategorie(geschlecht: String) -> String {
      var kat = ""
      switch geschlecht.prefix(1) {
         case "m":
            if (self.wert < 0.9) {
               kat = "Normalgewicht"
            } else if (self.wert >= 0.9 && self.wert < 1) {
               kat = "Übergewicht"
            } else if (self.wert >= 1.0) {
               kat = "Adipositas"
            }
         case "w":
            if (self.wert < 0.8) {
               kat = "Normalgewicht"
            } else if (self.wert >= 0.8 && self.wert < 0.85) {
               kat = "Übergewicht"
            } else if (self.wert >= 0.85) {
               kat = "Adipositas"
            }
         default:
            kat = "Nicht ermittelbar"
      }
      return kat
   }
}
