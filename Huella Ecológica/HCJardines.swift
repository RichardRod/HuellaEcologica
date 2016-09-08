//
//  HCJardines.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HCJardines {
    internal var tieneJardin: Bool = true
    internal var metrosJardin: Int = 0
    internal var formaRegado: String = ""
    internal var vecesRegado: Int = 0
    internal var tiempoCorreAgua: Int = 0
    internal var puntosGoteo: Int = 0
    internal var tiempoSistemaGoteo: Int = 0
    internal var numeroCubetas: Int = 0
    internal var habitos: String = ""
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        if formaRegado == "Sistema de riego por goteo" {
            totalCalculo = Double(vecesRegado) * Double(puntosGoteo) * Double(tiempoSistemaGoteo) / 60.0 / 1000.0 * 52 / Double(DatosHidricaCompleta.informacion.numeroPersonas)
        } else if formaRegado == "Sistema de riego por aspersión" {
            totalCalculo = Double(vecesRegado) * Double(tiempoCorreAgua) * 5.0 * 0.001 * 52.0 / Double(DatosHidricaCompleta.informacion.numeroPersonas)
        } else if formaRegado == "Manguera" {
            totalCalculo = Double(vecesRegado) * Double(tiempoCorreAgua) * 12.0 * 0.001 * 52.0 / Double(DatosHidricaCompleta.informacion.numeroPersonas)
        } else if formaRegado == "Cubetas" {
            totalCalculo = Double(vecesRegado) * Double(tiempoCorreAgua) * 10.0 * 0.001 * 52.0 / Double(DatosHidricaCompleta.informacion.numeroPersonas)
        }
        
        return totalCalculo
    }
}
