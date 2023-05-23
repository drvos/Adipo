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
   
}
