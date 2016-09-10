//
//  CLViajesNacionales.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/9/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class CLViajesNacionales {
    
    internal var destino: String = ""
    internal var veces: Int = 0
    internal var distancia: Int = 0
    
    private var totalGeneral = 0.0
    
    internal func agregarDistancia(destinoMagico: String) {
        if destinoMagico == "Acapulco (ACA)" {
            distancia = 560
        } else if destinoMagico == "Cancún (CUN)" {
            distancia = 1712
        } else if destinoMagico == "Chihuahua (CUU)" {
            distancia = 945
        } else if destinoMagico == "Ciudad de México (MEX)" {
            distancia = 460
        } else if destinoMagico == "Ciudad del Carmen (CME)" {
            distancia = 1225
        } else if destinoMagico == "Ciudad Juárez (CJS)" {
            distancia = 1270
        } else if destinoMagico == "Ciudad Obregón (CEN)" {
            distancia = 1009
        } else if destinoMagico == "Culiacán (CUL)" {
            distancia = 636
        } else if destinoMagico == "Durango (GDO)" {
            distancia = 418
        } else if destinoMagico == "Hermosillo (HMO)" {
            distancia = 1230
        } else if destinoMagico == "Huatulco (HUX)" {
            distancia = 912
        } else if destinoMagico == "Ixtapa - Zihuatanejo (ZIH)" {
            distancia = 377
        } else if destinoMagico == "La Paz (LAP)" {
            distancia = 826
        } else if destinoMagico == "Los Cabos (SJD)" {
            distancia = 724
        } else if destinoMagico == "Los Mochis (LMM)" {
            distancia = 822
        } else if destinoMagico == "Mazatlán (MZT)" {
            distancia = 423
        } else if destinoMagico == "Mérida (MID)" {
            distancia = 1423
        } else if destinoMagico == "Mexicali (MXL)" {
            distancia = 1790
        } else if destinoMagico == "Monterrey (MTY)" {
            distancia = 668
        } else if destinoMagico == "Oaxaca (OAX)" {
            distancia = 797
        } else if destinoMagico == "Puebla (PBC)" {
            distancia = 539
        } else if destinoMagico == "Puerto Vallarta (PVR)" {
            distancia = 203
        } else if destinoMagico == "Querétaro (QRO)" {
            distancia = 327
        } else if destinoMagico == "Reynosa (REX)" {
            distancia = 800
        } else if destinoMagico == "Tampico (TAM)" {
            distancia = 597
        } else if destinoMagico == "Tijuana (TIJ)" {
            distancia = 1901
        } else if destinoMagico == "Toluca (TLC)" {
            distancia = 414
        } else if destinoMagico == "Torreón/Gómez Palacio (TRC)" {
            distancia = 558
        } else if destinoMagico == "Tuxtla Gutiérrez (TGZ)" {
            distancia = 1170
        } else if destinoMagico == "Veracruz (VER)" {
            distancia = 761
        } else if destinoMagico == "Villahermosa (VSA)" {
            distancia = 1138
        }
    }
    
    func totalMagico() {
        totalGeneral += Double(distancia) * 0.07 * Double(veces) * 2
        
    }
    
    
    func total() -> Double {
        
        return totalGeneral
    }
    
    
}
