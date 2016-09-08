//
//  HCLimpiezaHogar.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HCLimpiezaHogar {
    internal var vecesTrapear: Int = 0
    internal var consumoAgua: Int = 0
    internal var formaLimpieza: String = ""
    internal var vecesLimpiar: Int = 0
    internal var tiempoAguaCorriendo: Int = 0
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        var auxUno = 0.0
        var auxDos = 0.0
        
        auxUno = Double(vecesTrapear) * Double(consumoAgua) * 52.0 * 0.001 / Double(DatosHidricaCompleta.informacion.numeroPersonas)
        
        if formaLimpieza == "Con agua de la manguera" {
            auxDos = Double(vecesLimpiar) * Double(tiempoAguaCorriendo) * 12.0 * 52.0 * 0.001 / Double(DatosHidricaCompleta.informacion.numeroPersonas)
        } else if formaLimpieza == "Barremos con escoba" {
            auxDos = 0.0
        } else if formaLimpieza == "Tenemos sistema a presión" {
            auxDos = Double(vecesLimpiar) * Double(tiempoAguaCorriendo) * 2.04 * 52.0 * 0.001 / Double(DatosHidricaCompleta.informacion.numeroPersonas)
        }
        
        totalCalculo = auxUno + auxDos
        
        return totalCalculo
    }
}
