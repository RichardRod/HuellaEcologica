//
//  Sanitario.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class Sanitario: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var opciones = ["", "Sanitario con sistema dual", "Sanitario convencional. Se utiliza agua para la descarga", "En nuestra casa utilizamos letrinas, no contamos con sanitario con agua"]
    
    @IBOutlet weak var pickerSanitario: UIPickerView!
    
    @IBOutlet weak var sanitarioDual: UISegmentedControl!
    
    @IBAction func opcionSanitarioDual(sender: UISegmentedControl) {
        
        if sanitarioDual.selectedSegmentIndex == 0 {
            DatosHidricaCompleta.sanitario.tieneSistemaDual = true
        } else if sanitarioDual.selectedSegmentIndex == 1 {
            DatosHidricaCompleta.sanitario.tieneSistemaDual = false
        }
    }
    
    @IBOutlet weak var tanque: UISegmentedControl!
    //@IBOutlet weak var opcionTanque: UISegmentedControl!
    
    @IBAction func opcionTanque(sender: UISegmentedControl) {
        
        if tanque.selectedSegmentIndex == 0 {
            DatosHidricaCompleta.sanitario.tieneTanqueAhorrador = true
        } else if tanque.selectedSegmentIndex == 1 {
            DatosHidricaCompleta.sanitario.tieneTanqueAhorrador = false
        }
    }
    
    
    @IBOutlet weak var txtVecesDescarga: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        pickerSanitario.delegate = self
        pickerSanitario.dataSource = self
        pickerSanitario.layer.cornerRadius = 5
        
        txtVecesDescarga.delegate = self
        txtVecesDescarga.keyboardType = .NumberPad
        txtVecesDescarga.addTarget(self, action: #selector(self.obtenerTextoDescargas(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoDescargas(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.sanitario.vecesDescargar = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.sanitario.vecesDescargar = 0
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return opciones.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return opciones[row]

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
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            DatosHidricaCompleta.sanitario.tipoSanitario = opciones[row]
        }
    }

    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }

}
