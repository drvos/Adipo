//
//  TableTableViewController.swift
//  Adipo
//
//  Created by Volker Schering on 15.04.21.
//

import UIKit

class TableViewController: UITableViewController {

   var delegate : TableViewControllerDelegate?
   
   @IBOutlet weak var geschlechtSegmentControl: UISegmentedControl!
   
   @IBOutlet weak var gewichtLabel: UILabel!
   @IBOutlet weak var gewichtSlider: UISlider!
   @IBOutlet weak var gewichtValueLabel: UILabel!
   
   @IBOutlet weak var größeLabel: UILabel!
   @IBOutlet weak var größeSlider: UISlider!
   @IBOutlet weak var größeValueLabel: UILabel!
   
   @IBOutlet weak var tailleLabel: UILabel!
   @IBOutlet weak var tailleSlider: UISlider!
   @IBOutlet weak var tailleValueLabel: UILabel!
   
   @IBOutlet weak var hüftLabel: UILabel!
   @IBOutlet weak var hüftSlider: UISlider!
   @IBOutlet weak var hüftValueLabel: UILabel!
   
   // Klasse für Einstellungen
   let e = Einstellungen.init()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Geschlecht initialisieren
      switch e.geschlecht {
         case "w":
            geschlechtSegmentControl.selectedSegmentIndex = 0 // weiblich
         case "m":
            geschlechtSegmentControl.selectedSegmentIndex = 1 // männlich
         default:
            geschlechtSegmentControl.selectedSegmentIndex = 0 // weiblich
      }
      geschlechtChanged(geschlechtSegmentControl)
      
      // Gewicht initialisieren
      gewichtSlider.minimumValue = 40
      gewichtSlider.maximumValue = 150
      gewichtSlider.value = Float(e.gewicht)
      gewichtChanged(gewichtSlider)
      
      // Größe initialisieren
      größeSlider.minimumValue = 50
      größeSlider.maximumValue = 220
      größeSlider.value = Float(e.größe)
      größeChanged(größeSlider)
      
      // Taillenumfang initialisieren
      tailleSlider.minimumValue = 50
      tailleSlider.maximumValue = 150
      tailleSlider.value = Float(e.taillenumfang)
      tailleChanged(tailleSlider)
      
      // Hüftumfang initialisieren
      hüftSlider.minimumValue = 50
      hüftSlider.maximumValue = 150
      hüftSlider.value = Float(e.hüftumfang)
      hüftChanged(hüftSlider)
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
      let g = Int(gewichtSlider.value.rounded())
      gewichtValueLabel.text = String(format: "%d kg", g)
      e.gewicht = g
      delegate?.gewichtChanged(gewicht: g)
   }
   
   @IBAction func größeChanged(_ sender: UISlider) {
      let g = Int(größeSlider.value.rounded())
      print(String(format: "%.1f rounded to %d", größeSlider.value, g))
      größeValueLabel.text = String(format: "%d cm", g)
      e.größe = g
      delegate?.größeChanged(größe: g)
   }
   
   @IBAction func tailleChanged(_ sender: UISlider) {
      let t = Int(tailleSlider.value.rounded())
      tailleValueLabel.text = String(format: "%d cm", t)
      e.taillenumfang = t
      delegate?.tailleChanged(taillenumfang: t)
   }
   
   @IBAction func hüftChanged(_ sender: UISlider) {
      let h = Int(hüftSlider.value.rounded())
      hüftValueLabel.text = String(format: "%d cm", h)
      e.hüftumfang = h
      delegate?.hüftChanged(hüftumfang: h)
   }
}

protocol TableViewControllerDelegate {
   func geschlechtChanged(geschlecht: String)
   func gewichtChanged(gewicht: Int)
   func größeChanged(größe: Int)
   func tailleChanged(taillenumfang: Int)
   func hüftChanged(hüftumfang: Int)
}
