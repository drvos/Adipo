//
//  HealthKit.swift
//  Adipo
//
//  Created by Volker Schering on 24.05.23.
//

import HealthKit

class HealthKit {
  
  private enum HealthkitError: Error {
    case notAvailableOnDevice
    case dataTypeNotAvailable
  }
  
  class func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {

     // 1. Check to see if HealthKit Is Available on this device
     guard HKHealthStore.isHealthDataAvailable() else {
       completion(false, HealthkitError.notAvailableOnDevice)
       return
     }
     
     // 2. Prepare the data types that will interact with HealthKit
     guard
         let dateOfBirth = HKObjectType.characteristicType(forIdentifier: .dateOfBirth),
         let sex = HKObjectType.characteristicType(forIdentifier: .biologicalSex),
         let height = HKObjectType.quantityType(forIdentifier: .height)
     else {
         completion(false, HealthkitError.dataTypeNotAvailable)
         return
     }
     
     // 3. Prepare a list of types you want HealthKit to read and write
     let healthKitTypesToRead: Set<HKObjectType> = [dateOfBirth, sex, height]
     let healthKitTypesToWrite: Set<HKSampleType> = []
     
     // 4. Request Authorization
     HKHealthStore().requestAuthorization(toShare: healthKitTypesToWrite,
                                          read: healthKitTypesToRead) { (success, error) in
       completion(success, error)
     }
  }
}
