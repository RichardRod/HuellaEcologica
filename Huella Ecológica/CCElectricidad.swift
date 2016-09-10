//
//  CCElectricidad.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/9/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class CCElectricidad {
    
    internal var consumo: Double = 0.0
    internal var pago: Double = 0.0
    
    private var totalGeneral = 0.0
    
    func total() -> Double {
        
        let auxUno = consumo * 0.499 * 12.0 / Double(DatosCarbonoLigera.informacion.numeroPersonas)
        let auxDos = (pago / 1.44) * 0.499 * 12 / Double(DatosCarbonoLigera.informacion.numeroPersonas)
        
        totalGeneral = auxUno + auxDos
        
        return totalGeneral
    }
}