//
//  AguaResidual.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/24/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class AguaResidual: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerDescarga: UIPickerView!
    @IBOutlet weak var pickerTratamiento: UIPickerView!
    
    @IBOutlet weak var plantaTratamiento: UISegmentedControl!
    
    var elementosDescargas = ["Fosa séptica", "Drenaje municipal", "Descarga directa a un río o lago",
                              "Descarga a una planta de tratamiento propia (en nuestro fraccionamiento)"]
    var elementosPlanta = ["Tratamiento Primario", "Tratamiento Primario y Secundario Aeróbico (Lodos Activados)", "Tratamiento Primario y Secundario Anaerobia (Generación y Quema de Biogás)",
                           "Tratamiento Primario y Secundario Anaerobia (Generación y Quema de Biogás)",
                           "Tratamiento Primario y Secundario con Humedales Artificiales",
                           "No sé"
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerDescarga.delegate = self
        pickerDescarga.dataSource = self
        pickerDescarga.tag = 0
        
        pickerTratamiento.delegate = self
        pickerTratamiento.dataSource = self
        pickerTratamiento.tag = 1
        
        
    }
    
    @IBAction func opcionPlantaTratamiento(sender: UISegmentedControl) {
        
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            return elementosDescargas.count
        } else if pickerView.tag == 1 {
            return elementosPlanta.count
        }
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return elementosDescargas[row]
        } else if pickerView.tag == 1 {
            return elementosPlanta[row]
        }
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        if pickerView.tag == 0 {
            pickerLabel.text = elementosDescargas[row]
        } else if pickerView.tag == 1 {
            pickerLabel.text = elementosPlanta[row]
        }
        
        return pickerLabel
    }

}
