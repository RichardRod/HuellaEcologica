//
//  Cocina.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class Cocina: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var opciones = ["", "En máquina lavavajillas", "A mano en el fregadero", "A mano con agua de cubetas porque no tenemos agua en tubería"]
    
    @IBOutlet weak var txtFormaLavado: UITextField!
    @IBOutlet weak var txtVecesLavavajillas: UITextField!
    @IBOutlet weak var txtVecesFregadero: UITextField!
    @IBOutlet weak var ahorrador: UISegmentedControl!
    @IBAction func opcionAhorrador(sender: UISegmentedControl) {
        
        if ahorrador.selectedSegmentIndex == 0 {
            DatosHidricaCompleta.cocina.tieneSistemaAhorrador = true
        } else if ahorrador.selectedSegmentIndex == 1 {
            DatosHidricaCompleta.cocina.tieneSistemaAhorrador = false
        }
    }
    
    @IBOutlet weak var txtCorrido: UITextField!
    @IBOutlet weak var txtNoAgua: UITextField!
    @IBOutlet weak var txtVecesPlatos: UITextField!
    
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
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneLavado))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtFormaLavado.inputAccessoryView = toolbar
        
        txtVecesLavavajillas.delegate = self
        txtVecesLavavajillas.keyboardType = .NumberPad
        txtVecesLavavajillas.addTarget(self, action: #selector(self.obtenerTextoVecesLavavajillas(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtVecesFregadero.delegate = self
        txtVecesFregadero.keyboardType = .NumberPad
        txtVecesFregadero.addTarget(self, action: #selector(self.obtenerTextoVecesFregadero(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtCorrido.delegate = self
        txtCorrido.keyboardType = .NumberPad
        txtCorrido.addTarget(self, action: #selector(self.obtenerTextoVecesCorrido(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtNoAgua.delegate = self
        txtNoAgua.keyboardType = .NumberPad
        txtNoAgua.addTarget(self, action: #selector(self.obtenerTextoNoAgua(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtVecesPlatos.delegate = self
        txtVecesPlatos.keyboardType = .NumberPad
        txtVecesPlatos.addTarget(self, action: #selector(self.obtenerTextoVecesPlatos(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoVecesLavavajillas(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.cocina.vecesLavavajillas = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.cocina.vecesLavavajillas = 0
        }
    }
    
    func obtenerTextoVecesFregadero(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.cocina.vecesMano = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.cocina.vecesMano = 0
        }
    }
    
    func obtenerTextoNoAgua(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.cocina.tiempoAguaCorriendo = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.cocina.tiempoAguaCorriendo = 0
        }
    }
    
    func obtenerTextoVecesCorrido(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.cocina.consumoAgua = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.cocina.consumoAgua = 0
        }
    }
    
    func obtenerTextoVecesPlatos(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.cocina.vecesLavarPlatosSucios = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.cocina.vecesLavarPlatosSucios = 0
        }
    }
    
    func doneLavado() {
        txtFormaLavado.resignFirstResponder()
        DatosHidricaCompleta.cocina.formaLavado = txtFormaLavado.text!
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return opciones.count;
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtFormaLavado.text = opciones[row]
        DatosHidricaCompleta.cocina.formaLavado = opciones[row]
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
