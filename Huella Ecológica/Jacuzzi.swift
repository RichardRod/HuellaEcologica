//
//  Jacuzzi.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class Jacuzzi: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtVeces: UITextField!
    
    @IBOutlet weak var txtPersonas: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        txtVeces.delegate = self
        txtVeces.keyboardType = .NumberPad
        txtVeces.addTarget(self, action: #selector(self.obtenerTextoVeces(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtPersonas.delegate = self
        txtPersonas.keyboardType = .NumberPad
        txtPersonas.addTarget(self, action: #selector(self.obtenerTextoPersonas(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoVeces(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.jacuzzi.veces = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.jacuzzi.veces = 0
        }
    }
    
    func obtenerTextoPersonas(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.jacuzzi.personas = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.jacuzzi.personas = 0
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }

}
