//
//  CLComustible.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class CLComustible {
    
    internal var tipoCombustible: String = ""
    internal var tipoConsumo: String = ""
    internal var consumo: Double = 0.0
    
    private var totalGeneral = 0.0
    
    func totalCombustible() -> Double {
        
        print("Me llamaron")
        
        if tipoCombustible == "Gas LP (Tanque estacionario o cilindros)" {
            
            if tipoConsumo == "Consumo en pesos" {
                totalGeneral = (consumo / 14.65) * 47.3 * 0.0631 * 12 / Double(DatosCarbonoLigera.informacion.numeroPersonas)
            } else if tipoConsumo == "Consumo en Kilogramos" {
                totalGeneral = consumo * 47.3 * 0.0631 * 12.0 / Double(DatosCarbonoLigera.informacion.numeroPersonas)
            } else if tipoConsumo == "Consumo en litros" {
                totalGeneral = consumo * 0.56 * 47.3 * 0.0631 * 12.0 / Double(DatosCarbonoLigera.informacion.numeroPersonas)
            }
            
        } else if tipoCombustible == "Gas Natural (Conexión a red de gas natural)" {
            
            if tipoConsumo == "Consumo en pesos" {
                totalGeneral = (consumo / 14.65) * 44.2 * 0.0561 * 12 / Double(DatosCarbonoLigera.informacion.numeroPersonas)
            } else if tipoConsumo == "Consumo en Kilogramos" {
                totalGeneral = consumo * 44.2 * 0.0561 * 12.0 / Double(DatosCarbonoLigera.informacion.numeroPersonas)
            } else if tipoConsumo == "Consumo en litros" {
                totalGeneral = consumo * 0.56 * 44.2 * 0.0561 * 12.0 / Double(DatosCarbonoLigera.informacion.numeroPersonas)
            }


        } else if tipoCombustible == "Leña" {
            totalGeneral = consumo * 15.0 * 0.112 * 12 / Double(DatosCarbonoLigera.informacion.numeroPersonas)
        } else if tipoCombustible == "Carbón vegetal" {
            totalGeneral = consumo * 15.0 * 0.112 * 12 / Double(DatosCarbonoLigera.informacion.numeroPersonas)
        }
        
        print("Combustible: \(totalGeneral)")
    
        return totalGeneral
    }
}