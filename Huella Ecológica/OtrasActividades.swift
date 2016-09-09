//
//  OtrasActividades.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class OtrasActividades: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lavabos: UISegmentedControl!
    
    @IBAction func opcionLavabos(sender: UISegmentedControl) {
        
        if lavabos.selectedSegmentIndex == 0 {
            DatosHidricaCompleta.higuienePersonal.tieneLlaveAhorradora = true
        } else {
            DatosHidricaCompleta.higuienePersonal.tieneLlaveAhorradora = false
        }
    }
    
    @IBOutlet weak var txtManos: UITextField!
    @IBOutlet weak var txtDientes: UITextField!
    @IBOutlet weak var txtRasurado: UITextField!
    @IBOutlet weak var txtLavadoManos: UITextField!
    @IBOutlet weak var txtTiempoLavadoManos: UITextField!
    @IBOutlet weak var txtLavadoDientes: UITextField!
    @IBOutlet weak var txtTiempoLavadoDientes: UITextField!
    @IBOutlet weak var txtVecesRasurado: UITextField!
    @IBOutlet weak var txtDesmaquillas: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        txtManos.delegate = self
        txtManos.keyboardType = .NumberPad
        
        txtDientes.delegate = self
        txtDientes.keyboardType = .NumberPad
        
        txtRasurado.delegate = self
        txtRasurado.keyboardType = .NumberPad
        
        txtLavadoManos.delegate = self
        txtLavadoManos.keyboardType = .NumberPad
        txtLavadoManos.addTarget(self, action: #selector(self.obtenerTextoVecesManos(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtTiempoLavadoManos.delegate = self
        txtTiempoLavadoManos.keyboardType = .NumberPad
        txtTiempoLavadoManos.addTarget(self, action: #selector(self.obtenerTextoTiempoManos(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtLavadoDientes.delegate = self
        txtLavadoDientes.keyboardType = .NumberPad
        txtLavadoDientes.addTarget(self, action: #selector(self.obtenerTextoVecesDientes(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtTiempoLavadoDientes.delegate = self
        txtTiempoLavadoDientes.keyboardType = .NumberPad
        txtTiempoLavadoDientes.addTarget(self, action: #selector(self.obtenerTextoTiempoDientes(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtVecesRasurado.delegate = self
        txtVecesRasurado.keyboardType = .NumberPad
        txtVecesRasurado.addTarget(self, action: #selector(self.obtenerTextoVecesRasurado(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtDesmaquillas.delegate = self
        txtDesmaquillas.keyboardType = .NumberPad
        txtDesmaquillas.addTarget(self, action: #selector(self.obtenerTextoTiempoRasurado(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoVecesManos(textField: UITextField) {
        print("Cuajo: \(textField.text!)")
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.higuienePersonal.vecesManos = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.higuienePersonal.vecesManos = 0
        }
    }
    
    func obtenerTextoTiempoManos(textField: UITextField) {
        print("Cuajo: \(textField.text!)")
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.higuienePersonal.tiempoAguaManos = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.higuienePersonal.tiempoAguaManos = 0
        }
    }
    
    func obtenerTextoVecesDientes(textField: UITextField) {
        print("Cuajo: \(textField.text!)")
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.higuienePersonal.vecesDientes = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.higuienePersonal.vecesDientes = 0
        }
    }
    
    func obtenerTextoTiempoDientes(textField: UITextField) {
        print("Cuajo: \(textField.text!)")
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.higuienePersonal.tiempoAguaDientes = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.higuienePersonal.tiempoAguaDientes = 0
        }
    }
    
    func obtenerTextoVecesRasurado(textField: UITextField) {
        print("Cuajo: \(textField.text!)")
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.higuienePersonal.vecesRasurado = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.higuienePersonal.vecesRasurado = 0
        }
    }
    
    func obtenerTextoTiempoRasurado(textField: UITextField) {
        print("Cuajo: \(textField.text!)")
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.higuienePersonal.tiempoRasurado = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.higuienePersonal.tiempoRasurado = 0
        }
    }

    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }

}
