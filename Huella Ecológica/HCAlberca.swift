//
//  HCAlberca.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HCAlberca {
    
    internal var largo: Double = 0.0
    internal var ancho: Double = 0.0
    internal var profundidad: Double = 0.0
    internal var vecesCambio: Int = 0
    internal var isCubierta: Bool = true
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        if isCubierta {
            totalCalculo = largo * ancho * profundidad * Double(vecesCambio) / Double(DatosHidricaCompleta.informacion.numeroPersonas)
        } else {
            totalCalculo = largo * ancho * profundidad * Double(vecesCambio) / Double(DatosHidricaCompleta.informacion.numeroPersonas) + largo * ancho * 1.73 / Double(DatosHidricaCompleta.informacion.numeroPersonas)
        }
        
        return totalCalculo
    }
}
