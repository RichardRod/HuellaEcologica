//
//  IngresoCarbonoCompletaController.swift
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 8/24/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

import UIKit

class IngresoCarbonoCompletaController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerIngreso: UIPickerView!
    
    var elementos = ["Menos de $4,000", "De $4,001 a $7,000", "De $7,001, a $8,500", "De $8,501 a $10,500",
                     "De $10,501 a $12,500", "De $12,501 a $15,000", "De $15,001 a $18,500", "De $18,501 a $25,000",
                     "De $25,001 a $45,000", "Más de $45,001"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerIngreso.delegate = self
        pickerIngreso.dataSource = self
        
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return elementos.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return elementos[row]
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1.0)
        pickerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        pickerLabel.text = elementos[row]
        
        return pickerLabel
    }
}
