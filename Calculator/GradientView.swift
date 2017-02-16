//
//  GradientView.swift
//  Calculator
//
//  Created by TTung on 2/15/17.
//  Copyright © 2017 TTung. All rights reserved.
//

import UIKit

class GradientView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if tag == 110 {
            backgroundColor = UIColor.init(red: 49/255, green: 58/255, blue: 75/255, alpha: 1.0)
        }else{
            self.createGradient()
        }
        
    }
    
    
    func createGradient() -> Void {
        
        let bgGradient = CAGradientLayer()
        
        bgGradient.frame = self.frame
        bgGradient.colors = [UIColor.init(red: 57/255, green: 120/255, blue: 127/255, alpha: 1.0).cgColor,
                             UIColor.init(red: 77/255, green: 188/255, blue: 201/255, alpha: 1.0).cgColor]
        
        let startPoint = CGPoint.init(x: 0, y:0)
        let endPoint = CGPoint.init(x: 0.5, y: 0.8)
        bgGradient.startPoint = startPoint
        bgGradient.endPoint = endPoint
        
        self.layer.insertSublayer(bgGradient, at: 0)
        
    }
}
