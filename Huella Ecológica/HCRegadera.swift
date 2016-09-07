//
//  HCRegadera.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HCRegadera {
    internal var opcionBaniarse: String = ""
    internal var vecesRegadera: Int = 0
    internal var tiempoBaniarse: Int = 0
    internal var tieneRegaderaAhorradora: Bool = true
    internal var cierraLlave: Bool = true
    internal var tiempoEnjabonarse: Int = 0
    internal var comoJuntaAguaFria: String = ""
    internal var tiempoSalirAgua: Int = 0
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        var auxUno = 0.0
        var auxDos = 0.0
        var auxTres = 0.0
        
        if tieneRegaderaAhorradora == false {
            auxUno = Double(vecesRegadera) * Double(tiempoBaniarse) * 10.0 * 1.0 * 52.0 * 0.001
        } else {
            auxUno = Double(vecesRegadera) * Double(tiempoBaniarse) * 10.0 * 0.38 * 52.0 * 0.001
        }
        
        if cierraLlave == false {
            auxDos = auxUno
        } else {
            auxDos = auxUno - Double(vecesRegadera) * Double(tiempoEnjabonarse) * 10 * obtenerFactor() * 52 * 0.001
        }
        
        if comoJuntaAguaFria == "Sí la junto y la utilizo en otras actividades" {
            auxTres = auxDos
        } else {
            auxTres = auxDos + (Double(vecesRegadera) * Double(tiempoSalirAgua) * 10.0 * obtenerFactor() * 52.0 * 0.001)
        }
        
        totalCalculo = auxTres
        
        return totalCalculo
    }
    
    private func obtenerFactor() -> Double {
        
        if tieneRegaderaAhorradora == true {
            return 1.0
        } else {
            return 0.38
        }
        
    }

}
