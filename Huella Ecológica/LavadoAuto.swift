//
//  LavadoAuto.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class LavadoAuto: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var opcionesLavar = ["", "Manguera", "Con cubetas", "En máquina de servicio de auto-lavado"]
    var opcionesManguera = ["", "Manguera normal", "Manguera a presión y sistema de ahorro"]
    
    @IBOutlet weak var tieneAuto: UISegmentedControl!
    
    @IBAction func opcionTieneAuto(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var txtLavadas: UITextField!
    @IBOutlet weak var txtComoLavas: UITextField!
    @IBOutlet weak var txtManguera: UITextField!
    @IBOutlet weak var txtTiempo: UITextField!
    @IBOutlet weak var txtCubetas: UITextField!
    
    let pickerUno = UIPickerView()
    let pickerDos = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        crearPickerUno()
        crearPickerDos()
        
        txtLavadas.delegate = self
        txtLavadas.keyboardType = .NumberPad
        txtLavadas.addTarget(self, action: #selector(self.obtenerTextoLavadas(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtTiempo.delegate = self
        txtTiempo.keyboardType = .NumberPad
        txtTiempo.addTarget(self, action: #selector(self.obtenerTextoTiempo(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtCubetas.delegate = self
        txtCubetas.keyboardType = .NumberPad
        txtCubetas.addTarget(self, action: #selector(self.obtenerTextoCubetas(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoLavadas(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.lavadoAuto.vecesLavaCarro = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.lavadoAuto.vecesLavaCarro = 0
        }
    }
    
    func obtenerTextoTiempo(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.lavadoAuto.tiempoLavadoManguera = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.lavadoAuto.tiempoLavadoManguera = 0
        }
    }
    
    func obtenerTextoCubetas(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.lavadoAuto.numeroCubetas = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.lavadoAuto.numeroCubetas = 0
        }
    }
    
    
    
    func crearPickerUno() {
    
        pickerUno.tag = 0
        pickerUno.delegate  = self
        pickerUno.backgroundColor = .lightGrayColor()
        txtComoLavas.inputView = pickerUno
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneComoLavas))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtComoLavas.inputAccessoryView = toolbar
    }
    
    func crearPickerDos() {
        pickerDos.tag = 1
        pickerDos.delegate  = self
        pickerDos.dataSource = self
        pickerDos.backgroundColor = .lightGrayColor()
        txtManguera.inputView = pickerDos
        
        let toolbarDos = UIToolbar()
        toolbarDos.barStyle = UIBarStyle.Default
        toolbarDos.translucent = true
        toolbarDos.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbarDos.sizeToFit()
        
        let flexibleSpaceDos = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListoDos = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneManguera))
        
        toolbarDos.setItems([flexibleSpaceDos, botonListoDos], animated: true)
        toolbarDos.userInteractionEnabled = true
        
        txtManguera.inputAccessoryView = toolbarDos
    }
    
    func doneComoLavas() {
        txtComoLavas.resignFirstResponder()
        DatosHidricaCompleta.lavadoAuto.formaLavadoAuto = txtComoLavas.text!
    }
    
    func doneManguera() {
        txtManguera.resignFirstResponder()
        DatosHidricaCompleta.lavadoAuto.tipoManguera = txtManguera.text!
    }
  
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return opcionesLavar.count
        } else if pickerView.tag == 1 {
            return opcionesManguera.count
        }
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return opcionesLavar[row]
        } else if pickerView.tag == 1 {
            return opcionesManguera[row]
        }
        
        return ""
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            txtComoLavas.text = opcionesLavar[row]
            DatosHidricaCompleta.lavadoAuto.formaLavadoAuto = opcionesLavar[row]
            
        } else if pickerView.tag == 1 {
            txtManguera.text = opcionesManguera[row]
            DatosHidricaCompleta.lavadoAuto.tipoManguera = opcionesManguera[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        if pickerView.tag == 0 {
            pickerLabel.text = opcionesLavar[row]
        } else if pickerView.tag == 1 {
            pickerLabel.text = opcionesManguera[row]
        }
        
        return pickerLabel
    }

    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }

}
