//
//  HCLavadoAuto.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HCLavadoAuto {
    internal var tieneAutoPropio: Bool = true
    internal var vecesLavaCarro: Int = 0
    internal var formaLavadoAuto: String = ""
    internal var tipoManguera: String = ""
    internal var tiempoLavadoManguera: Int = 0
    internal var numeroCubetas: Int = 0
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        var auxUno = 0.0
        var auxDos = 0.0
        
        if formaLavadoAuto == "Manguera" {
            if tipoManguera == "Manguera a presión y sistema de ahorro" {
                auxUno = Double(vecesLavaCarro) * 2.04 * Double(tiempoLavadoManguera) * 12 * 0.001
            } else {
                auxUno = Double(vecesLavaCarro) * 12 * Double(tiempoLavadoManguera) * 12 * 0.001
            }
        }
        
        auxDos = Double(vecesLavaCarro) * Double(numeroCubetas) * 12 * 0.001 * 10
        
        totalCalculo = auxUno + auxDos
    
        return totalCalculo
    }
}
