//
//  CLTransporte.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class CLTransporte {
    internal var formaTransporte: String = ""
    internal var tieneAuto: Bool = false
    internal var usaGasolina: Bool = false
    internal var usaDiesel: Bool = false
    internal var usaGas: Bool = false
    internal var usaHibrido: Bool = false
    internal var litrosGasolina: Double = 0.0
    internal var litrosDiesel: Double = 0.0
    internal var litrosGas: Double = 0.0
    internal var pesosGasolina: Double = 0.0
    internal var pesosDiesel: Double = 0.0
    internal var pesosGas: Double = 0.0
    
    
    func total() -> Double {
        
        return 0.0
    }
}