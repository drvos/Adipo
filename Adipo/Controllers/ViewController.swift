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
   var whr = WHR.init()
   var bmi = BMI.init()
   
   @IBOutlet weak var bmiView: UIView!
   @IBOutlet weak var bmiCategorieLabel: UILabel!
   @IBOutlet weak var bmiValueLabel: UILabel!
   @IBOutlet weak var bmiImage: UIImageView!
   @IBOutlet weak var bmiColorBar: UIView!
   
   @IBOutlet weak var whrView: UIView!
   @IBOutlet weak var whrCategoryLabel: UILabel!
   @IBOutlet weak var whrValueLabel: UILabel!
   @IBOutlet weak var whrImage: UIImageView!
   @IBOutlet weak var whrColorBar: UIView!
   
   override func viewDidLoad() {
      super.viewDidLoad()

      tableViewController = self.children[0] as? TableViewController
      tableViewController?.delegate = self
      
      bmiView.layer.cornerRadius = 10.0
      bmiView.layer.masksToBounds = true
      
      whrView.layer.cornerRadius = 10.0
      whrView.layer.masksToBounds = true
      
      inputChanged()
   }

   func inputChanged() {
      print(String(format: "BMI: %.1f (%@)", bmi.value, bmi.category))
      bmiColorBar.backgroundColor = bmi.color
      bmiValueLabel.text = String(format: "%.1f", bmi.value)
      bmiCategorieLabel.text = bmi.category
      bmiImage.image = UIImage(named: bmi.imageName)
      
      print(String(format: "WHR: %.2f (%@)", whr.value, whr.category))
      whrColorBar.backgroundColor = whr.color
      whrValueLabel.text = String(format: "%.1f", whr.value)
      whrCategoryLabel.text = whr.category
      whrImage.image = UIImage(named: whr.imageName)
   }
   
   // MARK: Interface Actions
   //      UIView.animate(withDuration: 0.5, animations: {
   //         self.dreieck.frame.origin.x = 238
   //      })
}

extension ViewController : TableViewControllerDelegate {
 
   func geschlechtChanged(geschlecht: String) {
      whr.sex = geschlecht
      inputChanged()
   }
   
   func gewichtChanged(gewicht: Int) {
      bmi.weight = gewicht
      inputChanged()
   }
   
   func größeChanged(größe: Int) {
      bmi.size = größe
      inputChanged()
   }

   func tailleChanged(taillenumfang: Int) {
      whr.waistSize = taillenumfang
      inputChanged()
   }
   
   func hüftChanged(hüftumfang: Int) {
      whr.hipSize = hüftumfang
      inputChanged()
   }
}
