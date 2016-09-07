//
//  Ingreso.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/21/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class Ingreso: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var btnTerminar: UIButton!
    
    @IBOutlet weak var txtIngreso: UITextField!
    
    @IBAction func terminarAction(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "CarbonoLigera", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("Resumen")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        btnTerminar.layer.cornerRadius = 5
        
        txtIngreso.delegate = self
        txtIngreso.keyboardType = .DecimalPad
        txtIngreso.addTarget(self, action: #selector(self.obtenerTextoIngreso(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoIngreso(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            DatosCarbonoLigera.ingreso.ingreso = Double(txtIngreso.text!)!
        } else {
            DatosCarbonoLigera.ingreso.ingreso = 0
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
