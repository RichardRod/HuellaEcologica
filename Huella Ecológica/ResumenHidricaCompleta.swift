//
//  ResumenHidricaCompleta.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/7/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class ResumenHidricaCompleta: UIViewController {
    
    @IBOutlet weak var imageViewLeon: UIImageView!
    @IBOutlet weak var btnContinuar: UIButton!
    @IBOutlet weak var lblAguaLluvias: UILabel!
    @IBOutlet weak var lblAguaEmbotellada: UILabel!
    @IBOutlet weak var lblRegadera: UILabel!
    @IBOutlet weak var lblJacuzzi: UILabel!
    @IBOutlet weak var lblBaldes: UILabel!
    @IBOutlet weak var lblHiguienePersonal: UILabel!
    @IBOutlet weak var lblSanitario: UILabel!
    @IBOutlet weak var lblLavadoRopa: UILabel!
    @IBOutlet weak var lblLimpiezaHogar: UILabel!
    @IBOutlet weak var lblCocina: UILabel!
    @IBOutlet weak var lblLavadoAuto: UILabel!
    @IBOutlet weak var lblJardines: UILabel!
    @IBOutlet weak var lblAlberca: UILabel!
    @IBOutlet weak var lblAlimentacion: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblResultadoAnterior: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cargarResultados()
    }
    
    func cargarResultados() {
        
        //agua lluvias
        lblAguaLluvias.text = String(DatosHidricaCompleta.aguaLluvias.total())
        
        //agua embotellada
        lblAguaEmbotellada.text = String(DatosHidricaCompleta.aguaEmbotellada.total())
        
        //regadera
        lblRegadera.text = String(DatosHidricaCompleta.regadera.total())
        
        //jacuzzi
        lblJacuzzi.text = String(DatosHidricaCompleta.jacuzzi.total())
        
        //baldes
        lblBaldes.text = String(DatosHidricaCompleta.baldes.total())
        
        //higuiene
        lblHiguienePersonal.text = String(DatosHidricaCompleta.higuienePersonal.total())
        
        //sanitario
        lblSanitario.text = String(DatosHidricaCompleta.sanitario.total())
        
        //lavado ropa
        lblLavadoRopa.text = String(DatosHidricaCompleta.lavadoRopa.total())
        
        //limpieza hogar
        lblLimpiezaHogar.text = String(DatosHidricaCompleta.limpiezaHogar.total())
        
        //cocina
        lblCocina.text = String(DatosHidricaCompleta.cocina.total())
        
        //lavado auto
        lblLavadoAuto.text = String(DatosHidricaCompleta.lavadoAuto.total())
        
        //jardines
        lblJardines.text = String(DatosHidricaCompleta.jardines.total())
        
        //alberca
        lblAlberca.text = String(DatosHidricaCompleta.alberca.total())
        
        //alimentacion
        lblAlimentacion.text = String(DatosHidricaCompleta.alimentacion.total())
        
        //total
        lblTotal.text = String(DatosHidricaCompleta.totalGeneral())
        
        //establecer leon
        var leon: String = ""
        
        if DatosHidricaCompleta.totalGeneral() > (2021) {
            //negativo
            leon = "Triste.png"
        } else if DatosHidricaCompleta.totalGeneral() == 2021 {
            //neutral
            leon = "Neutral.png"
        } else if DatosHidricaCompleta.totalGeneral() < 2021 {
            //positivo
            leon = "Feliz.png"
        }
        
        let imagen = UIImage(named: leon)
        imageViewLeon.image = imagen
    }
    
    
    
    
    @IBAction func continuarAction(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("InitialView")
        self.presentViewController(vc, animated: true, completion: nil)
    }
}
