//
//  HCBaldes.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HCBaldes {
    
    internal var veces: Int = 0
    internal var litros: Int = 0
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        totalCalculo = Double(veces) * Double(litros) * 52 * 0.001
        
        return totalCalculo
    }

}
