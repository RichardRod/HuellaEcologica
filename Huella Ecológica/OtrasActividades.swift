//
//  OtrasActividades.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class OtrasActividades: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lavabos: UISegmentedControl!
    
    @IBAction func opcionLavabos(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var botesAgua: UISegmentedControl!
    
    @IBAction func opcionBotesAgua(sender: UISegmentedControl) {
    }
    
    
    @IBOutlet weak var txtManos: UITextField!
    @IBOutlet weak var txtDientes: UITextField!
    @IBOutlet weak var txtRasurado: UITextField!
    @IBOutlet weak var txtLavadoManos: UITextField!
    @IBOutlet weak var txtTiempoLavadoManos: UITextField!
    @IBOutlet weak var txtLavadoDientes: UITextField!
    @IBOutlet weak var txtTiempoLavadoDientes: UITextField!
    @IBOutlet weak var txtVecesRasurado: UITextField!
    @IBOutlet weak var txtDesmaquillas: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        txtManos.delegate = self
        txtManos.keyboardType = .NumberPad
        
        txtDientes.delegate = self
        txtDientes.keyboardType = .NumberPad
        
        txtRasurado.delegate = self
        txtRasurado.keyboardType = .NumberPad
        
        txtLavadoManos.delegate = self
        txtLavadoManos.keyboardType = .NumberPad
        
        txtTiempoLavadoManos.delegate = self
        txtTiempoLavadoManos.keyboardType = .NumberPad
        
        txtLavadoDientes.delegate = self
        txtLavadoDientes.keyboardType = .NumberPad
        
        txtTiempoLavadoDientes.delegate = self
        txtTiempoLavadoDientes.keyboardType = .NumberPad
        
        txtVecesRasurado.delegate = self
        txtVecesRasurado.keyboardType = .NumberPad
        
        txtDesmaquillas.delegate = self
        txtDesmaquillas.keyboardType = .NumberPad
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }

}
