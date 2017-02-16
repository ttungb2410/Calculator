//
//  OperatorsButton.swift
//  Calculator
//
//  Created by TTung on 2/15/17.
//  Copyright © 2017 TTung. All rights reserved.
//

import UIKit

class OperatorsButton: UIButton {


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
        condigureButton()
    }
    
    func condigureButton() -> Void {
        if tag == 101 {
            backgroundColor = UIColor.init(red: 245/255, green: 165/255, blue: 34/255, alpha: 1)
        }else{
        backgroundColor = UIColor.init(red: 116/255, green: 219/255, blue: 110/255, alpha: 1)
        }
        layer.cornerRadius = 3.0
        titleLabel?.font = UIFont(name: "OPenSans-Semibold", size: 20)
        
        self.setTitleColor(UIColor.white, for: .normal)
    }

}
