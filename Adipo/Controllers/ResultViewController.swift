//
//  ResultViewController.swift
//  Adipo
//
//  Created by Volker Schering on 23.05.23.
//

import UIKit

class ResultViewController: UIViewController {
   
   let app = App.shared
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.title = app.Name
   }
}
