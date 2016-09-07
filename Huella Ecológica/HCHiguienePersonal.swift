//
//  HCHiguienePersonal.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HCHiguienePersonal {
    internal var tieneLlaveAhorradora: Bool = true
    
    internal var aguaManos: Int = 0
    internal var aguaDientes: Int = 0
    internal var aguaRasurado: Int = 0
    
    internal var vecesManos: Int = 0
    internal var tiempoAguaManos: Int = 0
    internal var vecesDientes: Int = 0
    internal var tiempoAguaDientes: Int = 0
    internal var vecesRasurado: Int = 0
    internal var tiempoRasurado: Int = 0
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        _ = Double(aguaManos) * 365.0 * 0.001
        _ = Double(aguaDientes) * 365.0 * 0.001
        _ = Double(aguaRasurado) * 365.0 * 0.001
        
        if tieneLlaveAhorradora == true {
            let auxCuatro = Double(vecesManos) * Double(tiempoAguaManos) * 5.6 * 365 * 0.001
            let auxCinco = Double(vecesDientes) * Double(tiempoAguaDientes) * 5.6 * 365 * 0.001
            let auxseis = Double(vecesRasurado) * Double(tiempoRasurado) * 5.6 * 365 * 0.001
            
            totalCalculo = auxCuatro + auxCinco + auxseis
        } else {
            let auxCuatro = Double(vecesManos) * Double(tiempoAguaManos) * 8.32 * 365 * 0.001
            let auxCinco = Double(vecesDientes) * Double(tiempoAguaDientes) * 8.32 * 365 * 0.001
            let auxseis = Double(vecesRasurado) * Double(tiempoRasurado) * 8.32
                * 365 * 0.001
            
            totalCalculo = auxCuatro + auxCinco + auxseis
        }
        
        return totalCalculo
    }
    
}
