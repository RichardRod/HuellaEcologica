//
//  RegaderaHidricaLigeraController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class RegaderaHidricaLigeraController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtVeces: UITextField!
    @IBOutlet weak var txtTiempo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        txtVeces.delegate = self
        txtVeces.keyboardType = .NumberPad
        txtVeces.addTarget(self, action: #selector(self.obtenerTextoVeces(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtTiempo.delegate = self
        txtTiempo.keyboardType = .NumberPad
        txtTiempo.addTarget(self, action: #selector(self.obtenerTextoTiempo(_:)), forControlEvents: UIControlEvents.EditingChanged)    }
    
    func obtenerTextoVeces(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.regadera.vecesBanio = Int(txtVeces.text!)!
        } else {
            DatosHidricaLigera.regadera.vecesBanio = 0
        }
    }
    
    func obtenerTextoTiempo(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.regadera.tiempoBanio = Int(txtTiempo.text!)!
        } else {
            DatosHidricaLigera.regadera.tiempoBanio = 0
        }
    }

    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
    
}
