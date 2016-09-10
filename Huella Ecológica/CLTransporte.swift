//
//  CLTransporte.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class CLTransporte {
    internal var formaTransporte: String = ""
    internal var tieneAuto: Bool = false
    internal var usaGasolina: Bool = false
    internal var usaDiesel: Bool = false
    internal var usaGas: Bool = false
    internal var usaHibrido: Bool = false
    internal var litrosGasolina: Double = 0.0
    internal var litrosDiesel: Double = 0.0
    internal var litrosGas: Double = 0.0
    internal var pesosGasolina: Double = 0.0
    internal var pesosDiesel: Double = 0.0
    internal var pesosGas: Double = 0.0
    
    private var totalGeneral = 0.0
    
    func total() -> Double {
        
        
        
        let auxGasolinaLitros = litrosGasolina * 0.68 * 49.5 * 0.0693 * 52.0
        let auxGasolinaPesos = (pesosGasolina / 13.57) * 49.5 * 0.0693 * 52.0 * 0.68
        
        let auxDieselLitros = litrosDiesel * 0.68 * 49.5 * 0.0741 * 52.0
        let auxDieselPesos = (pesosDiesel / 13.77) * 49.5 * 0.0741 * 52.0 * 0.68
        
        let auxGasLitros = litrosGas * 0.68 * 49.5 * 0.0631 * 52.0
        let auxGasPesos = (pesosDiesel / 14.65) * 49.5 * 0.0631 * 52.0 * 0.68
        
        totalGeneral = (auxGasolinaLitros + auxGasolinaPesos + auxDieselLitros + auxDieselPesos + auxGasLitros + auxGasPesos)
        
        print("llamado papu: \(auxGasolinaLitros)")
        
        return totalGeneral
    }
}