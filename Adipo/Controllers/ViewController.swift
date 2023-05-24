//
//  ViewController.swift
//  Adipo
//
//  Created by Volker Schering on 14.04.21.
//

import UIKit

class ViewController: UIViewController {
   
   let app = App.shared
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.title = app.Name

   }
}

