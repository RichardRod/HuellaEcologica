//
//  Carbono.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/24/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class Carbono: UIViewController, UITextFieldDelegate, UIPickerViewDataSource ,UIPickerViewDelegate {
    
    @IBOutlet weak var txtArboles: UITextField!
    @IBOutlet weak var txtDiametro: UITextField!
    @IBOutlet weak var txtMetros: UITextField!
    
    var elementosDiametro = ["Menos 10 cm", "10 a 20 cm", "20 a 30 cm", "30 a 50 cm"]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        txtArboles.delegate = self
        txtArboles.keyboardType = .NumberPad
        
        txtMetros.delegate = self
        txtMetros.keyboardType = .NumberPad
        
        let picker = UIPickerView()
        picker.tag = 0
        picker.delegate = self
        txtDiametro.inputView = picker
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            return elementosDiametro.count
        }
        
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return elementosDiametro[row]
        }
        return ""
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            txtDiametro.text = elementosDiametro[row]
            txtDiametro.resignFirstResponder()
            
        }
    }
}
