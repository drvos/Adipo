//
//  ViewController.swift
//  Adipo
//
//  Created by Volker Schering on 14.04.21.
//

import UIKit

class ViewController: UIViewController, Observer {
   
   let values = Values.shared
   
   let mr = MR.init()
   let whr = WHR.init()
   let bmi = BMI.init()
   
   @IBOutlet weak var mrLabel: UILabel!
   
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
      values.attachObserver(observer: self)
      
      bmiView.layer.cornerRadius = 10.0
      bmiView.layer.masksToBounds = true
      
      whrView.layer.cornerRadius = 10.0
      whrView.layer.masksToBounds = true
      
      self.changedValues()
      self.updateViews()
   }
   
   func changedValues() {
      logger.debug("Object Values has changed")
      mr.age = values.age
      mr.sex = values.sex
      mr.size = values.size
      mr.weight = values.weight
      
      bmi.size = values.size
      bmi.weight = Int(values.weight)
      
      //      whr.sex = values.sex
      whr.hipSize = values.hip
      whr.waistSize = values.waist
      
      self.updateViews()
   }
      
   func updateViews() {
      mrLabel.text = mr.text()
      
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

