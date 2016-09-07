//
//  ResumenCarbonoLigera.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class ResumenCarbonoLigera: UIViewController {
    
    @IBOutlet weak var btnContinuar: UIButton!
    @IBOutlet weak var lblCombustible: UILabel!
    @IBOutlet weak var lblElectricidad: UILabel!
    @IBOutlet weak var lblTransporte: UILabel!
    @IBOutlet weak var lblViajes: UILabel!
    @IBOutlet weak var lblIngreso: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnContinuar.layer.cornerRadius = 5
        
        print(DatosCarbonoLigera.combustible.tipoCombustible)
    }
    @IBAction func continuarAction(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("InitialView")
        self.presentViewController(vc, animated: true, completion: nil)
    }
}
