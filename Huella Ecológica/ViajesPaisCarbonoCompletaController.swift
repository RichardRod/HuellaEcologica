//
//  ViajesPaisCarbonoCompletaController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/24/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class ViajesPaisCarbonoCompletaController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var txtEstado: UITextField!
    let pickerEstado = UIPickerView()
    
    @IBOutlet weak var txtViajes: UITextField!
    @IBOutlet weak var txtPasaje: UITextField!
    
    @IBOutlet weak var txtVehiculo: UITextField!
    let pickerVehiculo = UIPickerView()
    
    @IBOutlet weak var txtModelo: UITextField!
    let pickerModelo = UIPickerView()
    
    @IBOutlet weak var btnAgregar: UIButton!
    
    var opcionesEstado = ["Aguascalientes", "Baja California", "Baja California Sur", "Campeche",
                          "Coahuila", "Colima", "Chiapas", "Chihuahua", "Distrito Federal", "Durango",
                          "Guanajuato", "Guerrero", "Hidalgo", "Jalisco", "México", "Michoacán",
                          "Morelos", "Nayarit", "Nuevo León", "Oaxaca", "Puebla", "Querétaro", "Quintana Roo", "San Luis Potosí", "Sinaloa", "Sonora", "Tabasco", "Tamaulipas",
                          "Tlaxcala", "Veracruz", "Yucatán", "Zacatecas"]
    
    var opcionesVehiculo = ["Vehículos 4 cilindros pequeños o híbridos", "4 Cilindros", "6 Cilindros",
                            "SUV 4 cilindros", "SUV 6 cil y pickup chicas", "Pick up 6 cilindros", "Pick up o VAN 8 cilindros", "Bus de pasajeros"]
    
    var opcionesModelo = ["2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "Otro"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        btnAgregar.layer.cornerRadius = 5
        crearPickerEstado()
        crearPickerVehiculo()
        crearPickerModelo()
        
        txtViajes.delegate = self
        txtViajes.keyboardType = .NumberPad
        
        txtModelo.delegate = self
        txtModelo.keyboardType = .NumberPad
    }
    
    private func crearPickerEstado() {
        pickerEstado.tag = 0
        pickerEstado.delegate  = self
        pickerEstado.backgroundColor = .lightGrayColor()
        txtEstado.inputView = pickerEstado
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneEstado))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtEstado.inputAccessoryView = toolbar
    }
    
    func doneEstado() {
        print("Estado")
    }
    
    private func crearPickerVehiculo() {
        pickerVehiculo.tag = 1
        pickerVehiculo.delegate  = self
        pickerVehiculo.backgroundColor = .lightGrayColor()
        txtVehiculo.inputView = pickerVehiculo
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneVehiculo))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtVehiculo.inputAccessoryView = toolbar
    }
    
    func doneVehiculo() {
        print("Estado")
    }
    
    private func crearPickerModelo() {
        pickerModelo.tag = 2
        pickerModelo.delegate  = self
        pickerModelo.backgroundColor = .lightGrayColor()
        txtModelo.inputView = pickerModelo
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneModelo))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtModelo.inputAccessoryView = toolbar
    }
    
    func doneModelo() {
        print("Estado")
    }

    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return opcionesEstado.count
        } else if pickerView.tag == 1 {
            return opcionesVehiculo.count
        } else if pickerView.tag == 2 {
            return opcionesModelo.count
        }
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return opcionesEstado[row]
        } else if pickerView.tag == 1 {
            return opcionesVehiculo[row]
        } else if pickerView.tag == 2 {
            return opcionesModelo[row]
        }
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            txtEstado.text = opcionesEstado[row]
            //txtOrigen.resignFirstResponder()
        } else if pickerView.tag == 1 {
            txtVehiculo.text = opcionesVehiculo[row]
            //txtDestino.resignFirstResponder()
        } else if pickerView.tag == 2 {
            txtModelo.text = opcionesModelo[row]
            //txtVehiculo.resignFirstResponder()
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        if pickerView.tag == 0 {
            pickerLabel.text = opcionesEstado[row]
        } else if pickerView.tag == 1 {
            pickerLabel.text = opcionesVehiculo[row]
        } else if pickerView.tag == 2 {
            pickerLabel.text = opcionesModelo[row]
        }
        
        return pickerLabel
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }

}
