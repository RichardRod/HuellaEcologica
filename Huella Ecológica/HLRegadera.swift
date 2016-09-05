//
//  HLRegadera.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HLRegadera {
    internal var vecesBanio: Int = 0
    internal var tiempoBanio: Int = 0
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        totalCalculo = (Double(vecesBanio) * Double(tiempoBanio) * 10.0 * 1.0 * 52.0 * 0.001)
        
        
        return totalCalculo
    }

}
