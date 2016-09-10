//
//  CCAgua.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/9/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class CCAgua {
    internal var fuenteAbastecimiento: String = ""
    internal var consumoAgua: Int = 0
    
    func total() -> Double {
        
        var tot = 0.0
        
        if fuenteAbastecimiento == "Red de agua potable del municipio o colonia (llega por tubería)" {
            tot = Double(consumoAgua) * 0.7082 * 0.499 * 12.0 / Double(DatosCarbonoCompleta.informacion.numeroPersonas)
        } else if fuenteAbastecimiento == "Compramos agua en pipas o contenedores" {
            tot = Double(consumoAgua) * 0.688 * 0.0741 * 12 * 10 / Double(DatosCarbonoCompleta.informacion.numeroPersonas)
        } else if fuenteAbastecimiento == "Nosotros obtenemos el agua directamente de un pozo cercano" {
            tot = Double(consumoAgua) * 0.7082 * 0.499 * 12 / Double(DatosCarbonoCompleta.informacion.numeroPersonas)
        } else if fuenteAbastecimiento == "Nosotros obtenemos el agua directamente de un río, presa o lago cercano" {
            tot = 0.0
        }
        
        return tot
        
        
    }
}