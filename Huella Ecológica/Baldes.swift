//
//  Baldes.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class Baldes: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtVeces: UITextField!
    
    @IBOutlet weak var txtLitros: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        txtVeces.delegate = self
        txtVeces.keyboardType = .NumberPad
        txtVeces.addTarget(self, action: #selector(self.obtenerTextoVeces(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtLitros.delegate = self
        txtLitros.keyboardType = .NumberPad
        txtLitros.addTarget(self, action: #selector(self.obtenerTextoLitros(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoVeces(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.baldes.veces = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.baldes.veces = 0
        }
    }
    
    func obtenerTextoLitros(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.baldes.litros = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.baldes.litros = 0
        }
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }

}
