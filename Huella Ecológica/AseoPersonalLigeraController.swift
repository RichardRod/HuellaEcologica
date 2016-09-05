//
//  AseoPersonalLigeraController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class AseoPersonalLigeraController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtManos: UITextField!
    @IBOutlet weak var txtDientes: UITextField!
    @IBOutlet weak var txtRasurado: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        txtManos.delegate = self
        txtManos.keyboardType = .NumberPad
        txtManos.addTarget(self, action: #selector(self.obtenerTextoManos(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtDientes.delegate = self
        txtDientes.keyboardType = .NumberPad
        txtDientes.addTarget(self, action: #selector(self.obtenerTextoDientes(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtRasurado.delegate = self
        txtRasurado.keyboardType = .NumberPad
        txtRasurado.addTarget(self, action: #selector(self.obtenerTextoRasurado(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoManos(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.aseo.vecesManos = Int(txtManos.text!)!
        } else {
            DatosHidricaLigera.aseo.vecesManos = 0
        }
    }
    
    func obtenerTextoDientes(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.aseo.vecesDientes = Int(txtDientes.text!)!
        } else {
            DatosHidricaLigera.aseo.vecesDientes = 0
        }
    }
    
    func obtenerTextoRasurado(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.aseo.vecesRasurado = Int(txtRasurado.text!)!
        } else {
            DatosHidricaLigera.aseo.vecesRasurado = 0
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
}
