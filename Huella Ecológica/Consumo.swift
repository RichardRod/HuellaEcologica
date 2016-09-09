//
//  Consumo.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class Consumo: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtTortillas: UITextField!
    @IBOutlet weak var txtPan: UITextField!
    @IBOutlet weak var txtArroz: UITextField!
    @IBOutlet weak var txtLeche: UITextField!
    @IBOutlet weak var txtHuevo: UITextField!
    @IBOutlet weak var txtRes: UITextField!
    @IBOutlet weak var txtPollo: UITextField!
    @IBOutlet weak var txtPescado: UITextField!
    @IBOutlet weak var txtFruta: UITextField!
    @IBOutlet weak var txtVerdura: UITextField!
    @IBOutlet weak var txtSopa: UITextField!
    @IBOutlet weak var txtRefresco: UITextField!
    @IBOutlet weak var txtTe: UITextField!
    @IBOutlet weak var txtCafe: UITextField!
    @IBOutlet weak var txtFrijoles: UITextField!
    @IBOutlet weak var botonTerminado: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        txtTortillas.delegate = self
        txtTortillas.keyboardType = .NumberPad
        txtTortillas.addTarget(self, action: #selector(self.obtenerTextoTortillas(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtPan.delegate = self
        txtPan.keyboardType = .NumberPad
        txtPan.addTarget(self, action: #selector(self.obtenerTextoPan(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtArroz.delegate = self
        txtArroz.keyboardType = .NumberPad
        txtArroz.addTarget(self, action: #selector(self.obtenerTextoArroz(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtFrijoles.delegate = self
        txtFrijoles.keyboardType = .NumberPad
        txtFrijoles.addTarget(self, action: #selector(self.obtenerTextoFrijol(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtLeche.delegate = self
        txtLeche.keyboardType = .NumberPad
        txtLeche.addTarget(self, action: #selector(self.obtenerTextoLeche(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtHuevo.delegate = self
        txtHuevo.keyboardType = .NumberPad
        txtHuevo.addTarget(self, action: #selector(self.obtenerTextoHuevo(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtRes.delegate = self
        txtRes.keyboardType = .NumberPad
        txtRes.addTarget(self, action: #selector(self.obtenerTextoCarneRes(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtPollo.delegate = self
        txtPollo.keyboardType = .NumberPad
        txtPollo.addTarget(self, action: #selector(self.obtenerTextoPollo(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtPescado.delegate = self
        txtPescado.keyboardType = .NumberPad
        txtPescado.addTarget(self, action: #selector(self.obtenerTextoPescado(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtFruta.delegate = self
        txtFruta.keyboardType = .NumberPad
        txtFruta.addTarget(self, action: #selector(self.obtenerTextoFruta(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtVerdura.delegate = self
        txtVerdura.keyboardType = .NumberPad
        txtVerdura.addTarget(self, action: #selector(self.obtenerTextoVerdura(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtSopa.delegate = self
        txtSopa.keyboardType = .NumberPad
        txtSopa.addTarget(self, action: #selector(self.obtenerTextoPlatoSopa(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtRefresco.delegate = self
        txtRefresco.keyboardType = .NumberPad
        txtRefresco.addTarget(self, action: #selector(self.obtenerTextoRefresco(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtTe.delegate = self
        txtTe.keyboardType = .NumberPad
        txtTe.addTarget(self, action: #selector(self.obtenerTextoTe(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtCafe.delegate = self
        txtCafe.keyboardType = .NumberPad
        txtCafe.addTarget(self, action: #selector(self.obtenerTextoCafe(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        botonTerminado.layer.cornerRadius = 5
    }
    
    func obtenerTextoTortillas(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.tortillas = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.tortillas = 0
        }
    }
    
    func obtenerTextoPan(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.pan = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.pan = 0
        }
    }
    
    func obtenerTextoArroz(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.arroz = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.arroz = 0
        }
    }
    
    func obtenerTextoFrijol(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.frijol = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.frijol = 0
        }
    }
    
    func obtenerTextoLeche(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.leche = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.leche = 0
        }
    }
    
    func obtenerTextoHuevo(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.huevo = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.huevo = 0
        }
    }
    
    func obtenerTextoCarneRes(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.carneRes = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.carneRes = 0
        }
    }
    
    func obtenerTextoPollo(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.pollo = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.pollo = 0
        }
    }
    
    func obtenerTextoPescado(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.pescado = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.pescado = 0
        }
    }
    
    func obtenerTextoFruta(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.fruta = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.fruta = 0
        }
    }
    
    func obtenerTextoVerdura(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.verdura = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.verdura = 0
        }
    }
    
    func obtenerTextoPlatoSopa(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.platoSopa = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.platoSopa = 0
        }
    }
    
    func obtenerTextoRefresco(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.refresco = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.refresco = 0
        }
    }
    
    func obtenerTextoTe(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.te = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.te = 0
        }
    }
    
    func obtenerTextoCafe(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaCompleta.alimentacion.cafe = Int(textField.text!)!
        } else {
            DatosHidricaCompleta.alimentacion.cafe = 0
        }
    }
    
    @IBAction func terminarEntrevista(sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "HidricaCompleta", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("Resumen")
        self.presentViewController(vc, animated: true, completion: nil)
        
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
}
