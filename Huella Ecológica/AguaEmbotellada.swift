//
//  AguaEmbotellada.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class AguaEmbotellada: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var opciones = ["Tenemos filtro para purificar el agua", "Compramos garrafones", "Compramos garrafones(20L) y botellas de Agua", "Hervimos el agua que usamos normalmente"]
    
    @IBOutlet weak var pickerObtenerAgua: UIPickerView!
    
    @IBOutlet weak var txtGarrafones: UITextField!
    
    @IBOutlet weak var txtCantidad: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        self.pickerObtenerAgua.dataSource = self
        self.pickerObtenerAgua.delegate = self
        self.pickerObtenerAgua.tag == 0
        self.pickerObtenerAgua.layer.cornerRadius = 5
        
        txtGarrafones.delegate = self
        txtGarrafones.keyboardType = .NumberPad
        txtGarrafones.addTarget(self, action: #selector(self.obtenerTextoGarrafones(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtCantidad.delegate = self
        txtCantidad.keyboardType = .NumberPad
        txtCantidad.addTarget(self, action: #selector(self.obtenerTextoCantidad(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoGarrafones(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.aguaEmbotellada.garrafones = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.aguaEmbotellada.garrafones = 0
        }
    }
    
    func obtenerTextoCantidad(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.aguaEmbotellada.consumoAgua = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.aguaEmbotellada.consumoAgua = 0
        }
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return opciones.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return opciones[row]
        }
        
        return ""
        
    }
    
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 86.0/255, green: 116/255, blue: 131/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        if pickerView.tag == 0 {
            pickerLabel.text = opciones[row]
        }
        
        return pickerLabel
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
}
