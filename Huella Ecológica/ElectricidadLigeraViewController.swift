//
//  ElectricidadLigeraViewController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 7/30/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class ElectricidadLigeraViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtConsumo: UITextField!
    @IBOutlet weak var segmentPago: UISegmentedControl!
    @IBOutlet weak var txtPago: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

        txtConsumo.delegate = self
        txtConsumo.keyboardType = .DecimalPad
        txtConsumo.addTarget(self, action: #selector(self.obtenerTextoConsumo(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtPago.delegate = self
        txtPago.keyboardType = .DecimalPad
        txtPago.addTarget(self, action: #selector(self.obtenerTextoPago(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoConsumo(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            DatosCarbonoLigera.electricidad.consumo = Double(txtConsumo.text!)!
        } else {
            DatosCarbonoLigera.electricidad.consumo = 0
        }
    }
    
    func obtenerTextoPago(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            if segmentPago.selectedSegmentIndex == 0 {
                DatosCarbonoLigera.electricidad.pago = Double(txtPago.text!)!
                print("Mensual")
            } else if segmentPago.selectedSegmentIndex == 1 {
                DatosCarbonoLigera.electricidad.pago = Double(txtPago.text!)! / 2
                print("Bimestral")
            }
            
        } else {
            DatosCarbonoLigera.electricidad.pago = 0
        }
    }
    
    func textField(textField: UITextField,shouldChangeCharactersInRange range: NSRange,replacementString string: String) -> Bool
    {
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
    
    @IBAction func opcionPago(sender: UISegmentedControl) {
    }

}
