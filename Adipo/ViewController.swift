//
//  ViewController.swift
//  Adipo
//
//  Created by Volker Schering on 14.04.21.
//

import UIKit

class ViewController: UIViewController {

   @IBOutlet weak var geschlechtSegmentControl: UISegmentedControl!
   
   @IBOutlet weak var tailleLabel: UILabel!
   @IBOutlet weak var tailleSlider: UISlider!
   @IBOutlet weak var tailleValueLabel: UILabel!
   
   @IBOutlet weak var hüftLabel: UILabel!
   @IBOutlet weak var hüftSlider: UISlider!
   @IBOutlet weak var hüftValueLabel: UILabel!
   
   // Klassen initialisieren
   var thq = THQ.init()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      
      // Taillenumfang initialisieren
      tailleSlider.minimumValue = 40
      tailleSlider.maximumValue = 130
      tailleSlider.value = 65
      tailleChanged(self.tailleSlider)
      
      // Hüftumfang initialisieren
      hüftSlider.minimumValue = 50
      hüftSlider.maximumValue = 150
      hüftSlider.value = 75
      hüftChanged(self.hüftSlider)
      
      // Geschlecht initialisieren
      geschlechtSegmentControl.selectedSegmentIndex = 0 // weiblich
      geschlechtChanged(self.geschlechtSegmentControl)
      
      let bmi = BMI.init(GewichtInKG: 100.4, GrößeInCM: 188)
      print(String(format: "BMI: %.1f (%@)", bmi.wert, bmi.kategorie))

   }

   @IBAction func geschlechtChanged(_ sender: UISegmentedControl) {
      if (sender.selectedSegmentIndex == 0) {
         thq.geschlecht = "weiblich"
      } else if (sender.selectedSegmentIndex == 1) {
         thq.geschlecht = "männlich"
      }
      print(String(format: "THQ: %.2f (%@)", thq.wert, thq.kategorie))
   }
   
   @IBAction func tailleChanged(_ sender: UISlider) {
      thq.taillenumfang = Double(tailleSlider.value)
      tailleValueLabel.text = String(format: "%.0f cm", thq.taillenumfang)
      print(String(format: "THQ: %.2f (%@)", thq.wert, thq.kategorie))
   }
   
   @IBAction func hüftChanged(_ sender: UISlider) {
      thq.hüftumfang = Double(hüftSlider.value)
      hüftValueLabel.text = String(format: "%.0f cm", thq.hüftumfang)
      print(String(format: "THQ: %.2f (%@)", thq.wert, thq.kategorie))
   }
}

