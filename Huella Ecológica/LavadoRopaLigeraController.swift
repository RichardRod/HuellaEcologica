//
//  LavadoRopaLigeraController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class LavadoRopaLigeraController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtVeces: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        txtVeces.delegate = self
        txtVeces.keyboardType = .NumberPad
        txtVeces.addTarget(self, action: #selector(self.obtenerTextoRopa(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoRopa(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.lavadoRopa.vecesLavado = Int(txtVeces.text!)!
        } else {
            DatosHidricaLigera.lavadoRopa.vecesLavado = 0
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
}
