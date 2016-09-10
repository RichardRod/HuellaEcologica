//
//  CLViajes.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class CLViajes {
    
    internal var destinoGDL: String = ""
    internal var vecesGDL: Int = 0
    
    internal var destinoCDMX: String = ""
    internal var vecesCDMX: Int = 0
    
    internal var distancia: Int = 0
    internal var distanciaGDL: Int = 0
    
    private var totalGeneralGDL = 0.0
    private var totalGeneralCDMX = 0.0
    
    internal func agregarDistanciaGDL(destinoMagico: String) {
        
        if destinoMagico == "Atlanta (Georgia)" {
            distanciaGDL = 2364
        } else if destinoMagico == "Chicago (Illinois)" {
            distanciaGDL = 2784
        } else if destinoMagico == "Dallas (Texas)" {
            distanciaGDL = 1492
        } else if destinoMagico == "Denver (Colorado)" {
            distanciaGDL = 2148
        } else if destinoMagico == "Fort Lauderdale (Florida)" {
            distanciaGDL = 2445
        } else if destinoMagico == "Fresno (California)" {
            distanciaGDL = 2404
        } else if destinoMagico == "Houston (Texas)" {
            distanciaGDL = 1320
        } else if destinoMagico == "Las Vegas (Nevada)" {
            distanciaGDL = 2074
        } else if destinoMagico == "Los Ángeles (California)" {
            distanciaGDL = 2103
        } else if destinoMagico == "Nueva York (Nueva York)" {
            distanciaGDL = 3576
        } else if destinoMagico == "Oakland (California)" {
            distanciaGDL = 2639
        } else if destinoMagico == "Ontario (California)" {
            distanciaGDL = 2057
        } else if destinoMagico == "Orlando (Florida)" {
            distanciaGDL = 2391
        } else if destinoMagico == "Phoenix (Arizona)" {
            distanciaGDL = 1669
        } else if destinoMagico == "Portland (Oregón)" {
            distanciaGDL = 3293
        } else if destinoMagico == "Reno (Nevada)" {
            distanciaGDL = 2626
        } else if destinoMagico == "Sacramento (California)" {
            distanciaGDL = 2672
        } else if destinoMagico == "Salt Lake City (Utah)" {
            distanciaGDL = 2393
        } else if destinoMagico == "San Antonio (Texas)" {
            distanciaGDL = 1110
        } else if destinoMagico == "San Diego (California)" {
            distanciaGDL = 1930
        } else if destinoMagico == "San Francisco (California)" {
            distanciaGDL = 2643
        } else if destinoMagico == "San José (California)" {
            distanciaGDL = 2594
        } else if destinoMagico == "Ciudad de Guatemala" {
            distanciaGDL = 1506
        } else if destinoMagico == "San José" {
            distanciaGDL = 2356
        } else if destinoMagico == "Ciudad de Panamá" {
            distanciaGDL = 2865
        }
    }
    
    
    internal func agregarDistanciaCDMX(destinoMagico: String) {
        
        //canada
        if destinoMagico == "Montreal (Quebec)" {
            distancia = 3710
        } else if destinoMagico == "Toronto (Ontario)" {
            distancia = 3243
        } else if destinoMagico == "Vancouver (Columbia Británica)" {
            distancia = 3941
        }
        
        //estados unidos
        else if destinoMagico == "Atlanta (Georgia)" {
            distancia = 2140
        } else if destinoMagico == "Boston (Massachusetts)" {
            distancia = 3663
        } else if destinoMagico == "Charlotte (Carolina del Norte)" {
            distancia = 2496
        } else if destinoMagico == "Chicago (Illinois)" {
            distancia = 2712
        } else if destinoMagico == "Dallas (Texas)" {
            distancia = 1505
        } else if destinoMagico == "Denver (Colorado)" {
            distancia = 2327
        } else if destinoMagico == "Detroit (Míchigan)" {
            distancia = 2927
        } else if destinoMagico == "Fort Lauderdale (Florida)" {
            distancia = 2074
        } else if destinoMagico == "Houston (Texas)" {
            distancia = 1228
        } else if destinoMagico == "Las Vegas (Nevada)" {
            distancia = 2425
        } else if destinoMagico == "Los Ángeles (California)" {
            distancia = 2499
        } else if destinoMagico == "McAllen (Texas)" {
            distancia = 752
        } else if destinoMagico == "Miami (Florida)" {
            distancia = 2054
        } else if destinoMagico == "Newark (Nueva Jersey)" {
            distancia = 3341
        } else if destinoMagico == "Nueva York (Nueva York)" {
            distancia = 3364
        } else if destinoMagico == "Oakland (California)" {
            distancia = 3022
        } else if destinoMagico == "Ontario (California)" {
            distancia = 2446
        } else if destinoMagico == "Orange County (California)" {
            distancia = 2441
        } else if destinoMagico == "Orlando (Florida)" {
            distancia = 2062
        } else if destinoMagico == "Phoenix (Arizona)" {
            distancia = 2013
        } else if destinoMagico == "Sacramento (California)" {
            distancia = 3043
        } else if destinoMagico == "Salt Lake City (Utah)" {
            distancia = 2667
        } else if destinoMagico == "San Antonio (Texas)" {
            distancia = 1120
        } else if destinoMagico == "San Diego (California)" {
            distancia = 2329
        } else if destinoMagico == "San Francisco (California)" {
            distancia = 3027
        } else if destinoMagico == "Washington D. C." {
            distancia = 3000
        }
        
        //centroamerica y el caribe
        else if destinoMagico == "San José (Costa Rica)" {
            distancia = 1909
        } else if destinoMagico == "La Habana" {
            distancia = 1773
        } else if destinoMagico == "Varadero" {
            distancia = 1872
        } else if destinoMagico == "San Salvador" {
            distancia = 1259
        } else if destinoMagico == "Ciudad de Guatemala" {
            distancia = 1056
        } else if destinoMagico == "San Pedro Sula" {
            distancia = 1263
        } else if destinoMagico == "Managua" {
            distancia = 1600
        } else if destinoMagico == "Panamá" {
            distancia = 2411
        } else if destinoMagico == "Santo Domingo" {
            distancia = 3095
        } else if destinoMagico == "Buenos Aires" {
            distancia = 7377
        } else if destinoMagico == "São Paulo" {
            distancia = 7422
        } else if destinoMagico == "Santiago de Chile" {
            distancia = 6573
        } else if destinoMagico == "Bogotá" {
            distancia = 3158
        } else if destinoMagico == "Medellín" {
            distancia = 2952
        } else if destinoMagico == "Quito" {
            distancia = 3121
        } else if destinoMagico == "Lima" {
            distancia = 4231
        } else if destinoMagico == "Caracas" {
            distancia = 3579
        } else if destinoMagico == "Shanghái" {
            distancia = 12913
        } else if destinoMagico == "Tokio" {
            distancia = 11272
        } else if destinoMagico == "Fráncfort" {
            distancia = 9568
        } else if destinoMagico == "Múnich" {
            distancia = 9860
        } else if destinoMagico == "Madrid" {
            distancia = 9080
        } else if destinoMagico == "París" {
            distancia = 9213
        } else if destinoMagico == "Roma" {
            distancia = 10264
        } else if destinoMagico == "Ámsterdam" {
            distancia = 9220
        } else if destinoMagico == "Londres" {
            distancia = 8917
        } else if destinoMagico == "Atlanta-Cairo " {
            distancia = 10256
        } else if destinoMagico == "Atlanta-Marruecos " {
            distancia = 6997
        } else if destinoMagico == "Atlanta-Nairobi" {
            distancia = 12958
        } else if destinoMagico == "Atlanta-Ghana" {
            distancia = 9139
        } else if destinoMagico == "Atlanta-Johannesburgo" {
            distancia = 13572
        } else if destinoMagico == "Guadalajara-LA" {
            distancia = 2103
        } else if destinoMagico == "LA-Hawaii" {
            distancia = 4113
        } else if destinoMagico == "LA-Melbourne" {
            distancia = 12744
        } else if destinoMagico == "Amsterdam-Nva Dehli" {
            distancia = 6363
        } else if destinoMagico == "Gdl- Nva Dehli" {
            distancia = 14539
        } else if destinoMagico == "LAXBangkok" {
            distancia = 13292
        } else if destinoMagico == "Tokio- Bangkok" {
            distancia = 8773
        } else if destinoMagico == "Francia -Moscow" {
            distancia = 2466
        } else if destinoMagico == "LAX-Melbourne" {
            distancia = 12744
        } else if destinoMagico == "LAX- Auckland(NZ)" {
            distancia = 10467
        } else if destinoMagico == "LAX-Hawaii " {
            distancia = 4113
        }
        
    }
    
    func totalMagicoGDL() {
        totalGeneralGDL += Double(distanciaGDL) * 0.07 * Double(vecesGDL) * 2
    }
    
    func totalMagicoCDMX() {
        totalGeneralCDMX += Double(distancia) * 0.07 * Double(vecesCDMX) * 2
    }
    
    
    func total() -> Double {
        
        return totalGeneralGDL + totalGeneralCDMX
    }
    
    
}