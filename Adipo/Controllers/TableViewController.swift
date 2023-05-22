//
//  TableTableViewController.swift
//  Adipo
//
//  Created by Volker Schering on 15.04.21.
//

import UIKit

protocol TableViewControllerDelegate {
   func geschlechtChanged(geschlecht: String)
   func gewichtChanged(gewicht: Int)
   func größeChanged(größe: Int)
   func tailleChanged(taillenumfang: Int)
   func hüftChanged(hüftumfang: Int)
}

class TableViewController: UITableViewController {

   var delegate : TableViewControllerDelegate?
   
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
      ageSlider.value = 50 // TODO: Wert aus Values
      
      sexSegmentControl.selectedSegmentIndex = values.sex.rawValue
//      geschlechtChanged(sexSegmentControl)
      
      weightSlider.minimumValue = 40
      weightSlider.maximumValue = 150
      weightSlider.value = Float(values.weight)
//      gewichtChanged(weightSlider)
      
      sizeSlider.minimumValue = 50
      sizeSlider.maximumValue = 220
      sizeSlider.value = Float(values.size)
//      größeChanged(sizeSlider)
      
      waistSlider.minimumValue = 50
      waistSlider.maximumValue = 150
      waistSlider.value = Float(values.waist)
//      tailleChanged(waistSlider)
      
      hipSlider.minimumValue = 50
      hipSlider.maximumValue = 150
      hipSlider.value = Float(values.hip)
//      hüftChanged(hipSlider)
   }

   // MARK: Interface Actions
   
   @IBAction func ageChanged(_ sender: UISlider) {
      values.age = Int(ageSlider.value.rounded())
      ageValueLabel.text = String(format: "%d Jahre", values.age)
   }
   
   @IBAction func sexChanged(_ sender: UISegmentedControl) {
//      values.sex.rawValue = sender.selectedSegmentIndex
   }
   
   @IBAction func weightChanged(_ sender: UISlider) {
      values.weight = Int(weightSlider.value.rounded())
      weightValueLabel.text = String(format: "%d kg", values.weight)
//      let g = Int(weightSlider.value.rounded())
//      weightValueLabel.text = String(format: "%d kg", g)
//      e.gewicht = g
//      delegate?.gewichtChanged(gewicht: g)
   }
   
   @IBAction func sizeChanged(_ sender: UISlider) {
      values.size = Int(sizeSlider.value.rounded())
      sizeValueLabel.text = String(format: "%d cm", values.size)
//      let g = Int(sizeSlider.value.rounded())
//      print(String(format: "%.1f rounded to %d", sizeSlider.value, g))
//      sizeValueLabel.text = String(format: "%d cm", g)
//      e.größe = g
//      delegate?.größeChanged(größe: g)
   }
   
   @IBAction func waistChanged(_ sender: UISlider) {
      values.waist = Int(waistSlider.value.rounded())
      waistValueLabel.text = String(format: "%d cm", values.waist)
//      let t = Int(waistSlider.value.rounded())
//      waistValueLabel.text = String(format: "%d cm", t)
//      e.taillenumfang = t
//      delegate?.tailleChanged(taillenumfang: t)
   }
   
   @IBAction func hipChanged(_ sender: UISlider) {
      values.hip = Int(hipSlider.value.rounded())
      hipValueLabel.text = String(format: "%d cm", values.hip)
//      let h = Int(hipSlider.value.rounded())
//      hipValueLabel.text = String(format: "%d cm", h)
//      e.hüftumfang = h
//      delegate?.hüftChanged(hüftumfang: h)
   }
}
