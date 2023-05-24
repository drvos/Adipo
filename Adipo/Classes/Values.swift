//
//  Einstellungen.swift
//  Adipo
//
//  Created by Volker Schering on 20.04.21.
//

import UIKit
import HealthKit
import Foundation

protocol Observer {
   func changedValues()
}

class Values {
   
   private var observers: [Observer] = []
   
   struct myDefaults {
      let age: Int = 30
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
         notifyObservers()
      }
   }
   var sex: Sex {
      didSet {
         logger.trace("Values: Sex is set to \(self.sex.rawValue)")
//         UserDefaults.standard.set(self.sex.rawValue, forKey: "sex")
         notifyObservers()
      }
   }
   var weight: Int {
      didSet {
         logger.trace("Values: Weight is set to \(self.weight)")
//         UserDefaults.standard.set(self.weight, forKey: "weight")
         notifyObservers()
      }
   }
   var size: Int {
      didSet {
         logger.trace("Values: Size is set to \(self.size)")
//         UserDefaults.standard.set(self.size, forKey: "size")
         notifyObservers()
      }
   }
   var waist: Int {
      didSet {
         logger.trace("Value: Waist is set to \(self.waist)")
//         UserDefaults.standard.set(self.waist, forKey: "waist")
         notifyObservers()
      }
   }
   var hip: Int {
      didSet {
         logger.trace("Value: Hip is set to \(self.hip)")
//         UserDefaults.standard.set(self.hip, forKey: "hip")
         notifyObservers()
      }
   }

   init() {
      self.age = md.age
      self.sex = md.sex
      self.weight = md.weight
      self.size = md.size
      self.waist = md.waist
      self.hip = md.hip
      
      _loadHealthKitData()
//      _loadUserDefaults()
   }
   
   static let shared: Values = { return Values() }()
   
   func attachObserver(observer: Observer) {
      observers.append(observer)
   }
   
   private func notifyObservers() {
      logger.trace("Values - Function notifyObservers")
      for observer in observers {
         logger.trace("Values - Call changedValues")
         observer.changedValues()
      }
   }
   
   internal func _loadHealthKitData() {
      do {
         let HKData = try self._readFromHealthKit()
         logger.trace("HealthKit - Age: \(HKData.age)")
         logger.trace("HealthKit - Sex: \(HKData.sex.rawValue)")
         
         self.age = HKData.age
         self.sex = Sex(rawValue: HKData.sex.rawValue - 1)!
         
      } catch let error {
         logger.error("Error while reading from HealthKit: \(error)")
      }
   }
   
   internal func _readFromHealthKit() throws -> (age: Int, sex: HKBiologicalSex) {
      logger.debug("TableViewController - Function readFromHealthKit")
      let store = HKHealthStore()
      do {

         // 1. This method throws an error if these data are not available.
         let birthday = try store.dateOfBirthComponents()
         let biologicalSex = try store.biologicalSex()
          
         logger.trace("readFromHealthKit - Birthday: \(birthday)")
         logger.trace("readFromHealthKit - Sex: \(biologicalSex)")
         
         // 2. Use Calendar to calculate age.
         let cal = Calendar.current
         let dob = cal.date(from: birthday)!
         let age = (cal.dateComponents([.month], from: dob, to: Date()).month! / 12)
         
         // 3. Unwrap the wrappers to get the underlying enum values.
         let sex = biologicalSex.biologicalSex
   
         return (age, sex)
      }

   }
   
//   internal func _loadUserDefaults() {
//      logger.info("Load user defaults")
//
//      if isKeyPresentInUserDefaults(key: "age") {
//         self.age = UserDefaults.standard.integer(forKey: "age")
//         logger.trace("Age: \(self.age)")
//      } else { self.age = md.age }
//
//      if isKeyPresentInUserDefaults(key: "sex") {
//         self.sex = Sex(rawValue: UserDefaults.standard.integer(forKey: "sex"))!
//         logger.trace("Sex: \(self.sex.hashValue)")
//      } else { self.sex = md.sex }
//
//      if isKeyPresentInUserDefaults(key: "weight") {
//         self.weight = UserDefaults.standard.integer(forKey: "weight")
//         logger.trace("Weight: \(self.weight)")
//      } else { self.weight = md.weight }
//
//      if isKeyPresentInUserDefaults(key: "size") {
//         self.size = UserDefaults.standard.integer(forKey: "size")
//         logger.trace("Size: \(self.size)")
//      } else { self.size = md.size }
//
//      if isKeyPresentInUserDefaults(key: "waist") {
//         self.waist = UserDefaults.standard.integer(forKey: "waist")
//         logger.trace("Waist: \(self.waist)")
//      } else { self.waist = md.waist }
//
//      if isKeyPresentInUserDefaults(key: "hip") {
//         self.hip = UserDefaults.standard.integer(forKey: "hip")
//         logger.trace("Hip: \(self.hip)")
//      } else { self.hip = md.hip }
//
//      logger.info("User defaults loaded")
//   }
//
//   internal func isKeyPresentInUserDefaults(key: String) -> Bool {
//       return UserDefaults.standard.object(forKey: key) != nil
//   }
}

