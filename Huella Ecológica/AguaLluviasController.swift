//
//  AguaLluviasController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/6/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class AguaLluvias: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var opcionesComienzo = ["", "Segunda mitad de Mayo", "Primera mitad de Junio", "Segunda mitad de Junio", "Primera mitad de Julio", "Segunda mitad de Julio"]
    
    var opcionesTermina = ["", "Primera mitad de Septiembre", "Segunda mitad de Septiembre", "Primera mitad de Octubre", "Segunda mitad de Octubre", "Primera mitad de Noviembre"]
    
    @IBOutlet weak var colectaAgua: UISegmentedControl!
    
    @IBAction func opcionColectaAgua(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var pickerComienzo: UIPickerView!
    @IBOutlet weak var pickerTermina: UIPickerView!
    @IBOutlet weak var txtCantidadAgua: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        pickerComienzo.delegate = self
        pickerComienzo.dataSource = self
        pickerComienzo.tag = 0
        pickerComienzo.layer.cornerRadius = 5
        
        pickerTermina.delegate = self
        pickerTermina.dataSource = self
        pickerTermina.tag = 1
        pickerTermina.layer.cornerRadius = 5
        
        txtCantidadAgua.delegate = self
        txtCantidadAgua.keyboardType = .DecimalPad
        txtCantidadAgua.addTarget(self, action: #selector(self.obtenerTextoCantidad(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
    }
    
    func obtenerTextoCantidad(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.aguaLluvias.aguaRecolectada = Double(textField.text!)!
        } else {
            DatosHidricaCompleta.aguaLluvias.aguaRecolectada = 0.0
        }
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            return opcionesComienzo.count
        } else if pickerView.tag == 1 {
            return opcionesTermina.count
        }
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return opcionesComienzo[row]
        } else if pickerView.tag == 1 {
            return opcionesTermina[row]
        }
        
        return ""
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            DatosHidricaCompleta.aguaLluvias.inicioTemporal = opcionesComienzo[row]
        } else if pickerView.tag == 1 {
            DatosHidricaCompleta.aguaLluvias.finTemporal = opcionesTermina[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        if pickerView.tag == 0 {
            
            pickerLabel.textColor = UIColor(red: 86.0/255, green: 116/255, blue: 131/255, alpha: 1.0)
            pickerLabel.text = opcionesComienzo[row]
            pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
            pickerLabel.textAlignment = NSTextAlignment.Center
            
        } else if pickerView.tag == 1 {
            pickerLabel.textColor = UIColor(red: 86.0/255, green: 116/255, blue: 131/255, alpha: 1.0)
            pickerLabel.text = opcionesTermina[row]
            pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
            pickerLabel.textAlignment = NSTextAlignment.Center
        }
        
        return pickerLabel
        
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
}