//
//  AboutTableViewController.swift
//  Adipo
//
//  Created by Volker Schering on 16.05.23.
//

import UIKit

class AboutTableViewController: UITableViewController {
   
   @IBOutlet weak var appDeveloperLabel: UILabel!
   @IBOutlet weak var appStoreRatingButton: UIButton!
   @IBOutlet weak var shareButton: UIButton!
   
   let app = App.shared
   
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
   
}
