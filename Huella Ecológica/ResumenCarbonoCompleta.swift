//
//  ResumenCarbonoCompleta.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 9/9/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import Foundation

class ResumenCarbonoCompleta:UIViewController {
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func continuarAction(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("InitialView")
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}