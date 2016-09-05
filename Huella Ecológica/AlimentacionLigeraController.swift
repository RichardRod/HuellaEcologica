//
//  AlimentacionLigeraController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class AlimentacionLigeraController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtTortillas: UITextField!
    @IBOutlet weak var txtPan: UITextField!
    @IBOutlet weak var txtArroz: UITextField!
    @IBOutlet weak var txtFrijoles: UITextField!
    @IBOutlet weak var txtLeche: UITextField!
    @IBOutlet weak var txtHuevo: UITextField!
    @IBOutlet weak var txtCarneRes: UITextField!
    @IBOutlet weak var txtCarnePollo: UITextField!
    @IBOutlet weak var txtPescado: UITextField!
    @IBOutlet weak var txtFruta: UITextField!
    @IBOutlet weak var txtVerdura: UITextField!
    @IBOutlet weak var txtSopa: UITextField!
    @IBOutlet weak var txtRefresco: UITextField!
    @IBOutlet weak var txtTe: UITextField!
    @IBOutlet weak var txtCafe: UITextField!
    @IBOutlet weak var btnFinalizar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        btnFinalizar.layer.cornerRadius = 5
        
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
        
        txtCarneRes.delegate = self
        txtCarneRes.keyboardType = .NumberPad
        txtCarneRes.addTarget(self, action: #selector(self.obtenerTextoCarneRes(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        txtCarnePollo.delegate = self
        txtCarnePollo.keyboardType = .NumberPad
        txtCarnePollo.addTarget(self, action: #selector(self.obtenerTextoPollo(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
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
    }
    
    func obtenerTextoTortillas(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.tortillas = Int(txtTortillas.text!)!
        } else {
            DatosHidricaLigera.alimentacion.tortillas = 0
        }
    }
    
    func obtenerTextoPan(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.pan = Int(txtPan.text!)!
        } else {
            DatosHidricaLigera.alimentacion.pan = 0
        }
    }
    
    func obtenerTextoArroz(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.arroz = Int(txtArroz.text!)!
        } else {
            DatosHidricaLigera.alimentacion.arroz = 0
        }
    }
    
    func obtenerTextoFrijol(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.frijol = Int(txtFrijoles.text!)!
        } else {
            DatosHidricaLigera.alimentacion.frijol = 0
        }
    }
    
    func obtenerTextoLeche(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.leche = Int(txtLeche.text!)!
        } else {
            DatosHidricaLigera.alimentacion.leche = 0
        }
    }
    
    func obtenerTextoHuevo(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.huevo = Int(txtHuevo.text!)!
        } else {
            DatosHidricaLigera.alimentacion.huevo = 0
        }
    }
    
    func obtenerTextoCarneRes(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.carneRes = Int(txtCarneRes.text!)!
        } else {
            DatosHidricaLigera.alimentacion.carneRes = 0
        }
    }
    
    func obtenerTextoPollo(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.pollo = Int(txtCarnePollo.text!)!
        } else {
            DatosHidricaLigera.alimentacion.pollo = 0
        }
    }
    
    func obtenerTextoPescado(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.pescado = Int(txtPescado.text!)!
        } else {
            DatosHidricaLigera.alimentacion.pescado = 0
        }
    }
    
    func obtenerTextoFruta(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.fruta = Int(txtFruta.text!)!
        } else {
            DatosHidricaLigera.alimentacion.fruta = 0
        }
    }
    
    func obtenerTextoVerdura(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.verdura = Int(txtVerdura.text!)!
        } else {
            DatosHidricaLigera.alimentacion.verdura = 0
        }
    }
    
    func obtenerTextoPlatoSopa(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.platoSopa = Int(txtSopa.text!)!
        } else {
            DatosHidricaLigera.alimentacion.platoSopa = 0
        }
    }
    
    func obtenerTextoRefresco(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.refresco = Int(txtRefresco.text!)!
        } else {
            DatosHidricaLigera.alimentacion.refresco = 0
        }
    }
    
    func obtenerTextoTe(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.te = Int(txtTe.text!)!
        } else {
            DatosHidricaLigera.alimentacion.te = 0
        }
    }
    
    func obtenerTextoCafe(textField: UITextField) {
        
        if textField.text?.characters.count > 0 {
            DatosHidricaLigera.alimentacion.cafe = Int(txtCafe.text!)!
        } else {
            DatosHidricaLigera.alimentacion.cafe = 0
        }
    }

    

    @IBAction func finishAction(sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "HidricaLigera", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("Resumen")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}
