//
//  ResumenHidricaLigera.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/5/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class ResumenHidricaLigera: UIViewController {
    
    @IBOutlet weak var lblRegadera: UILabel!
    @IBOutlet weak var lblHigiene: UILabel!
    @IBOutlet weak var lblSanitario: UILabel!
    @IBOutlet weak var lblRopa: UILabel!
    @IBOutlet weak var lblAlimentacion: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    @IBOutlet weak var btnContinuar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        total()
        resultadoRegadera()
        resultadoAseo()
        resultadoAlimentacion()
        resultadoLavadoRopa()
        resultadoSanitario()
    }
    
    
    @IBAction func continuarAction(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("InitialView")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func resultadoRegadera() {
        lblRegadera.text = String(DatosHidricaLigera.regadera.total())
    }
    
    func resultadoAseo() {
        lblHigiene.text = String(DatosHidricaLigera.aseo.total())
    }
    
    func resultadoSanitario() {
        lblSanitario.text = String(DatosHidricaLigera.sanitario.total())
    }
    
    func resultadoLavadoRopa() {
        lblRopa.text = String(DatosHidricaLigera.lavadoRopa.total())
    }
    
    func resultadoAlimentacion() {
        lblAlimentacion.text = String(DatosHidricaLigera.alimentacion.total())
    }
    
    func total() {
        lblTotal.text = String(DatosHidricaLigera.totalGeneral())
        
        var leon: String = ""
        
        if DatosHidricaLigera.totalGeneral() > 1971 {
            //negativo
            leon = "Triste.png"
        } else if DatosHidricaLigera.totalGeneral() == 1971 {
            //neutral
            leon = "Neutral.png"
        } else if DatosHidricaLigera.totalGeneral() < 1971 {
            //positivo
            leon = "Feliz.png"
        }
        
        let imagen = UIImage(named: leon)
        //imagenLeon.image = imagen
    }

}
