//
//  CLIngreso.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class CLIngreso {
    
    internal var ingreso: Double = 0.0
    
    func total() -> Double {
        
        if ingreso <= 4000 {
            return 0.42
        } else if ingreso > 4000 && ingreso <= 7000 {
            return 0.58
        } else if ingreso > 7000 && ingreso <= 8500 {
            return 0.78
        } else if ingreso > 8500 && ingreso <= 10500 {
            return 0.95
        } else if ingreso > 10500 && ingreso <= 12500 {
            return 1.15
        } else if ingreso > 12500 && ingreso <= 15000 {
            return 1.45
        } else if ingreso > 15000 && ingreso <= 18500 {
            return 1.82
        } else if ingreso > 18500 && ingreso <= 25000 {
            return 2.36
        } else if ingreso > 25000 && ingreso <= 45000 {
            return 3.58
        } else if ingreso > 45000{
            return 8.76
        } else {
            return 0
        }
        
    }
}