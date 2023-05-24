//
//  TableTableViewController.swift
//  Adipo
//
//  Created by Volker Schering on 15.04.21.
//

import UIKit
import HealthKit

class TableViewController: UITableViewController, Observer {
   
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
      
      values.attachObserver(observer: self)
      
      // Initialisierung
      ageSlider.minimumValue = 18
      ageSlider.maximumValue = 80
      
      sexSegmentControl.selectedSegmentIndex = values.sex.rawValue
      
      weightSlider.minimumValue = 40
      weightSlider.maximumValue = 150
      
      sizeSlider.minimumValue = 50
      sizeSlider.maximumValue = 220
      
      waistSlider.minimumValue = 50
      waistSlider.maximumValue = 150
      
      hipSlider.minimumValue = 50
      hipSlider.maximumValue = 150

      self.changedValues()
   }
   
   // MARK: - Observer
   
   func changedValues() {
      logger.debug("TableViewController - Function changedValues")
      ageSlider.value = Float(values.age)
      ageValueLabel.text = String(format: "%d Jahre", values.age)
      
      sexSegmentControl.selectedSegmentIndex = values.sex.rawValue
      
      weightSlider.value = Float(values.weight)
      weightValueLabel.text = String(format: "%d kg", values.weight)
      
      sizeSlider.value = Float(values.size)
      sizeValueLabel.text = String(format: "%d cm", values.size)
      
      waistSlider.value = Float(values.waist)
      waistValueLabel.text = String(format: "%d cm", values.waist)
      
      hipSlider.value = Float(values.hip)
      hipValueLabel.text = String(format: "%d cm", values.hip)
   }

   // MARK: - Interface Actions
   
   @IBAction func ageChanged(_ sender: UISlider) {
      Haptic.selection.generate(prepareForReuse: true)
      values.age = Int(ageSlider.value.rounded())
   }
   
   @IBAction func sexChanged(_ sender: UISegmentedControl) {
      Haptic.selection.generate(prepareForReuse: true)
      values.sex = Sex(rawValue: sender.selectedSegmentIndex)!
   }
   
   @IBAction func weightChanged(_ sender: UISlider) {
      Haptic.selection.generate(prepareForReuse: true)
      values.weight = Int(weightSlider.value.rounded())
   }
   
   @IBAction func sizeChanged(_ sender: UISlider) {
      Haptic.selection.generate(prepareForReuse: true)
      values.size = Int(sizeSlider.value.rounded())
   }
   
   @IBAction func waistChanged(_ sender: UISlider) {
      Haptic.selection.generate(prepareForReuse: true)
      values.waist = Int(waistSlider.value.rounded())
   }
   
   @IBAction func hipChanged(_ sender: UISlider) {
      Haptic.selection.generate(prepareForReuse: true)
      values.hip = Int(hipSlider.value.rounded())
   }
}
