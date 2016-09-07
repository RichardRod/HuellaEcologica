//
//  InformacionHidricaCompletaController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/6/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class InformacionHidricaCompletaController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var opcionesMunicipio = ["", "Acatic", "Acatlán de Juárez", "Ahualulco de Mercado", "Amacueca", "Amatitán", "Ameca", "San Juanito de Escobedo", "Arandas", "El Arenal", "Atemajac de Brizuela", "Atengo", "Atenguillo", "Atotonilco el Alto", "Atoyac", "Autlán de Navarro", "Ayotlán", "Ayutla", "La Barca", "Bolaños", "Cabo Corrientes", "Cañadas de Obregón", "Casimiro Castillo", "Cihuatlán", "Zapotlán el Grande", "Cocula", "Colotlán", "Concepción de Buenos Aires", "Cuautitlán de García Barragán", "Cuautla", "Cuquío", "Chapala", "Chimaltitán", "Chiquilistlán", "De gollado", "Ejutla", "Encarnación de Díaz", "Etzatlán", "El Grullo", "El Limón", "Guachinango", "Guadalajara", "Hostotipaquillo", "Huejúcar", "Huejuquilla el Alto", "La Huerta", "Ixtlahuacán de los Membrillos", "Ixtlahuacán del Río", "Jalostotitlán", "Jamay", "Jesús María", "Jilotlán de los Dolores", "Jocotepec", "Juanacatlán", "Juchitlán", "Lagos de Moreno", "Magdalena", "Santa María del Oro", "La Manzanilla de la Paz", "Mascota", "Mazamitla", "Mexticacán", "Mezquitic", "Mixtlán", "Ocotlán", "Ojuelos de Jalisco", "Pihuamo", "Poncitlán", "Puerto Vallarta", "Villa Purificación", "Quitupan", "El Salto", "San Cristóbal de la Barranca", "San Diego de Alejandría", "San Juan de los Lagos", "San Julián", "San Marcos", "San Martín de Bolaños", "San Martín Hidalgo", "San Miguel el Alto", "Gómez Farías", "San Sebastián del Oeste", "Santa María de los Ángeles", "Sayula", "Tala", "Talpa de Allende", "Tamazula de Gordiano", "Tapalpa", "Tecalitlán", "Tecolotlán", "Techaluta de Montenegro", "Tenamaxtlán", "Teocaltiche", "Teocuitatlán de Corona", "Tepatitlán de Morelos", "Tepatitlán de Morelos", "Teuchitlán", "Tizapán el Alto", "Tlajomulco de Zúñiga", "Tlaquepaque", "Tolimán", "Tomatlán", "Tonalá", "Tonaya", "Tonila", "Totatiche", "Tototlán", "Tuxcacuesco", "Tuxcueca", "Tuxpan", "Unión de San Antonio", "Unión de Tula", "Valle de Guadalupe", "Valle de Juárez", "San Gabriel", "Villa Corona", "Villa Guerrero", "Villa Hidalgo", "Yahualica de González Gallo", "Zacoalco de Torres", "Zapopan", "Zapotiltic", "Zapotitlán de Vadillo", "Zapotlán del Rey", "Zapotlanejo", "San Ignacio Cerro Gordo"]
    
    var opcionesSexo = ["", "Hombre", "Mujer"]
    
    var opcionesAbastecimiento = ["", "Red de agua potable del municipio o colonia (llega por tubería)", "Compramos agua en pipas o contenedores", "Nosotros obtenemos el agua directamente de un pozo cercano", "Nosotros obtenemos el agua directamente de un río, presa o lago cercano"]
    
    var opcionesProscedencia = ["", "No sé", "Sí, de un pozo", "Sí, de un lago, río o presa, por favor indica cuál"]
    
    var opcionesAguaComprada = ["", "Sí, de un pozo", "Sí, de un río, presa o lago cercano, por favor indica cuál", "No lo sé"]
    
    var opcionesTranslado = ["", "Tenemos bomba y tubería propias", "Por cubetas a pie o caballo/burro", "En vehículo y depósitos propios"]
    
    @IBOutlet weak var txtMunicipio: UITextField!
    let pickerMunicipio = UIPickerView()
    
    @IBOutlet weak var txtPersonas: UITextField!
    @IBOutlet weak var txtSexo: UITextField!
    let pickerSexo = UIPickerView()
    
    @IBOutlet weak var txtEdad: UITextField!
    @IBOutlet weak var txtAbastecimiento: UITextField!
    let pickerAbastecimiento = UIPickerView()
    
    @IBOutlet weak var txtProscedenciaAgua: UITextField!
    let pickerProscedenciaAgua = UIPickerView()
    
    @IBOutlet weak var txtAguaComprada: UITextField!
    let pickerAguaComprada = UIPickerView()
    
    @IBOutlet weak var txtTranslado: UITextField!
    let pickerTranslado = UIPickerView()
    
    @IBOutlet weak var segmentMedidorAgua: UISegmentedControl!
    @IBAction func opcionMedidorAgua(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var segmentConsumo: UISegmentedControl!
    @IBAction func opcionConsumo(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var txtConsumoAgua: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        crearPickerMunicipio()
        
        txtPersonas.delegate = self
        txtPersonas.keyboardType = .NumberPad
        txtPersonas.addTarget(self, action: #selector(self.obtenerTextoPersonas(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        crearPickerSexo()
        
        txtEdad.delegate = self
        txtEdad.keyboardType = .NumberPad
        txtEdad.addTarget(self, action: #selector(self.obtenerTextoEdad(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        crearPickerAbastecimiento()
        crearPickerProscedenciaAgua()
        crearPickerAguaComprada()
        crearPickerTranslado()
        
        txtConsumoAgua.delegate = self
        txtConsumoAgua.keyboardType = .NumberPad
        txtConsumoAgua.addTarget(self, action: #selector(self.obtenerTextoAgua(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func obtenerTextoPersonas(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.informacion.numeroPersonas = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.informacion.numeroPersonas = 1
        }
    }
    
    func obtenerTextoEdad(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.informacion.edad = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.informacion.edad = 0
        }
    }
    
    func obtenerTextoAgua(textField: UITextField) {
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.informacion.consumoAgua = Double(textField.text!)!
        } else {
            DatosHidricaCompleta.informacion.consumoAgua = 0
        }
    }
    
    func crearPickerMunicipio() {
        pickerMunicipio.tag = 0
        pickerMunicipio.delegate  = self
        pickerMunicipio.backgroundColor = .lightGrayColor()
        txtMunicipio.inputView = pickerMunicipio
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneMunicipio))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtMunicipio.inputAccessoryView = toolbar
    }
    
    func doneMunicipio() {
        txtMunicipio.resignFirstResponder()
        DatosHidricaCompleta.informacion.municipio = txtMunicipio.text!
    }
    
    func crearPickerSexo() {
        
        pickerSexo.tag = 1
        pickerSexo.delegate  = self
        pickerSexo.backgroundColor = .lightGrayColor()
        txtSexo.inputView = pickerSexo
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneSexo))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtSexo.inputAccessoryView = toolbar
    }
    
    func doneSexo() {
        txtSexo.resignFirstResponder()
        DatosHidricaCompleta.informacion.sexo = txtSexo.text!
    }
    
    func crearPickerAbastecimiento() {
        pickerAbastecimiento.tag = 2
        pickerAbastecimiento.delegate  = self
        pickerAbastecimiento.backgroundColor = .lightGrayColor()
        txtAbastecimiento.inputView = pickerAbastecimiento
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneAbastecimiento))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtAbastecimiento.inputAccessoryView = toolbar

    }
    
    func doneAbastecimiento() {
        txtAbastecimiento.resignFirstResponder()
        DatosHidricaCompleta.informacion.abastecimiento = txtAbastecimiento.text!
    }
    
    func crearPickerProscedenciaAgua() {
        pickerProscedenciaAgua.tag = 3
        pickerProscedenciaAgua.delegate  = self
        pickerProscedenciaAgua.backgroundColor = .lightGrayColor()
        txtProscedenciaAgua.inputView = pickerProscedenciaAgua
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneProscedenciaAgua))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtProscedenciaAgua.inputAccessoryView = toolbar

    }
    
    func doneProscedenciaAgua() {
        txtProscedenciaAgua.resignFirstResponder()
        DatosHidricaCompleta.informacion.procedenciaAgua = txtProscedenciaAgua.text!
    }
    
    func crearPickerAguaComprada() {
        pickerAguaComprada.tag = 4
        pickerAguaComprada.delegate  = self
        pickerAguaComprada.backgroundColor = .lightGrayColor()
        txtAguaComprada.inputView = pickerAguaComprada
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneAguaComprada))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtAguaComprada.inputAccessoryView = toolbar

    }
    
    func doneAguaComprada() {
        txtAguaComprada.resignFirstResponder()
        DatosHidricaCompleta.informacion.aguaComprada = txtAguaComprada.text!
    }
    
    func crearPickerTranslado() {
        pickerTranslado.tag = 5
        pickerTranslado.delegate  = self
        pickerTranslado.backgroundColor = .lightGrayColor()
        txtTranslado.inputView = pickerTranslado
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneTranslado))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtTranslado.inputAccessoryView = toolbar
    }
    
    func doneTranslado() {
        txtTranslado.resignFirstResponder()
        DatosHidricaCompleta.informacion.aguaTranslado = txtTranslado.text!
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return opcionesMunicipio.count
        } else if pickerView.tag == 1 {
            return opcionesSexo.count
        } else if pickerView.tag == 2 {
            return opcionesAbastecimiento.count
        } else if pickerView.tag == 3 {
            return opcionesProscedencia.count
        } else if pickerView.tag == 4 {
            return opcionesAguaComprada.count
        } else if pickerView.tag == 5 {
            return opcionesTranslado.count
        }
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return opcionesMunicipio[row]
        } else if pickerView.tag == 1 {
            return opcionesSexo[row]
        } else if pickerView.tag == 2 {
            return opcionesAbastecimiento[row]
        } else if pickerView.tag == 3 {
            return opcionesProscedencia[row]
        } else if pickerView.tag == 4 {
            return opcionesAguaComprada[row]
        } else if pickerView.tag == 5 {
            return opcionesTranslado[row]
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            txtMunicipio.text = opcionesMunicipio[row]
            //DatosCarbono.Informacion_Municipio = txtMunicipio.text!
        } else if pickerView.tag == 1 {
            txtSexo.text = opcionesSexo[row]
            //DatosCarbono.Informacion_Sexo = txtSexo.text!
        } else if pickerView.tag == 2 {
            txtAbastecimiento.text = opcionesAbastecimiento[row]
        } else if pickerView.tag == 3 {
            txtProscedenciaAgua.text = opcionesProscedencia[row]
        } else if pickerView.tag == 4 {
            txtAguaComprada.text = opcionesAguaComprada[row]
        } else if pickerView.tag == 5 {
            txtTranslado.text = opcionesTranslado[row]
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
        } else if pickerView.tag == 2 {
            pickerLabel.text =  opcionesAbastecimiento[row]
        } else if pickerView.tag == 3 {
            pickerLabel.text = opcionesProscedencia[row]
        } else if pickerView.tag == 4 {
            pickerLabel.text = opcionesAguaComprada[row]
        } else if pickerView.tag == 5 {
            pickerLabel.text = opcionesTranslado[row]
        }
        
        return pickerLabel
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
    
}
