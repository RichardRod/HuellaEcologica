//
//  Alberca.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class Alberca: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var alberca: UISegmentedControl!
    @IBAction func opcionAlberca(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var txtLargo: UITextField!
    @IBOutlet weak var txtAncho: UITextField!
    @IBOutlet weak var txtProfundidad: UITextField!
    @IBOutlet weak var txtVeces: UITextField!
    @IBOutlet weak var cubierta: UISegmentedControl!
    
    @IBAction func opcionCubierta(sender: UISegmentedControl) {
        if cubierta.selectedSegmentIndex == 0 {
            DatosHidricaCompleta.alberca.isCubierta = true
        } else if cubierta.selectedSegmentIndex == 1 {
            DatosHidricaCompleta.alberca.isCubierta = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        txtLargo.delegate = self
        txtLargo.keyboardType = .DecimalPad
        txtLargo.addTarget(self, action: #selector(self.obtenerTextoLargo(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtAncho.delegate = self
        txtAncho.keyboardType = .DecimalPad
        txtAncho.addTarget(self, action: #selector(self.obtenerTextoAncho(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtProfundidad.delegate = self
        txtProfundidad.keyboardType = .DecimalPad
        txtProfundidad.addTarget(self, action: #selector(self.obtenerTextoProfundidad(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtVeces.delegate = self
        txtVeces.keyboardType = .NumberPad
        txtVeces.addTarget(self, action: #selector(self.obtenerTextoVeces(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoLargo(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alberca.largo = Double(textField.text!)!
        } else {
            DatosHidricaCompleta.alberca.largo = 0.0
        }
    }
    
    func obtenerTextoAncho(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alberca.ancho = Double(textField.text!)!
        } else {
            DatosHidricaCompleta.alberca.ancho = 0.0
        }
    }
    
    func obtenerTextoProfundidad(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alberca.profundidad = Double(textField.text!)!
        } else {
            DatosHidricaCompleta.alberca.profundidad = 0.0
        }
    }
    
    func obtenerTextoVeces(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alberca.vecesCambio = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alberca.vecesCambio = 0
        }
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
