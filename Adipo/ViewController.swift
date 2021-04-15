//
//  ViewController.swift
//  Adipo
//
//  Created by Volker Schering on 14.04.21.
//

import UIKit

class ViewController: UIViewController {

   @IBOutlet weak var tailleSlider: UISlider!
   @IBOutlet weak var tailleLabel: UILabel!
   
   // Klassen initialisieren
   var thq = THQ.init()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      
      // Taillenumfang initialisieren
      tailleSlider.value = 65
      tailleSlider.minimumValue = 40
      tailleSlider.maximumValue = 130
      tailleChanged(self.tailleSlider)
      
      
      
      let bmi = BMI.init(GewichtInKG: 100.4, GrößeInCM: 188)
      print(String(format: "BMI: %.1f (%@)", bmi.wert, bmi.kategorie))
      
      thq.hüftumfang = 107
      thq.taillenumfang = Double(tailleSlider.value)
      thq.geschlecht = "m"
   }


   @IBAction func tailleChanged(_ sender: UISlider) {
      thq.taillenumfang = Double(tailleSlider.value)
      tailleLabel.text = String(format: "%.0f cm", thq.taillenumfang)
      print(String(format: "THQ: %.2f (%@)", thq.wert, thq.kategorie))
   }
}

