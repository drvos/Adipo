//
//  Einstellungen.swift
//  Adipo
//
//  Created by Volker Schering on 20.04.21.
//

import Foundation

let values = Values.shared

class Values {
   
   struct myDefaults {
      let age: Int = 50
      let sex: Sex = .female
      let weight: Int = 80
      let size: Int = 180
      let waist: Int = 80
      let hip: Int = 80
   }
   let md = myDefaults()
   
   var age: Int {
      didSet {
         logger.trace("Values: Age is set to \(self.age)")
      }
   }
   var sex: Sex {
      didSet {
         logger.trace("Values: Sex is set to \(self.sex.hashValue)")
//         UserDefaults.standard.set(self.geschlecht, forKey: "geschlecht")
      }
   }
   var weight: Int {
      didSet {
         logger.trace("Values: Weight is set to \(self.weight)")
//         UserDefaults.standard.set(self.gewicht, forKey: "gewicht")
      }
   }
   var size: Int {
      didSet {
         logger.trace("Values: Size is set to \(self.size)")
//         UserDefaults.standard.set(self.größe, forKey: "größe")
      }
   }
   var waist: Int {
      didSet {
         logger.trace("Value: Waist is set to \(self.waist)")
//         UserDefaults.standard.set(self.taillenumfang, forKey: "taillenumfang")
      }
   }
   var hip: Int {
      didSet {
         logger.trace("Value: Hip is set to \(self.hip)")
//         UserDefaults.standard.set(self.hüftumfang, forKey: "hüftumfang")
      }
   }

   init() {
      self.age = md.age
      self.sex = md.sex
      self.weight = md.weight
      self.size = md.size
      self.waist = md.waist
      self.hip = md.hip
      
//      self.loadUserDefaults()
   }
   
   static let shared: Values = { return Values() }()
   
//   internal func loadUserDefaults() {
//      print(String("Load User Defaults"))
//      if isKeyPresentInUserDefaults(key: "geschlecht") {
//         self.geschlecht = UserDefaults.standard.string(forKey: "geschlecht")!
//      } else { self.geschlecht = md.geschlecht }
//
//      if isKeyPresentInUserDefaults(key: "gewicht") {
//         self.gewicht = UserDefaults.standard.integer(forKey: "gewicht")
//      } else { self.gewicht = md.gewicht }
//
//      if isKeyPresentInUserDefaults(key: "größe") {
//         self.größe = UserDefaults.standard.integer(forKey: "größe")
//      } else { self.größe = md.größe }
//
//      if isKeyPresentInUserDefaults(key: "taillenumfang") {
//         self.taillenumfang = UserDefaults.standard.integer(forKey: "taillenumfang")
//      } else { self.taillenumfang = md.taillenumfang }
//
//      if isKeyPresentInUserDefaults(key: "hüftumfang") {
//         self.hüftumfang = UserDefaults.standard.integer(forKey: "hüftumfang")
//      } else { self.hüftumfang = md.hüftumfang }
//      print("UserDefaults loaded")
//   }
//
//   internal func isKeyPresentInUserDefaults(key: String) -> Bool {
//       return UserDefaults.standard.object(forKey: key) != nil
//   }
}

