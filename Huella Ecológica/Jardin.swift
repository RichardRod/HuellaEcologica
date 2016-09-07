//
//  Jardin.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class Jardin: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    let pickerUno = UIPickerView()
    let pickerDos = UIPickerView()
    
    var opcionRiego = ["", "Sistema de riego por aspersión", "Sistema de riego por goteo", "Manguera", "Cubetas", "No lo riego"]
    var opcionHabitos = ["", "Se riega por las noches la cantidad necesaria sin generar desperdicios y con un sistema eficiente", "Se riega durante el día"]
    
    @IBOutlet weak var tieneJardin: UISegmentedControl!
    
    @IBAction func opcionTieneJardin(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var txtMetrosCuadrados: UITextField!
    
    @IBOutlet weak var txtRiego: UITextField!
    
    @IBOutlet weak var txtVecesRiego: UITextField!
    
    @IBOutlet weak var txtTiempoSistemaRiego: UITextField!
    
    @IBOutlet weak var txtRiegoGoteo: UITextField!
    
    @IBOutlet weak var txtTiempoSistemaGoteo: UITextField!
    
    @IBOutlet weak var txtCubetas: UITextField!
    
    @IBOutlet weak var txtHabitos: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        crearPickerUno()
        crearPickerDos()
        
        txtMetrosCuadrados.delegate = self
        txtMetrosCuadrados.keyboardType = .NumberPad
        
        txtVecesRiego.delegate = self
        txtVecesRiego.keyboardType = .NumberPad
        
        txtTiempoSistemaRiego.delegate = self
        txtTiempoSistemaRiego.keyboardType = .NumberPad
        
        txtRiegoGoteo.delegate = self
        txtRiegoGoteo.keyboardType = .NumberPad
        
        txtTiempoSistemaGoteo.delegate = self
        txtTiempoSistemaGoteo.keyboardType = .NumberPad
        
        txtCubetas.delegate = self
        txtCubetas.keyboardType = .NumberPad
        
    }
    
    func crearPickerUno() {
        pickerUno.tag == 0
        pickerUno.delegate  = self
        pickerUno.dataSource = self
        pickerUno.backgroundColor = .lightGrayColor()
        txtRiego.inputView = pickerUno
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneUno))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtRiego.inputAccessoryView = toolbar
    }
    
    func crearPickerDos() {
        pickerDos.tag == 1
        pickerDos.delegate  = self
        pickerDos.dataSource = self
        pickerDos.backgroundColor = .lightGrayColor()
        txtHabitos.inputView = pickerDos
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneDos))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtHabitos.inputAccessoryView = toolbar
    }
    
    func doneUno() {
        txtRiego.resignFirstResponder()
    }
    
    func doneDos() {
        txtHabitos.resignFirstResponder()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            return opcionRiego.count
        } else if pickerView.tag == 1 {
            return opcionHabitos.count
        }
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            txtRiego.text = opcionRiego[row]
            //txtRiego.resignFirstResponder()
            
        } else if pickerView.tag == 1 {
            txtHabitos.text = opcionHabitos[row]
            //txtHabitos.resignFirstResponder()
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            
            return opcionRiego[row]
        } else if pickerView.tag == 1 {
            return opcionHabitos[row]
        }
        
        return ""
        
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 86.0/255, green: 116/255, blue: 131/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        if pickerView.tag == 0 {
            pickerLabel.text = opcionRiego[row]
        } else if pickerView.tag == 1 {
            pickerLabel.text = opcionHabitos[row]
        }
        
        return pickerLabel
    }

    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }

}
