//
//  ViewController.swift
//  Adipo
//
//  Created by Volker Schering on 14.04.21.
//

import UIKit

class ViewController: UIViewController {

   var tableViewController : TableViewController?
   
   // Klassen initialisieren
   var thq = THQ.init()
   var bmi = BMI.init()
   
   @IBOutlet weak var bmiView: UIView!
   @IBOutlet weak var bmiCategorieLabel: UILabel!
   @IBOutlet weak var bmiValueLabel: UILabel!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      
      tableViewController = self.children[0] as? TableViewController
      tableViewController?.delegate = self
      
      inputChanged()
   }

   func inputChanged() {
      print(String(format: "BMI: %.1f (%@)", bmi.wert, bmi.kategorie))
      bmiView.backgroundColor = bmi.color
      bmiValueLabel.text = String(format: "%.1f", bmi.wert)
      bmiCategorieLabel.text = bmi.kategorie
      
      print(String(format: "THQ: %.2f (%@)", thq.wert, thq.kategorie))
   }
   
   // MARK: Interface Actions
   //      UIView.animate(withDuration: 0.5, animations: {
   //         self.dreieck.frame.origin.x = 238
   //      })
}

extension ViewController : TableViewControllerDelegate {
 
   func geschlechtChanged(geschlecht: String) {
      thq.geschlecht = geschlecht
      
      inputChanged()
   }
   
   func gewichtChanged(gewicht: Int) {
      bmi.gewicht = gewicht
      inputChanged()
   }
   
   func größeChanged(größe: Int) {
      bmi.größe = größe
      inputChanged()
   }

   func tailleChanged(taillenumfang: Int) {
      thq.taillenumfang = taillenumfang
      inputChanged()
   }
   
   func hüftChanged(hüftumfang: Int) {
      thq.hüftumfang = hüftumfang
      inputChanged()
   }
}
