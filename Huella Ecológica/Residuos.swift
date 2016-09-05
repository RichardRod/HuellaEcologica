//
//  Residuos.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/24/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class Residuos: UIViewController {
    
    
    @IBOutlet weak var txtResiduos: UITextField!
    
    @IBOutlet weak var generacionResiduos: UISegmentedControl!
    
    @IBAction func opcionGeneracionResiduos(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var separacion: UISegmentedControl!
    
    @IBAction func opcionSeparacion(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var composta: UISegmentedControl!
    
    @IBOutlet weak var opcionComposta: UISegmentedControl!
    
    @IBOutlet weak var opcionInorganicos: UISegmentedControl!
    
    @IBAction func inorganicosOpcion(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var valin: UISegmentedControl!
    
    @IBOutlet weak var opcionValin: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
