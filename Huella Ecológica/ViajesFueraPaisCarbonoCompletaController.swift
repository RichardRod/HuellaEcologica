//
//  ViajesFueraPaisCarbonoCompletaController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/24/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class ViajesFueraPaisCarbonoCompletaController: UIViewController {
    
    @IBOutlet weak var txtDestino: UITextField!
    @IBOutlet weak var txtViajes: UITextField!
    @IBOutlet weak var txtPasajeros: UITextField!
    @IBOutlet weak var txtVehiculo: UITextField!
    @IBOutlet weak var txtModelo: UITextField!
    @IBOutlet weak var btnAgregar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnAgregar.layer.cornerRadius = 5
    }
}
