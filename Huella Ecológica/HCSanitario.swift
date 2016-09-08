//
//  HCSanitario.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HCSanitario {
    internal var tipoSanitario: String = ""
    internal var tieneSistemaDual: Bool = true
    internal var tieneTanqueAhorrador: Bool = true
    internal var vecesDescargar: Int = 0
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        var auxUno = 0.0
        var auxDos = 0.0
        var auxTres = 0.0
        
        if tipoSanitario == "Sanitario convencional. Se utiliza agua para la descarga" {
            auxUno = 0.0
        }
        
        if tieneSistemaDual == true {
            auxDos = Double(vecesDescargar) * 3.025 * 0.001 * 365
        } else {
            auxDos = 0.0
        }
        
        if tieneTanqueAhorrador == false {
            auxTres = Double(vecesDescargar) * 6.05 * 365 * 0.001
        } else {
            auxTres = Double(vecesDescargar) * 4.8 * 365 * 0.001
        }
        
        totalCalculo = auxUno + auxDos + auxTres
        
        
        return totalCalculo
    }
    
}
