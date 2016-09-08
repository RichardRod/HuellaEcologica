//
//  LimpiezaHogar.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class LimpiezaHogar: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var opciones = ["", "Barremos con escoba", "Con agua de la manguera", "Tenemos sistema a presión"]
    
    @IBOutlet weak var txtTrapear: UITextField!
    
    @IBOutlet weak var txtAguaUtilizada: UITextField!
    
    @IBOutlet weak var txtFachada: UITextField!
    
    @IBOutlet weak var txtVecesFachada: UITextField!
    
    @IBOutlet weak var txtManguera: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        let picker = UIPickerView()
        picker.delegate  = self
        picker.backgroundColor = .lightGrayColor()
        txtFachada.inputView = picker
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneFachada))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtFachada.inputAccessoryView = toolbar
        
        txtTrapear.delegate = self
        txtTrapear.keyboardType = .NumberPad
        txtTrapear.addTarget(self, action: #selector(self.obtenerTextoTrapear(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtAguaUtilizada.delegate = self
        txtAguaUtilizada.keyboardType = .NumberPad
        txtAguaUtilizada.addTarget(self, action: #selector(self.obtenerTextoAguaUtilizada(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtVecesFachada.delegate = self
        txtVecesFachada.keyboardType = .NumberPad
        txtVecesFachada.addTarget(self, action: #selector(self.obtenerTextoVecesFachada(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtManguera.delegate = self
        txtManguera.keyboardType = .NumberPad
        txtManguera.addTarget(self, action: #selector(self.obtenerTextoManguera(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoTrapear(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.limpiezaHogar.vecesTrapear = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.limpiezaHogar.vecesTrapear = 0
        }
    }
    
    func obtenerTextoAguaUtilizada(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.limpiezaHogar.consumoAgua = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.limpiezaHogar.consumoAgua = 0
        }
    }
    
    func obtenerTextoVecesFachada(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.limpiezaHogar.vecesLimpiar = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.limpiezaHogar.vecesLimpiar = 0
        }
    }
    
    func obtenerTextoManguera(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.limpiezaHogar.tiempoAguaCorriendo = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.limpiezaHogar.tiempoAguaCorriendo = 0
        }
    }
    
    
    func doneFachada() {
        txtFachada.resignFirstResponder()
        DatosHidricaCompleta.limpiezaHogar.formaLimpieza = txtFachada.text!
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return opciones.count;
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtFachada.text = opciones[row]
        DatosHidricaCompleta.limpiezaHogar.formaLimpieza = opciones[row]
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     
        return opciones[row]
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 86.0/255, green: 116/255, blue: 131/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        if pickerView.tag == 0 {
            pickerLabel.text = opciones[row]
        }
        
        return pickerLabel
    }

    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
}
