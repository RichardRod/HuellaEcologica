//
//  HCAguaEmbotellada.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HCAguaEmbotellada {
    internal var obtencionAgua: String = ""
    internal var garrafones: Int = 0
    internal var consumoAgua: Int = 0
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        let auxUno = ((Double(garrafones) / Double(DatosHidricaCompleta.informacion.numeroPersonas)) * 20.0 * 0.001 * 52.0)
        
        let auxDos = (Double(consumoAgua) * 1.0 * 0.001 * 52.0)
        
        totalCalculo = auxUno + auxDos
        
        return totalCalculo
    }
}
