//
//  DatosHidricaLigera.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class DatosHidricaLigera {
    
    internal static var informacion = HLInformacion()
    internal static var regadera = HLRegadera()
    internal static var aseo = HLAseoPersonal()
    internal static var sanitario = HLSanitario()
    internal static var lavadoRopa = HLLavadoRopa()
    internal static var alimentacion = HLAlimentacion()
    
    private static var total: Double = 0
    
    internal static func totalGeneral() -> Double {
        
        total = DatosHidricaLigera.regadera.total()
        total += DatosHidricaLigera.aseo.total()
        total += DatosHidricaLigera.sanitario.total()
        total += DatosHidricaLigera.lavadoRopa.total()
        total += DatosHidricaLigera.alimentacion.total()
        
        return total
    }
    
}
