//
//  AboutViewController.swift
//  Adipo
//
//  Created by Volker Schering on 16.05.23.
//

import UIKit

class AboutViewController: UIViewController {
   
   @IBOutlet weak var appIconImage: UIImageView!
   @IBOutlet weak var appNameLabel: UILabel!
   @IBOutlet weak var appVersionLabel: UILabel!
   
   let app = App.shared
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      appIconImage.image = app.Icon
      appIconImage.layer.borderWidth = 1
      appIconImage.layer.borderColor = UIColor.black.cgColor
      appIconImage.layer.masksToBounds = false
      appIconImage.layer.cornerRadius = appIconImage.frame.width/2
      appIconImage.clipsToBounds = true
      
      appNameLabel.text = app.Name
      appVersionLabel.text = String(format: "Version %@ (%@)", app.VersionNumber, app.BuildNumber)
   }
   
   // MARK: - IB Actions
   
   @IBAction func aboutCloseTapped(_ sender: UIBarButtonItem) {
      self.dismiss(animated: true)
   }
   
   @IBAction func aboutShareTapped(_ sender: UIBarButtonItem) {
      logger.debug("Function aboutShareTapped")
      let text = String(format: "Hallo! Hier ist ein Link zum Herunterladen der %@ App", app.Name)
      let url = NSURL(string: app.AppStoreUrl)
      let share = [text, url!] as [Any]
      app.openShareSheet(sender: self, share: share)
   }
   

}
