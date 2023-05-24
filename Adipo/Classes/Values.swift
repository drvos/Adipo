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
         notifyObservers()
      }
   }
   var weight: Int {
      didSet {
         logger.trace("Values: Weight is set to \(self.weight)")
         notifyObservers()
      }
   }
   var size: Int {
      didSet {
         logger.trace("Values: Size is set to \(self.size)")
         notifyObservers()
      }
   }
   var waist: Int {
      didSet {
         logger.trace("Value: Waist is set to \(self.waist)")
         notifyObservers()
      }
   }
   var hip: Int {
      didSet {
         logger.trace("Value: Hip is set to \(self.hip)")
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
   
}

