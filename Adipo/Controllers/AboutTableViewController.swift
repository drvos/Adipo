//
//  AboutTableViewController.swift
//  Adipo
//
//  Created by Volker Schering on 16.05.23.
//

import UIKit
import HealthKit

class AboutTableViewController: UITableViewController {
   
   @IBOutlet weak var appDeveloperLabel: UILabel!
   @IBOutlet weak var appStoreRatingButton: UIButton!
   @IBOutlet weak var shareButton: UIButton!
   
   let app = App.shared
   let store = HKHealthStore()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      appDeveloperLabel.text = String(format: "%@, 2023", app.Developer)
      
   }
   
   // MARK: - IBActions
   
   @IBAction func appStoreRatingTapped(_ sender: UIButton) {
      logger.debug("Function appStoreRatingTapped")
      app.openAppStoreForRating()
   }
   
   @IBAction func shareButtonTapped(_ sender: UIButton) {
      logger.debug("Function shareButtonTapped")
      let text = String(format: "Hallo! Hier ist ein Link zum Herunterladen der %@ App", app.Name)
      let url = NSURL(string: app.AppStoreUrl)
      let share = [text, url!] as [Any]
      app.openShareSheet(sender: self, share: share)
   }
   
   @IBAction func healthkitAuthorizeTapped(_ sender: UIButton) {
      HealthKit.authorizeHealthKit { (authorized, error) in
         guard authorized else {
            let baseMessage = "HealthKit Authorization Failed"
            if let error = error {
               print("\(baseMessage). Reason: \(error.localizedDescription)")
            } else {
               print(baseMessage)
            }
            return
         }
         print("HealthKit Successfully Authorized.")
      }
      self.dismiss(animated: true)
   }

}
