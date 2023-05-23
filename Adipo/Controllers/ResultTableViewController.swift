//
//  ResultTableViewController.swift
//  Adipo
//
//  Created by Volker Schering on 23.05.23.
//

import UIKit

class ResultTableViewController: UITableViewController, Observer {

   let values = Values.shared
   
   var mr: MR?    // Metabolic rate
   var bmi: BMI?  // Body-Mass-Index
   var whr: WHR?  // Waist-Hip-Ratio
   
   @IBOutlet weak var mrLabel: UILabel!
   
   @IBOutlet weak var bmiCategorieLabel: UILabel!
   @IBOutlet weak var bmiValueLabel: UILabel!
   @IBOutlet weak var bmiImage: UIImageView!
   @IBOutlet weak var bmiColorBar: UIView!
   
   @IBOutlet weak var whrCategoryLabel: UILabel!
   @IBOutlet weak var whrValueLabel: UILabel!
   @IBOutlet weak var whrImage: UIImageView!
   @IBOutlet weak var whrColorBar: UIView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      values.attachObserver(observer: self)
      
      mr = MR.init(values: values)
      bmi = BMI.init(values: values)
      whr = WHR.init(values: values)
      
      changeResults()
   }
   
   internal func changeResults() {
      mrLabel.text = mr!.text()
      
      bmiColorBar.backgroundColor = bmi!.color
      bmiValueLabel.text = String(format: "%.1f", bmi!.value)
      bmiCategorieLabel.text = bmi!.category
      bmiImage.image = UIImage(named: bmi!.imageName)
      
      whrColorBar.backgroundColor = whr!.color
      whrValueLabel.text = String(format: "%.1f", whr!.value)
      whrCategoryLabel.text = whr!.category
      whrImage.image = UIImage(named: whr!.imageName)
   }

   // MARK: - Observer
   
   func changedValues() {
      logger.debug("ResultTableViewController - Function changedValues")
      self.changeResults()
   }
   
}
