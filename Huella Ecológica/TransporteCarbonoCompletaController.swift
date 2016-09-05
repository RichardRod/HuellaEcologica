//
//  TransporteCarbonoCompletaController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/24/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class TransporteCarbonoCompletaController: UIViewController {
    
    @IBOutlet weak var txtNumeroVehiculos: UITextField!
    
    @IBOutlet weak var txtFormaTransporte: UITextField!
    
    @IBOutlet weak var txtGasolinaLitros: UITextField!
    
    @IBOutlet weak var txtDieselLitros: UITextField!
    
    
    @IBOutlet weak var txtGasLitros: UITextField!
    
    @IBOutlet weak var txtGasolinaPesos: UITextField!
    
    @IBOutlet weak var txtDieselPesos: UITextField!
    
    @IBOutlet weak var txtGasPesos: UITextField!
    
    @IBOutlet weak var autoElectrico: UISegmentedControl!
    
    @IBAction func opcionAutoElectrico(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var fuenteAbastecimiento: UISegmentedControl!
    
    @IBAction func opcionFuenteAbastecimiento(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var txtKilometrosRecorridos: UITextField!
    
    @IBOutlet weak var vehiculoPropio: UISegmentedControl!
    
    @IBAction func opcionVehiculoPropio(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var gasolina: UISegmentedControl!
    
    @IBAction func opcionGas(sender: UISegmentedControl) {
    }
    @IBOutlet weak var diesel: UISegmentedControl!
    
    @IBOutlet weak var gas: UISegmentedControl!
    
    @IBAction func opcionG(sender: UISegmentedControl) {
    }
    @IBAction func opcionDiesel(sender: UISegmentedControl) {
    }
    @IBOutlet weak var hibrido: UISegmentedControl!
    
    @IBAction func opcionHibrido(sender: UISegmentedControl) {
    }
    
    
    @IBOutlet weak var opcionTransportePublico: UISegmentedControl!
    
    @IBAction func transportePublcioOpcion(sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var txtTrenLigero: UITextField!
    
    @IBOutlet weak var txtTaxi: UITextField!
    
    @IBOutlet weak var txtCamion: UITextField!
    
    @IBOutlet weak var txtOtro: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
