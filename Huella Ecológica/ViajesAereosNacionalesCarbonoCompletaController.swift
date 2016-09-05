//
//  ViajesAereosNacionalesCarbonoCompletaController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/24/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class ViajesAereosNacionalesCarbonoCompletaController: UIViewController {
    
    @IBOutlet weak var txtDestino: UITextField!
    
    
    @IBOutlet weak var txtVeces: UITextField!
    
    @IBOutlet weak var btnAgregar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnAgregar.layer.cornerRadius = 5
    }
}
