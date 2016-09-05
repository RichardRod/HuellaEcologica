//
//  ElectricidadCarbonoCompletaController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/22/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class ElectricidadCarbonoCompletaController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtConsumo: UITextField!
    @IBOutlet weak var txtPago: UITextField!
    @IBOutlet weak var segmentPago: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        txtConsumo.delegate = self
        txtConsumo.keyboardType = .DecimalPad
        
        txtPago.delegate = self
        txtPago.keyboardType = .DecimalPad
        
    }
    
    @IBAction func opcionPago(sender: UISegmentedControl) {
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
