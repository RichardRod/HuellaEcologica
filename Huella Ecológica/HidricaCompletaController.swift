//
//  HidricaCompletaController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/18/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class HidricaCompletaController: UIViewController, ADPageControlDelegate {
    
    var pageControl: ADPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupPageControll()
        
    }
    
    private func setupPageControll() {
        
        //create tabs
        let pageModelInformacion: ADPageModel = ADPageModel()
        let pageInformacion: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Informacion")
        pageModelInformacion.strPageTitle = "Información General"
        pageModelInformacion.iPageNumber = 0
        pageModelInformacion.viewController = pageInformacion
        
        let pageModelAguaLluvias: ADPageModel = ADPageModel()
        pageModelAguaLluvias.strPageTitle = "Agua de lluvias"
        pageModelAguaLluvias.iPageNumber = 1
        pageModelAguaLluvias.bShouldLazyLoad = true
        
        let pageModelAguaEmbotellada: ADPageModel = ADPageModel()
        pageModelAguaEmbotellada.strPageTitle = "Agua Embotellada"
        pageModelAguaEmbotellada.iPageNumber = 2
        pageModelAguaEmbotellada.bShouldLazyLoad = true
        
        let pageModelRegadera: ADPageModel = ADPageModel()
        pageModelRegadera.strPageTitle = "Regadera"
        pageModelRegadera.iPageNumber = 3
        pageModelRegadera.bShouldLazyLoad = true

        let pageModelJacuzzi: ADPageModel = ADPageModel()
        pageModelJacuzzi.strPageTitle = "Jacuzzi"
        pageModelJacuzzi.iPageNumber = 4
        pageModelJacuzzi.bShouldLazyLoad = true
        
        let pageModelBaldes: ADPageModel = ADPageModel()
        pageModelBaldes.strPageTitle = "Baldes"
        pageModelBaldes.iPageNumber = 5
        pageModelBaldes.bShouldLazyLoad = true
        
        let pageModelHiguiene: ADPageModel = ADPageModel()
        pageModelHiguiene.strPageTitle = "Higuiene personal"
        pageModelHiguiene.iPageNumber = 6
        pageModelHiguiene.bShouldLazyLoad = true
        
        let pageModelSanitario: ADPageModel = ADPageModel()
        pageModelSanitario.strPageTitle = "Sanitario"
        pageModelSanitario.iPageNumber = 7
        pageModelSanitario.bShouldLazyLoad = true
        
        let pageModelLavadoRopa: ADPageModel = ADPageModel()
        pageModelLavadoRopa.strPageTitle = "Lavado de ropa"
        pageModelLavadoRopa.iPageNumber = 8
        pageModelLavadoRopa.bShouldLazyLoad = true
        
        let pageModelLiempiezaHogar: ADPageModel = ADPageModel()
        pageModelLiempiezaHogar.strPageTitle = "Limpieza del hogar"
        pageModelLiempiezaHogar.iPageNumber = 9
        pageModelLiempiezaHogar.bShouldLazyLoad = true
        
        let pageModelCocina: ADPageModel = ADPageModel()
        pageModelCocina.strPageTitle = "Cocina"
        pageModelCocina.iPageNumber = 10
        pageModelCocina.bShouldLazyLoad = true

        let pageModelLavadoAuto: ADPageModel = ADPageModel()
        pageModelLavadoAuto.strPageTitle = "Lavado de auto"
        pageModelLavadoAuto.iPageNumber = 11
        pageModelLavadoAuto.bShouldLazyLoad = true
        
        let pageModelJardines: ADPageModel = ADPageModel()
        pageModelJardines.strPageTitle = "Jardines"
        pageModelJardines.iPageNumber = 12
        pageModelJardines.bShouldLazyLoad = true
        
        let pageModelAlberca: ADPageModel = ADPageModel()
        pageModelAlberca.strPageTitle = "Alberca"
        pageModelAlberca.iPageNumber = 13
        pageModelAlberca.bShouldLazyLoad = true

        let pageModelAlimentacion: ADPageModel = ADPageModel()
        pageModelAlimentacion.strPageTitle = "Alimentación"
        pageModelAlimentacion.iPageNumber = 14
        pageModelAlimentacion.bShouldLazyLoad = true
        
        //initialize page control
        pageControl = ADPageControl()
        pageControl.delegateADPageControl = self
        self.pageControl.arrPageModel = [pageModelInformacion, pageModelAguaLluvias, pageModelAguaEmbotellada, pageModelRegadera, pageModelJacuzzi, pageModelBaldes, pageModelHiguiene, pageModelSanitario, pageModelLavadoRopa, pageModelLiempiezaHogar, pageModelCocina, pageModelLavadoAuto, pageModelJardines, pageModelAlberca, pageModelAlimentacion]
        
        //customize parameters
        pageControl.iFirstVisiblePageNumber = 0
        pageControl.iTitleViewHeight = 50
        pageControl.iPageIndicatorHeight = 4
        pageControl.fontTitleTabText = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pageControl.colorTabText = UIColor.whiteColor()
        pageControl.colorTitleBarBackground = UIColor(red: 137.0/255, green: 158/255, blue: 170/255, alpha: 1.0)
        pageControl.colorPageIndicator = UIColor(red: 86.0/255, green: 116/255, blue: 131/255, alpha: 1.0)
        pageControl.colorPageOverscrollBackground = UIColor(red: 86.0/255, green: 116/255, blue: 131/255, alpha: 1.0)
        
        pageControl.bEnablePagesEndBounceEffect = false
        pageControl.bEnableTitlesEndBounceEffect = false
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
            
            let page1: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("AguaLluvias")
            
            return page1
            
        } else if pageModel.iPageNumber == 2 {
            
            let page2: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("AguaEmbotellada")
            
            return page2
            
        } else if pageModel.iPageNumber == 3 {
            
            let page3: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Regadera")
            
            return page3
            
        } else if pageModel.iPageNumber == 4 {
            
            let page4: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Jacuzzi")
            
            return page4
            
        } else if pageModel.iPageNumber == 5 {
            
            let page5: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Baldes")
            
            return page5
        } else if pageModel.iPageNumber == 6 {
            
            let page6: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("HiguienePersonal")
            
            return page6
        } else if pageModel.iPageNumber == 7 {
            
            let page7: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Sanitario")
            
            return page7
        } else if pageModel.iPageNumber == 8 {
            
            let page8: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("LavadoRopa")
            
            return page8
        } else if pageModel.iPageNumber == 9 {
            
            let page9: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("LimpiezaHogar")
            
            return page9
        } else if pageModel.iPageNumber == 10 {
            
            let page10: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Cocina")
            
            return page10
        } else if pageModel.iPageNumber == 11 {
            
            let page11: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("LavadoAuto")
            
            return page11
        } else if pageModel.iPageNumber == 12 {
            
            let page12: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Jardin")
            
            return page12
        } else if pageModel.iPageNumber == 13 {
            
            let page13: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Alberca")
            
            return page13
        } else if pageModel.iPageNumber == 14 {
            
            let page14: UIViewController = UIStoryboard(name: "HidricaCompleta", bundle: nil).instantiateViewControllerWithIdentifier("Alimentacion")
            
            return page14
        }


        
        return nil
    }
}
