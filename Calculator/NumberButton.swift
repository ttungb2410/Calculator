//
//  NumberButton.swift
//  Calculator
//
//  Created by TTung on 2/16/17.
//  Copyright © 2017 TTung. All rights reserved.
//

import UIKit

class NumberButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.condigureButton()
    }
    
    func condigureButton() -> Void{
        
        backgroundColor = UIColor.init(red: 86/255, green: 190/255, blue: 133/255, alpha:  1)
        
        layer.borderWidth = 0.5
        layer.cornerRadius = 3.0
        layer.borderColor = UIColor.init(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.2).cgColor

        self.setTitleColor(UIColor.black, for: .normal)
    }
}
