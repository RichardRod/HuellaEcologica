//
//  CarbonoCompletaController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/16/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class CarbonoCompletaController: UIViewController, ADPageControlDelegate {
    
    var pageControl: ADPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupPageControll()
        
    }
    
    private func setupPageControll() {
        
        //create tabs
        let pageModelInformacion: ADPageModel = ADPageModel()
        let pageInformacion: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Informacion")
        pageModelInformacion.strPageTitle = "Informacion"
        pageModelInformacion.iPageNumber = 0
        pageModelInformacion.viewController = pageInformacion
        
        let pageModelEmisiones: ADPageModel = ADPageModel()
        pageModelEmisiones.strPageTitle = "Emisiones"
        pageModelEmisiones.iPageNumber = 1
        pageModelEmisiones.bShouldLazyLoad = true

        let pageModelElectricidad: ADPageModel = ADPageModel()
        pageModelElectricidad.strPageTitle = "Electricidad"
        pageModelElectricidad.iPageNumber = 2
        pageModelElectricidad.bShouldLazyLoad = true
        
        let pageModelAgua: ADPageModel = ADPageModel()
        pageModelAgua.strPageTitle = "Agua"
        pageModelAgua.iPageNumber = 3
        pageModelAgua.bShouldLazyLoad = true
        
        let pageModelViajesEstado: ADPageModel = ADPageModel()
        pageModelViajesEstado.strPageTitle = "Viajes en el Estado"
        pageModelViajesEstado.iPageNumber = 4
        pageModelViajesEstado.bShouldLazyLoad = true

        let pageModelViajesPais: ADPageModel = ADPageModel()
        pageModelViajesPais.strPageTitle = "Viajes en el Pais"
        pageModelViajesPais.iPageNumber = 5
        pageModelViajesPais.bShouldLazyLoad = true

        let pageModelTransporte: ADPageModel = ADPageModel()
        pageModelTransporte.strPageTitle = "Transporte"
        pageModelTransporte.iPageNumber = 6
        pageModelTransporte.bShouldLazyLoad = true
        
        let pageModelViajesFueraPais: ADPageModel = ADPageModel()
        pageModelViajesFueraPais.strPageTitle = "Viajes fuera del Pais"
        pageModelViajesFueraPais.iPageNumber = 7
        pageModelViajesFueraPais.bShouldLazyLoad = true
        
        let pageModelViajesAereosNacionales: ADPageModel = ADPageModel()
        pageModelViajesAereosNacionales.strPageTitle = "Viajes aereos nacionales"
        pageModelViajesAereosNacionales.iPageNumber = 8
        pageModelViajesAereosNacionales.bShouldLazyLoad = true

        let pageModelViajesAereosInternacionales: ADPageModel = ADPageModel()
        pageModelViajesAereosInternacionales.strPageTitle = "Viajes aereos internacionales"
        pageModelViajesAereosInternacionales.iPageNumber = 9
        pageModelViajesAereosInternacionales.bShouldLazyLoad = true

        let pageModelAlimentacion: ADPageModel = ADPageModel()
        pageModelAlimentacion.strPageTitle = "Alimentacion"
        pageModelAlimentacion.iPageNumber = 10
        pageModelAlimentacion.bShouldLazyLoad = true

        let pageModelIngreso: ADPageModel = ADPageModel()
        pageModelIngreso.strPageTitle = "Ingreso"
        pageModelIngreso.iPageNumber = 11
        pageModelIngreso.bShouldLazyLoad = true
        
        let pageModelAguaResidual: ADPageModel = ADPageModel()
        pageModelAguaResidual.strPageTitle = "Agua Residual"
        pageModelAguaResidual.iPageNumber = 12
        pageModelAguaResidual.bShouldLazyLoad = true
        
        let pageModelCarbono: ADPageModel = ADPageModel()
        pageModelCarbono.strPageTitle = "Carbono"
        pageModelCarbono.iPageNumber = 13
        pageModelCarbono.bShouldLazyLoad = true
        
        let pageModelResiduos: ADPageModel = ADPageModel()
        pageModelResiduos.strPageTitle = "Residuos"
        pageModelResiduos.iPageNumber = 14
        pageModelResiduos.bShouldLazyLoad = true

        let pageModelMitigacion: ADPageModel = ADPageModel()
        pageModelMitigacion.strPageTitle = "Mitigacion"
        pageModelMitigacion.iPageNumber = 15
        pageModelMitigacion.bShouldLazyLoad = true

        //initialize page control
        pageControl = ADPageControl()
        pageControl.delegateADPageControl = self
        self.pageControl.arrPageModel = [pageModelInformacion, pageModelEmisiones, pageModelElectricidad, pageModelAgua, pageModelViajesEstado, pageModelViajesPais, pageModelTransporte, pageModelViajesFueraPais, pageModelViajesAereosNacionales, pageModelViajesAereosInternacionales, pageModelAlimentacion, pageModelIngreso, pageModelAguaResidual, pageModelCarbono, pageModelResiduos, pageModelMitigacion]
        
        //customize parameters
        pageControl.iFirstVisiblePageNumber = 0
        pageControl.iTitleViewHeight = 50
        pageControl.iPageIndicatorHeight = 4
        pageControl.fontTitleTabText = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pageControl.colorTabText = UIColor.whiteColor()
        pageControl.colorTitleBarBackground = UIColor(red: 144/255, green: 142/255, blue: 127/255, alpha: 1.0)
        pageControl.colorPageIndicator = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        pageControl.colorPageOverscrollBackground = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        
        pageControl.bEnablePagesEndBounceEffect = true
        pageControl.bEnableTitlesEndBounceEffect = true
        pageControl.bShowMoreTabAvailableIndicator = true
        pageControl.bHideShadow = true

        
        //add as Subview
        self.view.addSubview(pageControl.view)
        pageControl.view.translatesAutoresizingMaskIntoConstraints = false
        let subView: UIView = pageControl.view!
        
        let views = ["subview" : subView]
        
        //Leading margin 0, Trailing margin 0
        self.view!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[subview]-0-|", options: [], metrics: nil, views: views))
        
        //Top margin 20 for status bar, Bottom margin 0
        self.view!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-64-[subview]-0-|", options: [], metrics: nil, views: views))
    }
    
    func adPageControlGetViewControllerForPageModel(pageModel: ADPageModel) -> UIViewController? {
        
        if pageModel.iPageNumber == 1 {
            
            let page1: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Emisiones")
            
            return page1
            
        } else if pageModel.iPageNumber == 2 {
            
            let page2: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Electricidad")
            
            return page2
            
        } else if pageModel.iPageNumber == 3 {
            
            let page3: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Agua")
            
            return page3
            
        } else if pageModel.iPageNumber == 4 {
            
            let page4: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("ViajesEstado")
            
            return page4
            
        } else if pageModel.iPageNumber == 5 {
            
            let page5: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("ViajesPais")
            
            return page5
            
        } else if pageModel.iPageNumber == 6{
            
            let page6: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Transporte")
            
            return page6
            
        } else if pageModel.iPageNumber == 7 {
            
            let page7: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("ViajesFuera")
            
            return page7
            
        } else if pageModel.iPageNumber == 8 {
            
            let page8: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("ViajesAereos")
            
            return page8
            
        } else if pageModel.iPageNumber == 9 {
            
            let page9: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("ViajesInternacionales")
            
            return page9
            
        } else if pageModel.iPageNumber == 10 {
            
            let page10: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Alimentacion")
            
            return page10
            
        } else if pageModel.iPageNumber == 11 {
            
            let page11: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Ingresos")
            
            return page11
            
        } else if pageModel.iPageNumber == 12 {
            
            let page12: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("AguaResidual")
            
            return page12
            
        } else if pageModel.iPageNumber == 13 {
            
            let page13: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Carbono")
            
            return page13
            
        } else if pageModel.iPageNumber == 14 {
            
            let page14: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Residuos")
            
            return page14
            
        } else if pageModel.iPageNumber == 15 {
            
            let page15: UIViewController = UIStoryboard(name: "CarbonoCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Mitigacion")
            
            return page15
            
        }
        
        return nil
    }
}
