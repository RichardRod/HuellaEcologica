//
//  Regadera.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class Regadera: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var opcionesBaniarse = ["", "Regadera", "Tina o jacuzzi"]
    var opcionesJuntarAgua = ["", "No la junto", "No la junto, pero me meto a bañar inmediatamente aunque el agua esté fría", "Sí la junto y la utilizo en otras actividades"]
    
    @IBOutlet weak var txtBaniarse: UITextField!
    @IBOutlet weak var txtVeces: UITextField!
    @IBOutlet weak var txtTiempoBaniarse: UITextField!
    @IBOutlet weak var regaderaAhorradora: UISegmentedControl!
    
    @IBAction func opcionRegaderaAhorradora(sender: UISegmentedControl) {
        
        if regaderaAhorradora.selectedSegmentIndex == 0 {
            DatosHidricaCompleta.regadera.tieneRegaderaAhorradora = true
        } else if regaderaAhorradora.selectedSegmentIndex == 1 {
            DatosHidricaCompleta.regadera.tieneRegaderaAhorradora = false
        }
        
    }
    
    @IBOutlet weak var cerrarLlave: UISegmentedControl!
    @IBAction func opcionCerrarLlave(sender: UISegmentedControl) {
        if cerrarLlave.selectedSegmentIndex == 0 {
            DatosHidricaCompleta.regadera.cierraLlave = true
        } else if cerrarLlave.selectedSegmentIndex == 1 {
            DatosHidricaCompleta.regadera.cierraLlave = false
        }
    }
    
    @IBOutlet weak var txtTiempoEnjabonarse: UITextField!
    @IBOutlet weak var txtJuntarAgua: UITextField!
    @IBOutlet weak var txtTiempoSalirAgua: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        //opciones bañarse
        let pickerBaniarse = UIPickerView()
        pickerBaniarse.tag = 0
        pickerBaniarse.delegate  = self
        pickerBaniarse.backgroundColor = .lightGrayColor()
        txtBaniarse.inputView = pickerBaniarse
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneBaniarse))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtBaniarse.inputAccessoryView = toolbar
        
        //opciones juntar agua
        let pickerJuntarAgua = UIPickerView()
        pickerJuntarAgua.tag = 1
        pickerJuntarAgua.delegate  = self
        pickerJuntarAgua.backgroundColor = .lightGrayColor()
        txtJuntarAgua.inputView = pickerJuntarAgua
        
        let toolbarDos = UIToolbar()
        toolbarDos.barStyle = UIBarStyle.Default
        toolbarDos.translucent = true
        toolbarDos.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbarDos.sizeToFit()
        
        let flexibleSpaceDos = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListoDos = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneJuntarAgua))
        
        toolbarDos.setItems([flexibleSpaceDos, botonListoDos], animated: true)
        toolbarDos.userInteractionEnabled = true
        
        txtJuntarAgua.inputAccessoryView = toolbarDos
        
        txtVeces.delegate = self
        txtVeces.keyboardType = .NumberPad
        txtVeces.addTarget(self, action: #selector(self.obtenerTextoVeces(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtTiempoBaniarse.delegate = self
        txtTiempoBaniarse.keyboardType = .NumberPad
        txtTiempoBaniarse.addTarget(self, action: #selector(self.obtenerTextoTiempoBaniarse(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtTiempoSalirAgua.delegate = self
        txtTiempoSalirAgua.keyboardType = .NumberPad
        txtTiempoSalirAgua.addTarget(self, action: #selector(self.obtenerTextoTiempoSalirAgua(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtTiempoEnjabonarse.delegate = self
        txtTiempoEnjabonarse.keyboardType = .NumberPad
        txtTiempoBaniarse.addTarget(self, action: #selector(self.obtenerTextoTiempoEnjabonarse(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
    }
    
    func obtenerTextoVeces(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.regadera.vecesRegadera = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.regadera.vecesRegadera = 0
        }
    }
    
    func obtenerTextoTiempoBaniarse(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.regadera.tiempoBaniarse = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.regadera.tiempoBaniarse = 0
        }
    }
    
    func obtenerTextoTiempoSalirAgua(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.regadera.tiempoSalirAgua = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.regadera.tiempoSalirAgua = 0
        }
    }
    
    func obtenerTextoTiempoEnjabonarse(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.regadera.tiempoEnjabonarse = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.regadera.tiempoEnjabonarse = 0
        }
    }
    
    
    func doneBaniarse() {
        txtBaniarse.resignFirstResponder()
        DatosHidricaCompleta.regadera.opcionBaniarse = txtBaniarse.text!
    }
    
    func doneJuntarAgua() {
        txtJuntarAgua.resignFirstResponder()
        DatosHidricaCompleta.regadera.comoJuntaAguaFria = txtJuntarAgua.text!
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return opcionesBaniarse.count
        } else if pickerView.tag == 1 {
            return opcionesJuntarAgua.count
        }
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return opcionesBaniarse[row]
        } else if pickerView.tag == 1 {
            return opcionesJuntarAgua[row]
        }
        
        return ""
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            txtBaniarse.text = opcionesBaniarse[row]
           DatosHidricaCompleta.regadera.opcionBaniarse = opcionesBaniarse[row]
            
        } else if pickerView.tag == 1 {
            txtJuntarAgua.text = opcionesJuntarAgua[row]
            DatosHidricaCompleta.regadera.comoJuntaAguaFria = opcionesJuntarAgua[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        if pickerView.tag == 0 {
            pickerLabel.text = opcionesBaniarse[row]
        } else if pickerView.tag == 1 {
            pickerLabel.text = opcionesJuntarAgua[row]
        }
        
        return pickerLabel
    }

    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
}
