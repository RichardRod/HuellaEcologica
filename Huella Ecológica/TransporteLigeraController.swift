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
        
        if segmentAutoPropio.selectedSegmentIndex == 0 {
            DatosCarbonoLigera.transporte.tieneAuto = true
        } else if segmentAutoPropio.selectedSegmentIndex == 1 {
            DatosCarbonoLigera.transporte.tieneAuto = false
        }
    }
    
    @IBOutlet weak var segmentGasolina: UISegmentedControl!
    
    @IBAction func opcionGasolina(sender: UISegmentedControl) {
        if segmentGasolina.selectedSegmentIndex == 0 {
            DatosCarbonoLigera.transporte.usaGasolina = true
        } else if segmentGasolina.selectedSegmentIndex == 1 {
            DatosCarbonoLigera.transporte.usaGasolina = false
        }
    }
    
    @IBOutlet weak var segmentDiesel: UISegmentedControl!
    
    @IBAction func opcionDiesel(sender: AnyObject) {
        if segmentDiesel.selectedSegmentIndex == 0 {
            DatosCarbonoLigera.transporte.usaDiesel = true
        } else if segmentDiesel.selectedSegmentIndex == 1 {
            DatosCarbonoLigera.transporte.usaDiesel = false
        }
    }
    @IBOutlet weak var segmentGas: UISegmentedControl!
    
    @IBAction func opcionGas(sender: UISegmentedControl) {
        if segmentGas.selectedSegmentIndex == 0 {
            DatosCarbonoLigera.transporte.usaGas = true
        } else if segmentGas.selectedSegmentIndex == 1 {
            DatosCarbonoLigera.transporte.usaGas = false
        }
    }

    
    @IBOutlet weak var segmentHibrido: UISegmentedControl!
    
    @IBAction func opcionHibrido(sender: UISegmentedControl) {
        if segmentHibrido.selectedSegmentIndex == 0 {
            DatosCarbonoLigera.transporte.usaHibrido = true
        } else if segmentHibrido.selectedSegmentIndex == 1 {
            DatosCarbonoLigera.transporte.usaHibrido = false
        }
    }
    
    @IBOutlet weak var txtLitrosGasolina: UITextField!
    @IBOutlet weak var txtLitrosDiesel: UITextField!
    @IBOutlet weak var txtLitrosGas: UITextField!
    @IBOutlet weak var txtPesosGasolina: UITextField!
    @IBOutlet weak var txtPesosDiesel: UITextField!
    @IBOutlet weak var txtPesosGas: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentAutoPropio.selectedSegmentIndex = 1
        segmentGasolina.selectedSegmentIndex = 1
        segmentDiesel.selectedSegmentIndex = 1
        segmentGas.selectedSegmentIndex = 1
        segmentHibrido.selectedSegmentIndex = 1
        
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
    
    func obtenerTextoLitrosGasolina(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            DatosCarbonoLigera.transporte.litrosGasolina = Double(txtLitrosGasolina.text!)!
        } else {
            DatosCarbonoLigera.transporte.litrosGasolina = 0
        }
    }
    
    func obtenerTextoLitrosDiesel(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            DatosCarbonoLigera.transporte.litrosDiesel = Double(txtLitrosDiesel.text!)!
        } else {
            DatosCarbonoLigera.transporte.litrosDiesel = 0
        }
    }
    
    func obtenerTextoLitrosGas(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            DatosCarbonoLigera.transporte.litrosGas = Double(txtLitrosGas.text!)!
        } else {
            DatosCarbonoLigera.transporte.litrosGas = 0
        }
    }
    
    func obtenerTextoPesosGasolina(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            DatosCarbonoLigera.transporte.pesosGasolina = Double(txtPesosGasolina.text!)!
        } else {
            DatosCarbonoLigera.transporte.pesosGasolina = 0
        }
    }
    
    func obtenerTextoPesosDiesel(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            DatosCarbonoLigera.transporte.pesosDiesel = Double(txtPesosDiesel.text!)!
        } else {
            DatosCarbonoLigera.transporte.pesosDiesel = 0
        }
    }
    
    func obtenerTextoPesosGas(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            DatosCarbonoLigera.transporte.pesosGas = Double(txtPesosGas.text!)!
        } else {
            DatosCarbonoLigera.transporte.pesosGas = 0
        }
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
        DatosCarbonoLigera.transporte.formaTransporte = txtTransporte.text!
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
