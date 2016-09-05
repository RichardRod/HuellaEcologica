//
//  AguaCarbonoCompletaController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/22/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class AguaCarbonoCompletaController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var pickerFuente: UIPickerView!
    @IBOutlet weak var txtConsumo: UITextField!
    
    var elementos = [
                    "",
                    "Red de agua potable del municipio o colonia (llega por tubería)",
                    "Compramos agua en pipas o contenedores",
                    "Nosotros obtenemos el agua directamente de un pozo cercano",
                    "Nosotros obtenemos el agua directamente de un río, presa o lago cercano"
                    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        txtConsumo.delegate = self
        txtConsumo.keyboardType = .DecimalPad
        
        pickerFuente.layer.cornerRadius = 5
        pickerFuente.delegate = self
        pickerFuente.dataSource = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return elementos.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return elementos[row]
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        pickerLabel.text = elementos[row]
        
        return pickerLabel
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
