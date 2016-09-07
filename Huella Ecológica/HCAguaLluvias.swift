//
//  HCAguaLluvias.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HCAguaLluvias {
    internal var colectaAgua: Bool = true
    internal var inicioTemporal: String = ""
    internal var finTemporal: String = ""
    internal var aguaRecolectada: Double = 0.0
    
    private var semanasLluvia: Int = 0
    private func calcularSemanasLluvia() {
       
        if inicioTemporal == "Segunda mitad de Mayo" && finTemporal == "Primera mitad de Septiembre" {
            semanasLluvia = 16
        } else if inicioTemporal == "Segunda mitad de Mayo" && finTemporal == "Segunda mitad de Septiembre" {
            semanasLluvia = 18
        } else if inicioTemporal == "Segunda mitad de Mayo" && finTemporal == "Primera mitad de Octubre" {
            semanasLluvia = 20
        } else if inicioTemporal == "Segunda mitad de Mayo" && finTemporal == "Segunda mitad de Octubre" {
            semanasLluvia = 22
        } else if inicioTemporal == "Segunda mitad de Mayo" && finTemporal == "Primera mitad de Noviembre" {
            semanasLluvia = 24
        }
        //Primer bloque
        
        if inicioTemporal == "Primera mitad de Junio" && finTemporal == "Primera mitad de Septiembre" {
            semanasLluvia = 14
        } else if inicioTemporal == "Primera mitad de Junio" && finTemporal == "Segunda mitad de Septiembre" {
            semanasLluvia = 16
        } else if inicioTemporal == "Primera mitad de Junio" && finTemporal == "Primera mitad de Octubre" {
            semanasLluvia = 18
        } else if inicioTemporal == "Primera mitad de Junio" && finTemporal == "Segunda mitad de Octubre" {
            semanasLluvia = 20
        } else if inicioTemporal == "Primera mitad de Junio" && finTemporal == "Primera mitad de Noviembre" {
            semanasLluvia = 22
        }
        
        //segundo bloque
        if inicioTemporal == "Segunda mitad de Junio" && finTemporal == "Primera mitad de Septiembre" {
            semanasLluvia = 12
        } else if inicioTemporal == "Segunda mitad de Junio" && finTemporal == "Segunda mitad de Septiembre" {
            semanasLluvia = 14
        } else if inicioTemporal == "Segunda mitad de Junio" && finTemporal == "Primera mitad de Octubre" {
            semanasLluvia = 16
        } else if inicioTemporal == "Segunda mitad de Junio" && finTemporal == "Segunda mitad de Octubre" {
            semanasLluvia = 18
        } else if inicioTemporal == "Segunda mitad de Junio" && finTemporal == "Primera mitad de Noviembre" {
            semanasLluvia = 20
        }
        
        //tercer bloque
        if inicioTemporal == "Primera mitad de Julio" && finTemporal == "Primera mitad de Septiembre" {
            semanasLluvia = 10
        } else if inicioTemporal == "Primera mitad de Julio" && finTemporal == "Segunda mitad de Septiembre" {
            semanasLluvia = 12
        } else if inicioTemporal == "Primera mitad de Julio" && finTemporal == "Primera mitad de Octubre" {
            semanasLluvia = 14
        } else if inicioTemporal == "Primera mitad de Julio" && finTemporal == "Segunda mitad de Octubre" {
            semanasLluvia = 16
        } else if inicioTemporal == "Primera mitad de Julio" && finTemporal == "Primera mitad de Noviembre" {
            semanasLluvia = 18
        }
        
        //cuarto bloque
        if inicioTemporal == "Segunda mitad de Julio" && finTemporal == "Primera mitad de Septiembre" {
            semanasLluvia = 8
        } else if inicioTemporal == "Segunda mitad de Julio" && finTemporal == "Segunda mitad de Septiembre" {
            semanasLluvia = 10
        } else if inicioTemporal == "Segunda mitad de Julio" && finTemporal == "Primera mitad de Octubre" {
            semanasLluvia = 12
        } else if inicioTemporal == "Segunda mitad de Julio" && finTemporal == "Segunda mitad de Octubre" {
            semanasLluvia = 14
        } else if inicioTemporal == "Segunda mitad de Julio" && finTemporal == "Primera mitad de Noviembre" {
            semanasLluvia = 16
        }
    }
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        //establecer semanas de lluvia
        calcularSemanasLluvia()
        
        totalCalculo = Double(semanasLluvia) * Double(aguaRecolectada) * 0.001 / Double(DatosHidricaCompleta.informacion.numeroPersonas)
        
        return totalCalculo
    }
}
