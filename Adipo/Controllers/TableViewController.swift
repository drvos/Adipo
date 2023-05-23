//
//  TableTableViewController.swift
//  Adipo
//
//  Created by Volker Schering on 15.04.21.
//

import UIKit

class TableViewController: UITableViewController {
   
   @IBOutlet weak var ageSlider: UISlider!
   @IBOutlet weak var ageValueLabel: UILabel!
   
   @IBOutlet weak var sexSegmentControl: UISegmentedControl!
   
   @IBOutlet weak var weightSlider: UISlider!
   @IBOutlet weak var weightValueLabel: UILabel!
   
   @IBOutlet weak var sizeSlider: UISlider!
   @IBOutlet weak var sizeValueLabel: UILabel!
   
   @IBOutlet weak var waistSlider: UISlider!
   @IBOutlet weak var waistValueLabel: UILabel!
   
   @IBOutlet weak var hipSlider: UISlider!
   @IBOutlet weak var hipValueLabel: UILabel!

   let values = Values.shared
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Initialisierung
      ageSlider.minimumValue = 18
      ageSlider.maximumValue = 80
      ageSlider.value = Float(values.age)
      
      sexSegmentControl.selectedSegmentIndex = values.sex.rawValue
      
      weightSlider.minimumValue = 40
      weightSlider.maximumValue = 150
      weightSlider.value = Float(values.weight)
      
      sizeSlider.minimumValue = 50
      sizeSlider.maximumValue = 220
      sizeSlider.value = Float(values.size)
      
      waistSlider.minimumValue = 50
      waistSlider.maximumValue = 150
      waistSlider.value = Float(values.waist)
      
      hipSlider.minimumValue = 50
      hipSlider.maximumValue = 150
      hipSlider.value = Float(values.hip)
   }

   // MARK: Interface Actions
   
   @IBAction func ageChanged(_ sender: UISlider) {
      values.age = Int(ageSlider.value.rounded())
      ageValueLabel.text = String(format: "%d Jahre", values.age)
   }
   
   @IBAction func sexChanged(_ sender: UISegmentedControl) {
      values.sex = Sex(rawValue: sender.selectedSegmentIndex)!
   }
   
   @IBAction func weightChanged(_ sender: UISlider) {
      values.weight = Int(weightSlider.value.rounded())
      weightValueLabel.text = String(format: "%d kg", values.weight)
   }
   
   @IBAction func sizeChanged(_ sender: UISlider) {
      values.size = Int(sizeSlider.value.rounded())
      sizeValueLabel.text = String(format: "%d cm", values.size)
   }
   
   @IBAction func waistChanged(_ sender: UISlider) {
      values.waist = Int(waistSlider.value.rounded())
      waistValueLabel.text = String(format: "%d cm", values.waist)
   }
   
   @IBAction func hipChanged(_ sender: UISlider) {
      values.hip = Int(hipSlider.value.rounded())
      hipValueLabel.text = String(format: "%d cm", values.hip)
   }
}
