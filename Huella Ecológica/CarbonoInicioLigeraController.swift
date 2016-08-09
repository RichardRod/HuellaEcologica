//
//  CarbonoInicioLigeraController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 7/28/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class CarbonoInicioLigeraController: UIViewController, ADPageControlDelegate {
    
    var pageControl: ADPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPageControll()
    }
    
    private func setupPageControll() {
        
        //create tabs
        let pageModelInformacion: ADPageModel = ADPageModel()
        let pageInformacion: UIViewController = UIStoryboard(name: "CarbonoLigera", bundle: nil).instantiateViewControllerWithIdentifier("Informacion")
        pageModelInformacion.strPageTitle = "Informacion"
        pageModelInformacion.iPageNumber = 0
        pageModelInformacion.viewController = pageInformacion

        let pageModelCombustible: ADPageModel = ADPageModel()
        pageModelCombustible.strPageTitle = "Combustible"
        pageModelCombustible.iPageNumber = 1
        pageModelCombustible.bShouldLazyLoad = true
        
        let pageModelElectricidad: ADPageModel = ADPageModel()
        pageModelElectricidad.strPageTitle = "Electricidad"
        pageModelElectricidad.iPageNumber = 2
        pageModelElectricidad.bShouldLazyLoad = true
        
        let pageModelTransporte: ADPageModel = ADPageModel()
        pageModelTransporte.strPageTitle = "Transporte"
        pageModelTransporte.iPageNumber = 3
        pageModelTransporte.bShouldLazyLoad = true
        
        let pageModelViajes: ADPageModel = ADPageModel()
        pageModelViajes.strPageTitle = "Viajes"
        pageModelViajes.iPageNumber = 4
        pageModelViajes.bShouldLazyLoad = true
        
        let pageModelIngreso: ADPageModel = ADPageModel()
        pageModelIngreso.strPageTitle = "Ingreso"
        pageModelIngreso.iPageNumber = 5
        pageModelIngreso.bShouldLazyLoad = true
    
        //initialize page control
        pageControl = ADPageControl()
        pageControl.delegateADPageControl = self
        self.pageControl.arrPageModel = [pageModelInformacion, pageModelCombustible, pageModelElectricidad, pageModelTransporte, pageModelViajes, pageModelIngreso]
        
        //customize parameters
        pageControl.iFirstVisiblePageNumber = 0
        pageControl.iTitleViewHeight = 50
        pageControl.iPageIndicatorHeight = 4
        pageControl.fontTitleTabText = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pageControl.colorTabText = UIColor.whiteColor()
        pageControl.colorTitleBarBackground = UIColor(red: 144/255, green: 142/255, blue: 127/255, alpha: 1.0)
        pageControl.colorPageIndicator = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        pageControl.colorPageOverscrollBackground = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        
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
            
            let page1: UIViewController = UIStoryboard(name: "CarbonoLigera", bundle: nil).instantiateViewControllerWithIdentifier("Combustible")
            
            return page1
            
        } else if pageModel.iPageNumber == 2 {
            
            let page2: UIViewController = UIStoryboard(name: "CarbonoLigera", bundle: nil).instantiateViewControllerWithIdentifier("Electricidad")
            
            return page2
            
        } else if pageModel.iPageNumber == 3 {
            
            let page3: UIViewController = UIStoryboard(name: "CarbonoLigera", bundle: nil).instantiateViewControllerWithIdentifier("Transporte")
            
            return page3
            
        } else if pageModel.iPageNumber == 4 {
            
            let page4: UIViewController = UIStoryboard(name: "CarbonoLigera", bundle: nil).instantiateViewControllerWithIdentifier("Viajes")
            
            return page4
            
        } else if pageModel.iPageNumber == 5 {
            
            let page5: UIViewController = UIStoryboard(name: "CarbonoLigera", bundle: nil).instantiateViewControllerWithIdentifier("Ingreso")
            
            return page5
        }

        return nil
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
}
