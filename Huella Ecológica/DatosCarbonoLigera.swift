//
//  DatosCarbonoLigera.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class DatosCarbonoLigera {
    internal static var informacion = CLInformacion()
    internal static var combustible = CLComustible()
    internal static var electricidad = CLElectricidad()
    internal static var transporte = CLTransporte()
    internal static var viajes = CLViajes()
    internal static var ingreso = CLIngreso()
    
    private static var total: Double = 0
    
    internal static func totalGeneral() -> Double {
        
        total = DatosCarbonoLigera.combustible.total()
        total += DatosCarbonoLigera.electricidad.total()
        total += DatosCarbonoLigera.transporte.total()
        total += DatosCarbonoLigera.viajes.total()
        total += DatosCarbonoLigera.ingreso.total()
        
        return total
    }
}