//
//  LavadoRopa.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class LavadoRopa: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    var opciones = ["", "Lavadora", "Se lava a mano en fregadero, río, presa o lago", "La llevamos a una lavandería"]
    
    @IBOutlet weak var txtFormaLavado: UITextField!
    @IBOutlet weak var txtVecesLavadora: UITextField!
    @IBOutlet weak var txtKilosLavar: UITextField!
    @IBOutlet weak var txtPersonas: UITextField!
    @IBOutlet weak var txtKilosSemana: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        let picker = UIPickerView()
        picker.delegate  = self
        picker.backgroundColor = .lightGrayColor()
        txtFormaLavado.inputView = picker
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneForma))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtFormaLavado.inputAccessoryView = toolbar
        
        txtVecesLavadora.delegate = self
        txtVecesLavadora.keyboardType = .NumberPad
        txtVecesLavadora.addTarget(self, action: #selector(self.obtenerTextoVecesLavadora(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtKilosLavar.delegate = self
        txtKilosLavar.keyboardType = .NumberPad
        txtKilosLavar.addTarget(self, action: #selector(self.obtenerTextoKilosLavar(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtPersonas.delegate = self
        txtPersonas.keyboardType = .NumberPad
        txtPersonas.addTarget(self, action: #selector(self.obtenerTextoPersonas(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtKilosSemana.delegate = self
        txtKilosSemana.keyboardType = .NumberPad
        txtKilosSemana.addTarget(self, action: #selector(self.obtenerTextoKilosMano(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoVecesLavadora(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.lavadoRopa.vecesLavadora = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.lavadoRopa.vecesLavadora = 0
        }
    }
    
    func obtenerTextoKilosLavar(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.lavadoRopa.kilosRopaLavanderia = Double(textField.text!)!
        } else {
            DatosHidricaCompleta.lavadoRopa.kilosRopaLavanderia = 0
        }
    }
    
    func obtenerTextoPersonas(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.lavadoRopa.personasRopa = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.lavadoRopa.personasRopa = 0
        }
    }
    
    func obtenerTextoKilosMano(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.lavadoRopa.kilosRopaAMano = Double(textField.text!)!
        } else {
            DatosHidricaCompleta.lavadoRopa.kilosRopaAMano = 0
        }
    }
    
    
    
    func doneForma() {
        txtFormaLavado.resignFirstResponder()
        DatosHidricaCompleta.lavadoRopa.formaLavado = txtFormaLavado.text!
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return opciones.count;
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtFormaLavado.text = opciones[row]
        DatosHidricaCompleta.lavadoRopa.formaLavado = opciones[row]
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
