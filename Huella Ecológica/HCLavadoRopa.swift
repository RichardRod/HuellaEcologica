//
//  HCLavadoRopa.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HCLavadoRopa {
    internal var formaLavado: String = ""
    internal var vecesLavadora: Int = 0
    internal var kilosRopaLavanderia: Double = 0.0
    internal var personasRopa: Int = 1
    internal var kilosRopaAMano: Double = 0.0
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        var auxUno = 0.0
        var auxDos = 0.0
        
        let factor = obtenerFactorLavadora()
        
        if formaLavado == "Lavadora" || formaLavado == "La llevamos a una lavandería"{
            auxUno = Double(vecesLavadora) * factor * 52.0 * 0.001 / Double(personasRopa)
        } else if formaLavado == "Se lava a mano en fregadero, río, presa o lago" {
            auxDos = Double(vecesLavadora) * 31 * kilosRopaAMano * 52.0 * 0.001 / Double(personasRopa)
        }
        
        totalCalculo = auxUno + auxDos
        
        
        return totalCalculo
    }
    
    private func obtenerFactorLavadora() -> Double {
        
        if kilosRopaLavanderia == 4.5 {
            return 139.5
        } else if kilosRopaLavanderia == 5 {
            return 150.0
        } else if kilosRopaLavanderia == 6 {
            return 150.0
        } else if kilosRopaLavanderia == 7 {
            return 160.8
        } else if kilosRopaLavanderia == 8 {
            return 164.7
        } else if kilosRopaLavanderia == 9 {
            return 172
        } else if kilosRopaLavanderia == 10 {
            return 172
        } else if kilosRopaLavanderia == 11 {
            return 180
        } else {
            return 0
        }
        
    }
}
