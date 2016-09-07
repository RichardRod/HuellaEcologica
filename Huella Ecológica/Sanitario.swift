//
//  Sanitario.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class Sanitario: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var opciones = ["Sanitario con sistema dual", "Sanitario convencional. Se utiliza agua para la descarga", "En nuestra casa utilizamos letrinas, no contamos con sanitario con agua"]
    
    @IBOutlet weak var pickerSanitario: UIPickerView!
    
    @IBOutlet weak var sanitarioDual: UISegmentedControl!
    
    @IBAction func opcionSanitarioDual(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var tanque: UISegmentedControl!
    @IBOutlet weak var opcionTanque: UISegmentedControl!
    @IBOutlet weak var txtVecesDescarga: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        pickerSanitario.delegate = self
        pickerSanitario.dataSource = self
        pickerSanitario.layer.cornerRadius = 5
        
        txtVecesDescarga.delegate = self
        txtVecesDescarga.keyboardType = .NumberPad
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

    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }

}
