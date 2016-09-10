//
//  ViajesController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/21/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class ViajesController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITableViewDataSource {
    
    var viajes = [String]()
    var nuevoViaje: String = ""
    
    var destinosGuadalajara = ["", "Atlanta (Georgia)", "Chicago (Illinois)", "Dallas (Texas)", "Denver (Colorado)", "Fort Lauderdale (Florida)", "Fresno (California)", "Houston (Texas)", "Las Vegas (Nevada)", "Los Ángeles (California)", "Nueva York (Nueva York)", "Oakland (California)", "Ontario (California)", "Orlando (Florida)", "Phoenix (Arizona)", "Portland (Oregón)", "Reno (Nevada)", "Sacramento (California)", "Salt Lake City (Utah)", "San Antonio (Texas)", "San Diego (California)", "San Francisco (California)", "San José (California)", "Ciudad de Guatemala", "San José", "Ciudad de Panamá"]
    
    var destinosMexico = ["", "Montreal (Quebec)", "Toronto (Ontario)", "Vancouver (Columbia Británica)", "Atlanta (Georgia)", "Boston (Massachusetts)", "Charlotte (Carolina del Norte)", "Chicago (Illinois)", "Dallas (Texas)", "Denver (Colorado)", "Detroit (Míchigan)", "Fort Lauderdale (Florida)", "Houston (Texas)", "Las Vegas (Nevada)", "Los Ángeles (California)", "McAllen (Texas)", "Miami (Florida)", "Newark (Nueva Jersey)", "Nueva York (Nueva York)", "Oakland (California)", "Ontario (California)", "Orange County (California)", "Orlando (Florida)", "Phoenix (Arizona)", "Sacramento (California)", "Salt Lake City (Utah)", "San Antonio (Texas)", "San Diego (California)", "San Francisco (California)", "Washington D. C.", "San José (Costa Rica)", "La Habana", "Varadero", "San Salvador", "Ciudad de Guatemala", "San Pedro Sula", "Managua", "Panamá", "Santo Domingo", "Sudamérica", "Buenos Aires", "São Paulo", "Santiago de Chile", "Bogotá", "Medellín", "Quito", "Lima", "Caracas", "Shanghái", "Tokio", "Fráncfort", "Múnich", "Madrid", "París", "Roma", "Ámsterdam", "Londres", "Egipto", "Atlanta-Cairo", "Atlanta-Marruecos", "Atlanta-Nairobi", "Atlanta-Ghana", "Atlanta-Johannesburgo", "Guadalajara-LA", "LA-Hawaii", "LA-Melbourne", "LA-Bangkok", "Amsterdam-Nva Dehli", "Gdl- Nva Dehli", "LAXBangkok", "Tokio- Bangkok", "Francia -Moscow", "LAX-Melbourne", "LAX- Auckland(NZ)", "LAX-Hawaii"]
    
    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var txtDestinoGdl: UITextField!
    let pickerGuadalajara = UIPickerView()
    @IBOutlet weak var txtViajesGdl: UITextField!
    
    @IBOutlet weak var txtDestinoCDMX: UITextField!
    let pickerCDMX = UIPickerView()
    @IBOutlet weak var txtViajesCDMX: UITextField!
    
    @IBOutlet weak var btnAgregar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabla.dataSource = self
        
        self.hideKeyboardWhenTappedAround()
        
        btnAgregar.layer.cornerRadius = 5
        
        crearPickerGdl()
        crearPickerCDMX()
        
        txtViajesGdl.delegate = self
        txtViajesGdl.keyboardType = .NumberPad
        
        txtViajesCDMX.delegate = self
        txtViajesCDMX.keyboardType = .NumberPad
    }
    
    func crearPickerGdl() {
        pickerGuadalajara.tag = 0
        pickerGuadalajara.delegate  = self
        pickerGuadalajara.backgroundColor = .lightGrayColor()
        txtDestinoGdl.inputView = pickerGuadalajara
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(ViajesController.doneGdl))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtDestinoGdl.inputAccessoryView = toolbar
    }
    
    func doneGdl() {
        txtDestinoGdl.resignFirstResponder()
    }
    
    func crearPickerCDMX() {
        pickerCDMX.tag = 1
        pickerCDMX.delegate  = self
        pickerCDMX.backgroundColor = .lightGrayColor()
        txtDestinoCDMX.inputView = pickerCDMX
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(ViajesController.doneCDMX))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        toolbar.userInteractionEnabled = true
        
        txtDestinoCDMX.inputAccessoryView = toolbar
    }
    
    func doneCDMX() {
        txtDestinoCDMX.resignFirstResponder()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return destinosGuadalajara.count
        } else if pickerView.tag == 1 {
            return destinosMexico.count
        }
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return destinosGuadalajara[row]
        } else if pickerView.tag == 1 {
            return destinosMexico[row]
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            txtDestinoGdl.text = destinosGuadalajara[row]
        } else if pickerView.tag == 1 {
            txtDestinoCDMX.text = destinosMexico[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        if pickerView.tag == 0 {
            pickerLabel.text = destinosGuadalajara[row]
        } else if pickerView.tag == 1 {
            pickerLabel.text = destinosMexico[row]
        }
        
        return pickerLabel
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viajes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("viajeCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = viajes[indexPath.row]
        return cell
    }
    
    @IBAction func agregarAction(sender: AnyObject) {
        
        if txtViajesGdl.text == "" || txtDestinoGdl.text == "" || txtViajesCDMX.text == "" || txtDestinoCDMX.text == "" {
            
            let alertController = UIAlertController(title: "Mensaje", message: "Ingresa destino y veces.", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default) { (result : UIAlertAction) -> Void in
                print("OK")
            }
            
            alertController.addAction(okAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            DatosCarbonoLigera.viajes.vecesGDL = Int(txtViajesGdl.text!)!
            DatosCarbonoLigera.viajes.agregarDistanciaGDL(txtDestinoGdl.text!)
            DatosCarbonoLigera.viajes.totalMagicoGDL()
            
            DatosCarbonoLigera.viajes.vecesCDMX = Int(txtViajesCDMX.text!)!
            DatosCarbonoLigera.viajes.agregarDistanciaCDMX(txtDestinoCDMX.text!)
            DatosCarbonoLigera.viajes.totalMagicoCDMX()
            
            viajes.append("GDL: \(txtDestinoGdl.text!): \(txtViajesGdl.text!) - CDMX: \(txtDestinoCDMX.text!): \(txtViajesCDMX.text!)")
            tabla.reloadData()
        }
        
    }
}
