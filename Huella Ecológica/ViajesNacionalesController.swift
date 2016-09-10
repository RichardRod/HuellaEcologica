//
//  ViajesNacionalesController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/9/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class ViajesNacionalesController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITableViewDataSource {
    
    var viajes = [String]()
    
    let pickerDestinos = UIPickerView()
    @IBOutlet weak var txtDestino: UITextField!
    @IBOutlet weak var txtVeces: UITextField!
    @IBOutlet weak var btnAgregar: UIButton!
    @IBOutlet weak var tablaViajes: UITableView!
    
    var destinos = ["", "Acapulco (ACA)", "Cancún (CUN)", "Chihuahua (CUU)", "Ciudad de México (MEX)", "Ciudad del Carmen (CME)", "Ciudad Juárez (CJS)", "Ciudad Obregón (CEN)", "Culiacán (CUL)", "Durango (GDO)", "Hermosillo (HMO)", "Huatulco (HUX)", "Ixtapa - Zihuatanejo (ZIH)", "La Paz (LAP)", "Los Cabos (SJD)", "Los Mochis (LMM)", "Mazatlán (MZT)", "Mérida (MID)", "Mexicali (MXL)", "Monterrey (MTY)", "Oaxaca (OAX)", "Puebla (PBC)", "Puerto Vallarta (PVR)", "Querétaro (QRO)", "Reynosa (REX)", "Tampico (TAM)", "Tijuana (TIJ)", "Toluca (TLC)", "Torreón/Gómez Palacio (TRC)", "Tuxtla Gutiérrez (TGZ)", "Veracruz (VER)", "Villahermosa (VSA)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAgregar.layer.cornerRadius = 5
        
        tablaViajes.dataSource = self
        
        self.hideKeyboardWhenTappedAround()
        crearPickerTransporte()
        
        txtVeces.delegate = self
        txtVeces.keyboardType = .NumberPad
        //txtVeces.addTarget(self, action: #selector(self.obtenerTextoViajes(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        
    }
    
    func obtenerTextoViajes(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosCarbonoLigera.viajesNacionales.veces = Int(textField.text!)!
        } else {
            DatosCarbonoLigera.viajesNacionales.veces = 0
        }
    }
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return destinos.count
        }
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return destinos[row]
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            txtDestino.text = destinos[row]
            //DatosCarbonoLigera.viajesNacionales.destino = destinos[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        if pickerView.tag == 0 {
            pickerLabel.text = destinos[row]
        }
        
        return pickerLabel
    }
    
    func crearPickerTransporte() {
        pickerDestinos.tag = 0
        pickerDestinos.delegate  = self
        pickerDestinos.backgroundColor = .lightGrayColor()
        txtDestino.inputView = pickerDestinos
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.Default
        toolbar.translucent = true
        toolbar.tintColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let botonListo = UIBarButtonItem(title: "Seleccionar", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.doneDestino))
        
        toolbar.setItems([flexibleSpace, botonListo], animated: true)
        
        toolbar.userInteractionEnabled = true
        
        txtDestino.inputAccessoryView = toolbar
        
    }
    
    func doneDestino() {
        txtDestino.resignFirstResponder()
        //DatosCarbonoLigera.viajesNacionales.destino = txtDestino.text!
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
        let cell = tableView.dequeueReusableCellWithIdentifier("viajeNCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = viajes[indexPath.row]
        return cell
    }

    
    @IBAction func agregarAction(sender: AnyObject) {
        if txtVeces.text == "" || txtDestino.text == "" {
            let alertController = UIAlertController(title: "Mensaje", message: "Ingresa destino y veces.", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default) { (result : UIAlertAction) -> Void in
                print("OK")
            }
      
            alertController.addAction(okAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            DatosCarbonoLigera.viajesNacionales.veces = Int(txtVeces.text!)!
            DatosCarbonoLigera.viajesNacionales.agregarDistancia(txtDestino.text!)
            DatosCarbonoLigera.viajesNacionales.totalMagico()
            
            viajes.append("\(txtDestino.text!): \(txtVeces.text!) veces.")
            tablaViajes.reloadData()
            
        }
        
    }
}
