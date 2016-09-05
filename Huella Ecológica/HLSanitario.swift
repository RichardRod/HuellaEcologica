//
//  HLSanitario.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HLSanitario {
    internal var descargas: Int = 0
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        totalCalculo = (Double(descargas) * 6.05 * 365.0 * 0.001)
        
        return totalCalculo
    }
}
