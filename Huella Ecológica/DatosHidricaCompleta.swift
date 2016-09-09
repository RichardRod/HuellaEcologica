//
//  DatosHidricaCompleta.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class DatosHidricaCompleta {
    
    internal static var informacion = HCInformacion()
    internal static var aguaLluvias = HCAguaLluvias()
    internal static var aguaEmbotellada = HCAguaEmbotellada()
    internal static var regadera = HCRegadera()
    internal static var jacuzzi = HCJacuzzi()
    internal static var baldes = HCBaldes()
    internal static var higuienePersonal = HCHiguienePersonal()
    internal static var sanitario = HCSanitario()
    internal static var lavadoRopa = HCLavadoRopa()
    internal static var limpiezaHogar = HCLimpiezaHogar()
    internal static var cocina = HCCocina()
    internal static var lavadoAuto = HCLavadoAuto()
    internal static var jardines = HCJardines()
    internal static var alberca = HCAlberca()
    internal static var alimentacion = HCAlimentacion()
    
    private static var total: Double = 0
    
    internal static func totalGeneral() -> Double {
        
        total = DatosHidricaCompleta.aguaLluvias.total()
        total += DatosHidricaCompleta.aguaEmbotellada.total()
        total += DatosHidricaCompleta.regadera.total()
        total += DatosHidricaCompleta.jacuzzi.total()
        total += DatosHidricaCompleta.baldes.total()
        total += DatosHidricaCompleta.higuienePersonal.total()
        total += DatosHidricaCompleta.sanitario.total()
        total += DatosHidricaCompleta.lavadoRopa.total()
        total += DatosHidricaCompleta.limpiezaHogar.total()
        total += DatosHidricaCompleta.cocina.total()
        total += DatosHidricaCompleta.lavadoAuto.total()
        total += DatosHidricaCompleta.jardines.total()
        total += DatosHidricaCompleta.alberca.total()
        total += DatosHidricaCompleta.alimentacion.total()
        
        return total
    }}
