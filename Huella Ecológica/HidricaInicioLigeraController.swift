//
//  HidricaInicioLigeraController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 7/29/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class HidricaInicioLigeraController: UIViewController, ADPageControlDelegate {
    
    var pageControl: ADPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPageControll()
    }
    
    private func setupPageControll() {
        
        let pageModelInformacion: ADPageModel = ADPageModel()
        let pageInformacion: UIViewController = UIStoryboard(name: "HidricaLigera", bundle: nil).instantiateViewControllerWithIdentifier("Informacion")
        pageModelInformacion.strPageTitle = "Información"
        pageModelInformacion.iPageNumber = 0
        pageModelInformacion.viewController = pageInformacion
        
        let pageModelRegadera: ADPageModel = ADPageModel()
        pageModelRegadera.strPageTitle = "Regadera"
        pageModelRegadera.iPageNumber = 1
        pageModelRegadera.bShouldLazyLoad = true
        
        let pageModelAseo: ADPageModel = ADPageModel()
        pageModelAseo.strPageTitle = "Aseo Personal"
        pageModelAseo.iPageNumber = 2
        pageModelAseo.bShouldLazyLoad = true
        
        let pageModelSanitario: ADPageModel = ADPageModel()
        pageModelSanitario.strPageTitle = "Sanitario"
        pageModelSanitario.iPageNumber = 3
        pageModelSanitario.bShouldLazyLoad = true
        
        let pageModelLavado: ADPageModel = ADPageModel()
        pageModelLavado.strPageTitle = "Lavado de ropa"
        pageModelLavado.iPageNumber = 4
        pageModelLavado.bShouldLazyLoad = true
        
        let pageModelAlimentacion: ADPageModel = ADPageModel()
        pageModelAlimentacion.strPageTitle = "Alimentación"
        pageModelAlimentacion.iPageNumber = 5
        pageModelAlimentacion.bShouldLazyLoad = true
        
        //initialize page control
        pageControl = ADPageControl()
        pageControl.delegateADPageControl = self
        self.pageControl.arrPageModel = [pageModelInformacion, pageModelRegadera, pageModelAseo, pageModelSanitario, pageModelLavado, pageModelAlimentacion]
        
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
            
            let page1: UIViewController = UIStoryboard(name: "HidricaLigera", bundle: nil).instantiateViewControllerWithIdentifier("Regadera")
            
            return page1
            
        } else if pageModel.iPageNumber == 2 {
            
            let page2: UIViewController = UIStoryboard(name: "HidricaLigera", bundle: nil).instantiateViewControllerWithIdentifier("Aseo")
            
            return page2
            
        } else if pageModel.iPageNumber == 3 {
            
            let page3: UIViewController = UIStoryboard(name: "HidricaLigera", bundle: nil).instantiateViewControllerWithIdentifier("Sanitario")
            
            return page3
            
        } else if pageModel.iPageNumber == 4 {
            
            let page4: UIViewController = UIStoryboard(name: "HidricaLigera", bundle: nil).instantiateViewControllerWithIdentifier("Lavado")
            
            return page4
            
        } else if pageModel.iPageNumber == 5 {
            
            let page5: UIViewController = UIStoryboard(name: "HidricaLigera", bundle: nil).instantiateViewControllerWithIdentifier("Alimentacion")
            
            return page5
        }
        
        return nil
    }
}
