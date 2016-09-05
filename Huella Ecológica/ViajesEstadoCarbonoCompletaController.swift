//
//  ViajesEstadoCarbonoCompletaController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/22/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class ViajesEstadoCarbonoCompletaController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var txtOrigen: UITextField!
    let pickerOrigen = UIPickerView()
    
    @IBOutlet weak var txtDestino: UITextField!
    let pickerDestino = UIPickerView()
    
    @IBOutlet weak var txtViajes: UITextField!
    @IBOutlet weak var txtPasajeros: UITextField!
    
    @IBOutlet weak var txtVehiculo: UITextField!
    let pickerVehiculo = UIPickerView()
    
    @IBOutlet weak var txtModelo: UITextField!
    let pickerModelo = UIPickerView()
    
    @IBOutlet weak var btnAgregar: UIButton!
    
    var opcionesMunicipio = ["Acatic", "Acatlán de Juárez", "Ahualulco de Mercado", "Amacueca", "Amatitán", "Ameca", "San Juanito de Escobedo", "Arandas", "El Arenal", "Atemajac de Brizuela", "Atengo", "Atenguillo", "Atotonilco el Alto", "Atoyac", "Autlán de Navarro", "Ayotlán", "Ayutla", "La Barca", "Bolaños", "Cabo Corrientes", "Cañadas de Obregón", "Casimiro Castillo", "Cihuatlán", "Zapotlán el Grande", "Cocula", "Colotlán", "Concepción de Buenos Aires", "Cuautitlán de García Barragán", "Cuautla", "Cuquío", "Chapala", "Chimaltitán", "Chiquilistlán", "De gollado", "Ejutla", "Encarnación de Díaz", "Etzatlán", "El Grullo", "El Limón", "Guachinango", "Guadalajara", "Hostotipaquillo", "Huejúcar", "Huejuquilla el Alto", "La Huerta", "Ixtlahuacán de los Membrillos", "Ixtlahuacán del Río", "Jalostotitlán", "Jamay", "Jesús María", "Jilotlán de los Dolores", "Jocotepec", "Juanacatlán", "Juchitlán", "Lagos de Moreno", "Magdalena", "Santa María del Oro", "La Manzanilla de la Paz", "Mascota", "Mazamitla", "Mexticacán", "Mezquitic", "Mixtlán", "Ocotlán", "Ojuelos de Jalisco", "Pihuamo", "Poncitlán", "Puerto Vallarta", "Villa Purificación", "Quitupan", "El Salto", "San Cristóbal de la Barranca", "San Diego de Alejandría", "San Juan de los Lagos", "San Julián", "San Marcos", "San Martín de Bolaños", "San Martín Hidalgo", "San Miguel el Alto", "Gómez Farías", "San Sebastián del Oeste", "Santa María de los Ángeles", "Sayula", "Tala", "Talpa de Allende", "Tamazula de Gordiano", "Tapalpa", "Tecalitlán", "Tecolotlán", "Techaluta de Montenegro", "Tenamaxtlán", "Teocaltiche", "Teocuitatlán de Corona", "Tepatitlán de Morelos", "Tepatitlán de Morelos", "Teuchitlán", "Tizapán el Alto", "Tlajomulco de Zúñiga", "Tlaquepaque", "Tolimán", "Tomatlán", "Tonalá", "Tonaya", "Tonila", "Totatiche", "Tototlán", "Tuxcacuesco", "Tuxcueca", "Tuxpan", "Unión de San Antonio", "Unión de Tula", "Valle de Guadalupe", "Valle de Juárez", "San Gabriel", "Villa Corona", "Villa Guerrero", "Villa Hidalgo", "Yahualica de González Gallo", "Zacoalco de Torres", "Zapopan", "Zapotiltic", "Zapotitlán de Vadillo", "Zapotlán del Rey", "Zapotlanejo", "San Ignacio Cerro Gordo"]
    
    var opcionesVehiculo = ["Vehículos 4 cilindros pequeños o híbridos", "4 Cilindros", "6 Cilindros",
                            "SUV 4 cilindros", "SUV 6 cil y pickup chicas", "Pick up 6 cilindros", "Pick up o VAN 8 cilindros", "Bus de pasajeros"]
    
    var opcionesModelo = ["2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "Otro"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        btnAgregar.layer.cornerRadius = 5
        
        crearPickerModelo()
        crearPickerOrigen()
        crearPickerDestino()
        crearPickerVehiculo()
        
        txtViajes.delegate = self
        txtViajes.keyboardType = .NumberPad
        
        txtPasajeros.delegate = self
        txtPasajeros.keyboardType = .NumberPad
    }
    
    func crearPickerOrigen() {
        pickerOrigen.tag = 0
        pickerOrigen.delegate  = self
        pickerOrigen.backgroundColor = .lightGrayColor()
        txtOrigen.inputView = pickerOrigen
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneOrigen))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtOrigen.inputAccessoryView = toolbar

    }
    
    func done(textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func doneOrigen() {
        print("click")
        txtOrigen.resignFirstResponder()
    }
    
    func crearPickerDestino() {
        pickerDestino.tag = 1
        pickerDestino.delegate  = self
        pickerDestino.backgroundColor = .lightGrayColor()
        txtDestino.inputView = pickerDestino
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(ViajesEstadoCarbonoCompletaController.doneDestino))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtOrigen.inputAccessoryView = toolbar

    }
    
    func doneDestino() {
        txtDestino.resignFirstResponder()
    }
    
    func crearPickerVehiculo() {
        pickerVehiculo.tag = 2
        pickerVehiculo.delegate  = self
        pickerVehiculo.backgroundColor = .lightGrayColor()
        txtVehiculo.inputView = pickerVehiculo
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(ViajesEstadoCarbonoCompletaController.doneVehiculo))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtVehiculo.inputAccessoryView = toolbar
    }
    
    func doneVehiculo() {
        txtVehiculo.resignFirstResponder()
    }
    
    func crearPickerModelo() {
        pickerModelo.tag = 3
        pickerModelo.delegate  = self
        pickerModelo.backgroundColor = .lightGrayColor()
        txtModelo.inputView = pickerModelo
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(ViajesEstadoCarbonoCompletaController.doneModelo))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtModelo.inputAccessoryView = toolbar

    }
    
    func doneModelo() {
        txtModelo.resignFirstResponder()
    }
    
    @IBAction func agregarAction(sender: AnyObject) {
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return opcionesMunicipio.count
        } else if pickerView.tag == 1 {
            return opcionesMunicipio.count
        } else if pickerView.tag == 2 {
            return opcionesVehiculo.count
        } else if pickerView.tag == 3 {
            return opcionesModelo.count
        }
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return opcionesMunicipio[row]
        } else if pickerView.tag == 1 {
            return opcionesMunicipio[row]
        } else if pickerView.tag == 2 {
            return opcionesVehiculo[row]
        } else if pickerView.tag == 3 {
            return opcionesModelo[row]
        }
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            txtOrigen.text = opcionesMunicipio[row]
            //txtOrigen.resignFirstResponder()
        } else if pickerView.tag == 1 {
            txtDestino.text = opcionesMunicipio[row]
            //txtDestino.resignFirstResponder()
        } else if pickerView.tag == 2 {
            txtVehiculo.text = opcionesVehiculo[row]
            //txtVehiculo.resignFirstResponder()
        } else if pickerView.tag == 3 {
            txtModelo.text = opcionesModelo[row]
            //txtModelo.resignFirstResponder()
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        if pickerView.tag == 0 {
            pickerLabel.text = opcionesMunicipio[row]
        } else if pickerView.tag == 1 {
            pickerLabel.text = opcionesMunicipio[row]
        } else if pickerView.tag == 2 {
            pickerLabel.text = opcionesVehiculo[row]
        } else if pickerView.tag == 3 {
            pickerLabel.text = opcionesModelo[row]
        }
        
        return pickerLabel
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
}
