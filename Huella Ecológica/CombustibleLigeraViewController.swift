//
//  Combustible.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 7/30/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class CombustibleLigeraViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    let pickerCombustible = UIPickerView()
    
    @IBOutlet weak var txtCombustible: UITextField!
    @IBOutlet weak var txtConsumo: UITextField!
    
    var opcionesCombustible = ["Gas LP (Tanque estacionario o cilindros)", "Gas Natural (Conexión a red de gas natural)", "Leña", "Carbón vegetal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        crearPickerCombustible()
        
        txtConsumo.delegate = self
        txtConsumo.keyboardType = .NumberPad
        txtConsumo.addTarget(self, action: #selector(self.obtenerTextoConsumo(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func obtenerTextoConsumo(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            //DatosCarbonoLigera.combustible.consumo = Int(txtConsumo.text!)!
        } else {
            //DatosCarbonoLigera.combustible.consumo = 0
        }
    }
    
    private func crearPickerCombustible() {
        pickerCombustible.tag = 0
        pickerCombustible.delegate  = self
        pickerCombustible.backgroundColor = .lightGrayColor()
        txtCombustible.inputView = pickerCombustible
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CombustibleLigeraViewController.doneCombustible))
        toolbar.setItems([botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtCombustible.inputAccessoryView = toolbar
    }
    
    internal func doneCombustible() {
        txtCombustible.resignFirstResponder()
        //DatosCarbonoLigera.combustible.consumo = Int(txtCombustible.text!)!
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            return opcionesCombustible.count
        }
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return opcionesCombustible[row]
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            txtCombustible.text = opcionesCombustible[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        if pickerView.tag == 0 {
            pickerLabel.text = opcionesCombustible[row]
        }
        return pickerLabel
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
}
