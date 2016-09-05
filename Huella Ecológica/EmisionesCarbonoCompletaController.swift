//
//  EmisionesCarbonoCompletaController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/22/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class EmisionesCarbonoCompletaController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var txtCombustible: UITextField!
    let pickerCombustible = UIPickerView()
    
    @IBOutlet weak var txtConsumo: UITextField!
    let pickerConsumo = UIPickerView()
    
    @IBOutlet weak var txtConsumoPesos: UITextField!
    @IBOutlet weak var txtCarbono: UITextField!
    @IBOutlet weak var txtLenia: UITextField!
    
    var opcionesCombustible = ["Gas LP (Tanque estacionario o cilindros)", "Gas Natural (Conexión a red de gas natural)", "Leña", "Carbón vegetal"]
    
    var opcionesUnidad = ["Consumo de Gas en pesos", "Consumo de Gas en kilogramos", "Consumo de Gas en litros"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        crearPickerCombustible()
        crearPickerConsumo()
        
        self.hideKeyboardWhenTappedAround()
        
        txtConsumoPesos.delegate = self
        txtConsumoPesos.keyboardType = .DecimalPad
        
        txtCarbono.delegate = self
        txtCarbono.keyboardType = .DecimalPad
        
        txtLenia.delegate = self
        txtLenia.keyboardType = .DecimalPad
    }
    
    
    private func crearPickerCombustible() {
        
        pickerCombustible.tag = 0
        pickerCombustible.delegate  = self
        pickerCombustible.backgroundColor = .lightGrayColor()
        txtCombustible.inputView = pickerCombustible
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(EmisionesCarbonoCompletaController.doneCombustible))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtCombustible.inputAccessoryView = toolbar
    }
    
    func doneCombustible() {
        txtCombustible.resignFirstResponder()
    }
    
    private func crearPickerConsumo() {
        pickerConsumo.tag = 1
        pickerConsumo.delegate  = self
        pickerConsumo.backgroundColor = .lightGrayColor()
        txtConsumo.inputView = pickerConsumo
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(EmisionesCarbonoCompletaController.doneConsumo))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtConsumo.inputAccessoryView = toolbar

    }
    
    func doneConsumo() {
        txtConsumo.resignFirstResponder()
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return opcionesCombustible.count
        } else if pickerView.tag == 1 {
            return opcionesUnidad.count
        }
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return opcionesCombustible[row]
        } else if pickerView.tag == 1 {
            return opcionesUnidad[row]
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            txtCombustible.text = opcionesCombustible[row]
            //DatosCarbono.Informacion_Municipio = txtMunicipio.text!
        } else if pickerView.tag == 1 {
            txtConsumo.text = opcionesUnidad[row]
            //DatosCarbono.Informacion_Sexo = txtSexo.text!
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        if pickerView.tag == 0 {
            pickerLabel.text = opcionesCombustible[row]
        } else if pickerView.tag == 1 {
            pickerLabel.text = opcionesUnidad[row]
        }
        
        return pickerLabel
    }
    
    func textField(textField: UITextField,shouldChangeCharactersInRange range: NSRange,replacementString string: String) -> Bool {
        
        let newCharacters = NSCharacterSet(charactersInString: string)
        let boolIsNumber = NSCharacterSet.decimalDigitCharacterSet().isSupersetOfSet(newCharacters)
        if boolIsNumber == true {
            return true
        } else {
            if string == "." {
                let countdots = textField.text!.componentsSeparatedByString(".").count - 1
                if countdots == 0 {
                    return true
                } else {
                    if countdots > 0 && string == "." {
                        return false
                    } else {
                        return true
                    }
                }
            } else {
                return false
            }
        }
    }


}
