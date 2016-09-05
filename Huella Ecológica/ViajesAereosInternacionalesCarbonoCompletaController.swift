//
//  ViajesAereosInternacionalesCarbonoCompletaController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/24/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class ViajesAereosInternacionalesCarbonoCompletaController: UIViewController {
    
    @IBOutlet weak var txtDestinoGdl: UITextField!
    @IBOutlet weak var txtViajesGdl: UITextField!
    @IBOutlet weak var txtDestinoCDMX: UITextField!
    @IBOutlet weak var txtViajesCDMX: UITextField!
    @IBOutlet weak var btnAgregar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnAgregar.layer.cornerRadius = 5
    }
}
