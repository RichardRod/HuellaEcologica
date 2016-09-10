//
//  Mitigacion.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/24/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class Mitigacion: UIViewController {
    
    @IBOutlet weak var calentador: UISegmentedControl!
    
    @IBAction func opcionCalentador(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var panel: UISegmentedControl!
    
    @IBAction func opcionPanel(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var txtPaneles: UITextField!
    
    @IBOutlet weak var txtFocos: UITextField!
    
    @IBOutlet weak var focosEncandescentes: UISegmentedControl!
    
    @IBAction func opcionFocosEncandescentes(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var txtFocosIncandescentes: UITextField!
    
    @IBOutlet weak var focosAhorradores: UISegmentedControl!
    
    @IBAction func opcionFocosAhorradores(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var txtFocosAhorradores: UITextField!
    
    
    
    
    
    
    @IBAction func finalizarAction(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "CarbonoCompleta", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("Resumen")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
