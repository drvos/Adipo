//
//  Values.swift
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
   private let healthStore = HKHealthStore()
   
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
         _notifyObservers()
      }
   }
   var sex: Sex {
      didSet {
         logger.trace("Values: Sex is set to \(self.sex.rawValue)")
         _notifyObservers()
      }
   }
   var weight: Int {
      didSet {
         logger.trace("Values: Weight is set to \(self.weight)")
         _notifyObservers()
      }
   }
   var size: Int {
      didSet {
         logger.trace("Values: Size is set to \(self.size)")
         _notifyObservers()
      }
   }
   var waist: Int {
      didSet {
         logger.trace("Value: Waist is set to \(self.waist)")
         _notifyObservers()
      }
   }
   var hip: Int {
      didSet {
         logger.trace("Value: Hip is set to \(self.hip)")
         _notifyObservers()
      }
   }

   init() {
      self.age = md.age
      self.sex = md.sex
      self.weight = md.weight
      self.size = md.size
      self.waist = md.waist
      self.hip = md.hip
      
      self.loadHealthKitData()
   }
   
   static let shared: Values = { return Values() }()
   
   func loadHealthKitData() {
      do {
         self.age = try self._readAgeFromHealthKit()
      } catch let error {
         logger.error("Error while reading 'Age' from HealthKit: \(error)")
      }
      do {
         self.sex = Sex(rawValue: try self._readSexFromHealthKit().rawValue - 1)!
      } catch let error {
         logger.error("Error while reading 'Sex' from HealthKit: \(error)")
      }
      self._readWeightFromHealthKit()
      self._readHeightFromHealthKit()
   }
   
   // MARK: - Observer functions
   
   func attachObserver(observer: Observer) {
      observers.append(observer)
   }
   
   internal func _notifyObservers() {
      logger.trace("Values - Function notifyObservers")
      for observer in observers {
         logger.trace("Values - Call changedValues")
         observer.changedValues()
      }
   }
   
   // MARK: - Read from HealthKit
   
   internal func _readAgeFromHealthKit() throws -> Int {
      logger.debug("TableViewController - Function readAgeFromHealthKit")
      do {
         let birthday = try healthStore.dateOfBirthComponents()
         logger.trace("readFromHealthKit - Birthday: \(birthday)")
         
         // Use Calendar to calculate age.
         let cal = Calendar.current
         let dob = cal.date(from: birthday)!
         return (cal.dateComponents([.month], from: dob, to: Date()).month! / 12)
      }
   }
   
   internal func _readSexFromHealthKit() throws -> HKBiologicalSex {
      logger.debug("TableViewController - Function readSexFromHealthKit")
      do {
         let biologicalSex = try healthStore.biologicalSex()
         logger.trace("readFromHealthKit - Sex: \(biologicalSex)")
         return biologicalSex.biologicalSex
      }
   }
   
   internal func _readWeightFromHealthKit() {
      logger.debug("TableViewController - Function readWeightFromHealthKit")
      let bodyMassType = HKSampleType.quantityType(forIdentifier: .bodyMass)!
      let sortDescriptor = NSSortDescriptor(key:HKSampleSortIdentifierStartDate, ascending: false)
      let query = HKSampleQuery(sampleType: bodyMassType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, results, error) in
         if let result = results?.last as? HKQuantitySample {
               let bodyMass = result.quantity.doubleValue(for: HKUnit(from: "kg"))
               logger.trace("readFromHealthKit - Weight: \(bodyMass)")
               self.weight = Int(bodyMass.rounded())
            }
      }
      self.healthStore.execute(query)
   }
   
   internal func _readHeightFromHealthKit() {
      logger.debug("TableViewController - Function readHeightFromHealthKit")
      let heightType = HKSampleType.quantityType(forIdentifier: .height)!
      let query = HKSampleQuery(sampleType: heightType, predicate: nil, limit: 1, sortDescriptors: nil) { (query, results, error) in
            if let result = results?.last as? HKQuantitySample {
               let height = result.quantity.doubleValue(for: HKUnit(from: "cm"))
               logger.trace("readFromHealthKit - Height: \(height)")
               self.weight = Int(height.rounded())
            }
      }
      self.healthStore.execute(query)
   }
}

