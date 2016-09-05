//
//  TransporteLigeraController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/21/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class TransporteLigeraController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var txtTransporte: UITextField!
    var opcionesTransporte = ["Auto particular", "Transporte público", "Motocicleta", "Taxi", "Bicicleta", "Caminar"]
    
    @IBOutlet weak var segmentAutoPropio: UISegmentedControl!
    
    @IBAction func opcionAutoPropio(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var segmentGasolina: UISegmentedControl!
    
    @IBAction func opcionGasolina(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var segmentDiesel: UISegmentedControl!
    
    @IBAction func opcionDiesel(sender: AnyObject) {
    }
    @IBOutlet weak var segmentGas: UISegmentedControl!
    
    @IBAction func opcionGas(sender: UISegmentedControl) {
    }

    
    @IBOutlet weak var segmentHibrido: UISegmentedControl!
    
    @IBAction func opcionHibrido(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var txtLitrosGasolina: UITextField!
    @IBOutlet weak var txtLitrosDiesel: UITextField!
    @IBOutlet weak var txtLitrosGas: UITextField!
    @IBOutlet weak var txtPesosGasolina: UITextField!
    @IBOutlet weak var txtPesosDiesel: UITextField!
    @IBOutlet weak var txtPesosGas: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        crearPickerTransporte()
        
        txtLitrosGasolina.delegate = self
        txtLitrosGasolina.keyboardType = .DecimalPad
        
        txtLitrosDiesel.delegate = self
        txtLitrosDiesel.keyboardType = .DecimalPad
        
        txtLitrosGas.delegate = self
        txtLitrosGas.keyboardType = .DecimalPad
        
        txtPesosGasolina.delegate = self
        txtPesosGasolina.keyboardType = .DecimalPad
        
        txtPesosDiesel.delegate = self
        txtPesosDiesel.keyboardType = .DecimalPad
        
        txtPesosGas.delegate = self
        txtPesosGas.keyboardType = .DecimalPad
    }
    
    let pickerTransporte = UIPickerView()
    
    func crearPickerTransporte() {
        pickerTransporte.tag = 0
        pickerTransporte.delegate  = self
        pickerTransporte.backgroundColor = .lightGrayColor()
        txtTransporte.inputView = pickerTransporte
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(TransporteLigeraController.doneTransporte))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        
        toolbar.userInteractionEnabled = true
        
        txtTransporte.inputAccessoryView = toolbar
    }
    
    func doneTransporte() {
        txtTransporte.resignFirstResponder()
    }
    
    func textField(textField: UITextField,shouldChangeCharactersInRange range: NSRange,replacementString string: String) -> Bool
    {
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
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            return opcionesTransporte.count
        }
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return opcionesTransporte[row]
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            txtTransporte.text = opcionesTransporte[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        if pickerView.tag == 0 {
            pickerLabel.text = opcionesTransporte[row]
        }
        return pickerLabel
    }

}
