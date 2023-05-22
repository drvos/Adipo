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
   
   // Klasse für Einstellungen
   let e = Einstellungen.init()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Geschlecht initialisieren
      switch e.geschlecht {
         case "w":
            sexSegmentControl.selectedSegmentIndex = 0 // weiblich
         case "m":
            sexSegmentControl.selectedSegmentIndex = 1 // männlich
         default:
            sexSegmentControl.selectedSegmentIndex = 0
      }
      geschlechtChanged(sexSegmentControl)
      
      // Gewicht initialisieren
      weightSlider.minimumValue = 40
      weightSlider.maximumValue = 150
      weightSlider.value = Float(e.gewicht)
      gewichtChanged(weightSlider)
      
      // Größe initialisieren
      sizeSlider.minimumValue = 50
      sizeSlider.maximumValue = 220
      sizeSlider.value = Float(e.größe)
      größeChanged(sizeSlider)
      
      // Taillenumfang initialisieren
      waistSlider.minimumValue = 50
      waistSlider.maximumValue = 150
      waistSlider.value = Float(e.taillenumfang)
      tailleChanged(waistSlider)
      
      // Hüftumfang initialisieren
      hipSlider.minimumValue = 50
      hipSlider.maximumValue = 150
      hipSlider.value = Float(e.hüftumfang)
      hüftChanged(hipSlider)
   }

   // MARK: - Table view data source

   override func numberOfSections(in tableView: UITableView) -> Int {
      return 3
   }

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      switch section {
         case 0:  // Geschlecht
            return 1
         case 1:  // Body-Mass-Index
            return 2
         case 2:  // Taille-Hüft-Quotient
            return 2
         default:
            return 0
      }
   }
   
   // MARK: Interface Actions
   
   @IBAction func geschlechtChanged(_ sender: UISegmentedControl) {
      if (sender.selectedSegmentIndex == 0) {
         e.geschlecht = "w"
         delegate?.geschlechtChanged(geschlecht: "weiblich")
      } else if (sender.selectedSegmentIndex == 1) {
         e.geschlecht = "m"
         delegate?.geschlechtChanged(geschlecht: "männlich")
      }
   }
   
   @IBAction func gewichtChanged(_ sender: UISlider) {
      let g = Int(weightSlider.value.rounded())
      weightValueLabel.text = String(format: "%d kg", g)
      e.gewicht = g
      delegate?.gewichtChanged(gewicht: g)
   }
   
   @IBAction func größeChanged(_ sender: UISlider) {
      let g = Int(sizeSlider.value.rounded())
      print(String(format: "%.1f rounded to %d", sizeSlider.value, g))
      sizeValueLabel.text = String(format: "%d cm", g)
      e.größe = g
      delegate?.größeChanged(größe: g)
   }
   
   @IBAction func tailleChanged(_ sender: UISlider) {
      let t = Int(waistSlider.value.rounded())
      waistValueLabel.text = String(format: "%d cm", t)
      e.taillenumfang = t
      delegate?.tailleChanged(taillenumfang: t)
   }
   
   @IBAction func hüftChanged(_ sender: UISlider) {
      let h = Int(hipSlider.value.rounded())
      hipValueLabel.text = String(format: "%d cm", h)
      e.hüftumfang = h
      delegate?.hüftChanged(hüftumfang: h)
   }
}
