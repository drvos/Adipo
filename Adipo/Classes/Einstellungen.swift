//
//  Einstellungen.swift
//  Adipo
//
//  Created by Volker Schering on 20.04.21.
//

import Foundation

class Einstellungen {
      
   struct myDefaults {
      // Geschlecht m oder w
      let geschlecht: String = "w"
      // Gewicht
      let gewicht: Int = 80
      // Größe
      let größe: Int = 180
      // Taillenumfng
      let taillenumfang: Int = 80
      // Hüftumfang
      let hüftumfang: Int = 80
   }
   let md = myDefaults()
   
   var geschlecht: String {
      didSet {
         print(String(format: "Geschlecht gesetzt: %@", geschlecht))
         UserDefaults.standard.set(self.geschlecht, forKey: "geschlecht")
      }
   }
   var gewicht: Int {
      didSet {
         print(String(format: "Gewicht gesetzt: %d", gewicht))
         UserDefaults.standard.set(self.gewicht, forKey: "gewicht")
      }
   }
   var größe: Int {
      didSet {
         print(String(format: "Größe gesetzt: %d", größe))
         UserDefaults.standard.set(self.größe, forKey: "größe")
      }
   }
   var taillenumfang: Int {
      didSet {
         print(String(format: "Taillenumfang gesetzt: %d", taillenumfang))
         UserDefaults.standard.set(self.taillenumfang, forKey: "taillenumfang")
      }
   }
   var hüftumfang: Int {
      didSet {
         print(String(format: "Hüftumfang gesetzt: %d", hüftumfang))
         UserDefaults.standard.set(self.hüftumfang, forKey: "hüftumfang")
      }
   }

   init() {
      self.geschlecht = md.geschlecht
      self.gewicht = md.gewicht
      self.größe = md.größe
      self.taillenumfang = md.taillenumfang
      self.hüftumfang = md.hüftumfang
      
      self.loadUserDefaults()
   }
   
   internal func loadUserDefaults() {
      print(String("Load User Defaults"))
      if isKeyPresentInUserDefaults(key: "geschlecht") {
         self.geschlecht = UserDefaults.standard.string(forKey: "geschlecht")!
      } else { self.geschlecht = md.geschlecht }
      
      if isKeyPresentInUserDefaults(key: "gewicht") {
         self.gewicht = UserDefaults.standard.integer(forKey: "gewicht")
      } else { self.gewicht = md.gewicht }
      
      if isKeyPresentInUserDefaults(key: "größe") {
         self.größe = UserDefaults.standard.integer(forKey: "größe")
      } else { self.größe = md.größe }
      
      if isKeyPresentInUserDefaults(key: "taillenumfang") {
         self.taillenumfang = UserDefaults.standard.integer(forKey: "taillenumfang")
      } else { self.taillenumfang = md.taillenumfang }
      
      if isKeyPresentInUserDefaults(key: "hüftumfang") {
         self.hüftumfang = UserDefaults.standard.integer(forKey: "hüftumfang")
      } else { self.hüftumfang = md.hüftumfang }
      print("UserDefaults loaded")
   }
   
   internal func isKeyPresentInUserDefaults(key: String) -> Bool {
       return UserDefaults.standard.object(forKey: key) != nil
   }
}
