//
//  InformacionCarbonoLigeraViewController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 7/30/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class InformacionCarbonoLigeraViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    let pickerMunicipio = UIPickerView()
    let pickerSexo = UIPickerView()
    
    @IBOutlet weak var txtMunicipio: UITextField!
    @IBOutlet weak var txtPersonas: UITextField!
    @IBOutlet weak var txtSexo: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    
    var opcionesMunicipio = ["", "Acatic", "Acatlán de Juárez", "Ahualulco de Mercado", "Amacueca", "Amatitán", "Ameca", "San Juanito de Escobedo", "Arandas", "El Arenal", "Atemajac de Brizuela", "Atengo", "Atenguillo", "Atotonilco el Alto", "Atoyac", "Autlán de Navarro", "Ayotlán", "Ayutla", "La Barca", "Bolaños", "Cabo Corrientes", "Cañadas de Obregón", "Casimiro Castillo", "Cihuatlán", "Zapotlán el Grande", "Cocula", "Colotlán", "Concepción de Buenos Aires", "Cuautitlán de García Barragán", "Cuautla", "Cuquío", "Chapala", "Chimaltitán", "Chiquilistlán", "De gollado", "Ejutla", "Encarnación de Díaz", "Etzatlán", "El Grullo", "El Limón", "Guachinango", "Guadalajara", "Hostotipaquillo", "Huejúcar", "Huejuquilla el Alto", "La Huerta", "Ixtlahuacán de los Membrillos", "Ixtlahuacán del Río", "Jalostotitlán", "Jamay", "Jesús María", "Jilotlán de los Dolores", "Jocotepec", "Juanacatlán", "Juchitlán", "Lagos de Moreno", "Magdalena", "Santa María del Oro", "La Manzanilla de la Paz", "Mascota", "Mazamitla", "Mexticacán", "Mezquitic", "Mixtlán", "Ocotlán", "Ojuelos de Jalisco", "Pihuamo", "Poncitlán", "Puerto Vallarta", "Villa Purificación", "Quitupan", "El Salto", "San Cristóbal de la Barranca", "San Diego de Alejandría", "San Juan de los Lagos", "San Julián", "San Marcos", "San Martín de Bolaños", "San Martín Hidalgo", "San Miguel el Alto", "Gómez Farías", "San Sebastián del Oeste", "Santa María de los Ángeles", "Sayula", "Tala", "Talpa de Allende", "Tamazula de Gordiano", "Tapalpa", "Tecalitlán", "Tecolotlán", "Techaluta de Montenegro", "Tenamaxtlán", "Teocaltiche", "Teocuitatlán de Corona", "Tepatitlán de Morelos", "Tepatitlán de Morelos", "Teuchitlán", "Tizapán el Alto", "Tlajomulco de Zúñiga", "Tlaquepaque", "Tolimán", "Tomatlán", "Tonalá", "Tonaya", "Tonila", "Totatiche", "Tototlán", "Tuxcacuesco", "Tuxcueca", "Tuxpan", "Unión de San Antonio", "Unión de Tula", "Valle de Guadalupe", "Valle de Juárez", "San Gabriel", "Villa Corona", "Villa Guerrero", "Villa Hidalgo", "Yahualica de González Gallo", "Zacoalco de Torres", "Zapopan", "Zapotiltic", "Zapotitlán de Vadillo", "Zapotlán del Rey", "Zapotlanejo", "San Ignacio Cerro Gordo"]
    
    var opcionesSexo = ["", "Hombre", "Mujer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        crearPickerMunicipio()
        crearPickerSexo()
        
        txtPersonas.delegate = self
        txtPersonas.keyboardType = .NumberPad
        txtPersonas.addTarget(self, action: #selector(self.obtenerTextoPersonas(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtEdad.delegate = self
        txtEdad.keyboardType = .NumberPad
        txtEdad.addTarget(self, action: #selector(self.obtenerTextoEdad(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func obtenerTextoPersonas(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            //DatosCarbonoLigera.informacion.numeroPersonas = Int(txtPersonas.text!)!
        } else {
            //DatosCarbonoLigera.informacion.numeroPersonas = 0
        }
    }
    
    func obtenerTextoEdad(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            //DatosCarbonoLigera.informacion.edad = Int(txtEdad.text!)!
        } else {
            //DatosCarbonoLigera.informacion.edad = 0
        }
    }
    
    private func crearPickerMunicipio() {
        pickerMunicipio.tag = 0
        pickerMunicipio.delegate  = self
        pickerMunicipio.backgroundColor = .lightGrayColor()
        txtMunicipio.inputView = pickerMunicipio
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(InformacionCarbonoLigeraViewController.doneMunicipio))
        toolbar.setItems([botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtMunicipio.inputAccessoryView = toolbar
    }
    
    private func crearPickerSexo() {
        pickerSexo.tag = 1
        pickerSexo.delegate  = self
        pickerSexo.backgroundColor = .lightGrayColor()
        txtSexo.inputView = pickerSexo
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(InformacionCarbonoLigeraViewController.doneSexo))
        toolbar.setItems([botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtSexo.inputAccessoryView = toolbar
    }
    
    internal func doneMunicipio() {
        txtMunicipio.resignFirstResponder()
        //DatosCarbonoLigera.informacion.municipio = txtMunicipio.text!
    }
    
    internal func doneSexo() {
        txtSexo.resignFirstResponder()
        //DatosCarbonoLigera.informacion.sexo = txtSexo.text!
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return opcionesMunicipio.count
        } else if pickerView.tag == 1 {
            return opcionesSexo.count
        }
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return opcionesMunicipio[row]
        } else if pickerView.tag == 1 {
            return opcionesSexo[row]
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            txtMunicipio.text = opcionesMunicipio[row]
        } else if pickerView.tag == 1 {
            txtSexo.text = opcionesSexo[row]
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
            pickerLabel.text = opcionesSexo[row]
        }
        
        return pickerLabel
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
}
