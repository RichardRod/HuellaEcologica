//
//  Combustible.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 7/30/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class CombustibleLigeraViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    let pickerCombustible = UIPickerView()
    let pickerConsumo = UIPickerView()
    
    @IBOutlet weak var txtTipoConsumo: UITextField!
    @IBOutlet weak var txtCombustible: UITextField!
    @IBOutlet weak var txtConsumo: UITextField!
    
    var opcionesCombustible = ["", "Gas LP (Tanque estacionario o cilindros)", "Gas Natural (Conexión a red de gas natural)", "Leña", "Carbón vegetal"]
    var opcionesConsumo = ["", "Consumo en pesos", "Consumo en Kilogramos", "Consumo en litros"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

        crearPickerCombustible()
        crearPickerConsumo()
        
        txtConsumo.delegate = self
        txtConsumo.keyboardType = .DecimalPad
        txtConsumo.addTarget(self, action: #selector(self.obtenerTextoConsumo(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoConsumo(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            DatosCarbonoLigera.combustible.consumo = Double(txtConsumo.text!)!
        } else {
            DatosCarbonoLigera.combustible.consumo = 0
        }
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
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(CombustibleLigeraViewController.doneCombustible))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtCombustible.inputAccessoryView = toolbar
    }
    
    internal func doneCombustible() {
        txtCombustible.resignFirstResponder()
        DatosCarbonoLigera.combustible.tipoCombustible = txtCombustible.text!
    }
    
    private func crearPickerConsumo() {
        pickerConsumo.tag = 1
        pickerConsumo.delegate  = self
        pickerConsumo.backgroundColor = .lightGrayColor()
        txtTipoConsumo.inputView = pickerConsumo
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(CombustibleLigeraViewController.doneConsumo))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtTipoConsumo.inputAccessoryView = toolbar
    }
    
    func doneConsumo() {
        txtTipoConsumo.resignFirstResponder()
        DatosCarbonoLigera.combustible.tipoConsumo = txtTipoConsumo.text!
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            return opcionesCombustible.count
        } else if pickerView.tag == 1 {
            return opcionesConsumo.count
        }
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return opcionesCombustible[row]
        } else if pickerView.tag == 1 {
            return opcionesConsumo[row]
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            txtCombustible.text = opcionesCombustible[row]
            DatosCarbonoLigera.combustible.tipoCombustible = opcionesCombustible[row]
            
            if row == 3 || row == 4 {
                txtTipoConsumo.hidden = true
            } else {
                txtTipoConsumo.hidden = false
            }
        } else if pickerView.tag == 1 {
            txtTipoConsumo.text = opcionesConsumo[row]
            DatosCarbonoLigera.combustible.tipoConsumo = opcionesConsumo[row]
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
            pickerLabel.text = opcionesConsumo[row]
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
