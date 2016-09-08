//
//  HCCocina.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HCCocina {
    internal var formaLavado: String = ""
    internal var vecesLavavajillas: Int = 0
    internal var vecesMano: Int = 0
    internal var tieneSistemaAhorrador: Bool = true
    internal var tiempoAguaCorriendo: Int = 0
    internal var consumoAgua: Int = 0
    internal var vecesLavarPlatosSucios: Int = 0
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        var auxUno = 0.0
        var auxDos = 0.0
        var auxTres = 0.0
        
        if formaLavado == "En máquina lavavajillas" {
            auxUno = Double(vecesLavavajillas) * 76.0 * 0.001 * 52.0
        } else {
            auxUno = 0.0
        }
        
        if tieneSistemaAhorrador == true {
            auxDos = Double(vecesMano) * Double(tiempoAguaCorriendo) * 5.6 * 0.001 * 365
        } else {
            auxDos = Double(vecesMano) * Double(tiempoAguaCorriendo) * 8.32 * 0.001 * 365
        }
        
        
        auxTres = Double(consumoAgua) * Double(vecesLavarPlatosSucios) * 0.001 * 365.0
        
        totalCalculo = (auxUno + auxDos + auxTres) / Double(DatosHidricaCompleta.informacion.numeroPersonas)
        return totalCalculo
    }
}
