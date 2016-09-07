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
    @IBOutlet weak var botonTerminado: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtTortillas.delegate = self
        txtTortillas.keyboardType = .NumberPad
        
        txtPan.delegate = self
        txtPan.keyboardType = .NumberPad
        
        txtTortillas.delegate = self
        txtTortillas.keyboardType = .NumberPad
        
        txtArroz.delegate = self
        txtArroz.keyboardType = .NumberPad
        
        txtLeche.delegate = self
        txtLeche.keyboardType = .NumberPad
        
        txtHuevo.delegate = self
        txtHuevo.keyboardType = .NumberPad
        
        txtRes.delegate = self
        txtRes.keyboardType = .NumberPad
        
        txtPollo.delegate = self
        txtPollo.keyboardType = .NumberPad
        
        txtPescado.delegate = self
        txtPescado.keyboardType = .NumberPad
        
        txtFruta.delegate = self
        txtFruta.keyboardType = .NumberPad
        
        txtVerdura.delegate = self
        txtVerdura.keyboardType = .NumberPad
        
        txtSopa.delegate = self
        txtSopa.keyboardType = .NumberPad
        
        txtRefresco.delegate = self
        txtRefresco.keyboardType = .NumberPad
        
        txtTe.delegate = self
        txtTe.keyboardType = .NumberPad
        
        txtCafe.delegate = self
        txtCafe.keyboardType = .NumberPad
  
        
        botonTerminado.layer.cornerRadius = 5
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
