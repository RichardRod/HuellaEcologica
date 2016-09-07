//
//  Alberca.swift
//  Huella Ecologica
//
//  Created by Ricardo Rodriguez Haro on 6/29/16.
//
//

import UIKit

class Alberca: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var alberca: UISegmentedControl!
    @IBAction func opcionAlberca(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var txtLargo: UITextField!
    
    @IBOutlet weak var txtAncho: UITextField!

    @IBOutlet weak var txtProfundidad: UITextField!

    @IBOutlet weak var txtVeces: UITextField!
    
    @IBOutlet weak var cubierta: UISegmentedControl!
    
    @IBAction func opcionCubierta(sender: UISegmentedControl) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtLargo.delegate = self
        txtLargo.keyboardType = .NumberPad
        
        txtAncho.delegate = self
        txtAncho.keyboardType = .NumberPad
        
        txtProfundidad.delegate = self
        txtProfundidad.keyboardType = .NumberPad
        
        txtVeces.delegate = self
        txtVeces.keyboardType = .NumberPad
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }

}
