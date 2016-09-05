//
//  HLAseoPersonal.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class HLAseoPersonal {
    internal var vecesManos: Int = 0
    internal var vecesDientes: Int = 0
    internal var vecesRasurado: Int = 0
    
    private var totalCalculo: Double = 0
    
    internal func total() -> Double {
        
        totalCalculo = (Double(vecesManos) * 1.5 * 8.32 * 365.0 * 0.001)
        totalCalculo += (Double(vecesDientes) * 1.5 * 8.32 * 365.0 * 0.001)
        totalCalculo += (Double(vecesRasurado) * 3 * 8.32 * 365.0 * 0.001)
        
        return totalCalculo
    }

}
