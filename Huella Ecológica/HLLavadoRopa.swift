//
//  HLLavadoRopa.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HLLavadoRopa {
    internal var vecesLavado: Int = 0
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double{
        
        totalCalculo = (Double(vecesLavado) * 150.0 * 52.0 * 0.001)
        
        return totalCalculo
    }
}