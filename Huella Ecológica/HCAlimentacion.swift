//
//  HCAlimentacion.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HCAlimentacion {
    
    internal var tortillas: Int = 0
    internal var pan: Int = 0
    internal var arroz: Int = 0
    internal var frijol: Int = 0
    internal var leche: Int = 0
    internal var huevo: Int = 0
    internal var carneRes: Int = 0
    internal var pollo: Int = 0
    internal var pescado: Int = 0
    internal var fruta: Int = 0
    internal var verdura: Int = 0
    internal var platoSopa: Int = 0
    internal var refresco: Int = 0
    internal var te: Int = 0
    internal var cafe: Int = 0
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double{
        
        totalCalculo = (Double(tortillas) * 15.0 * 7.0 * 52.0 * 0.001)
        totalCalculo += (Double(pan) * 60.0 * 7.0 * 52.0 * 0.001)
        totalCalculo += (Double(arroz) * 250.0 * 52.0 * 0.001)
        totalCalculo += (Double(frijol) * 250.0 * 52.0 * 0.001)
        totalCalculo += (Double(leche) * 1000.0 * 52.0 * 0.001)
        totalCalculo += (Double(huevo) * 220.0 * 52.0 * 0.001)
        totalCalculo += (Double(carneRes) * 15415.0 * 52.0 * 0.001)
        totalCalculo += (Double(pollo) * 4325.0 * 52.0 * 0.001)
        totalCalculo += (Double(fruta) * 850.0 * 52.0 * 0.001)
        totalCalculo += (Double(verdura) * 250.0 * 52.0 * 0.001)
        totalCalculo += (Double(platoSopa) * 65.0 * 52.0 * 0.001)
        totalCalculo += (Double(refresco) * 309.0 * 52.0 * 0.001)
        totalCalculo += (Double(te) * 27.0 * 52.0 * 0.001)
        totalCalculo += (Double(cafe) * 132.0 * 52.0 * 0.001)
        
        return totalCalculo
        
    }

}
