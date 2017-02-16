//
//  ViewController.swift
//  Calculator
//
//  Created by TTung on 2/15/17.
//  Copyright © 2017 TTung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_noti: UILabel!
    @IBOutlet weak var distanceBetweenInputTextFieldAndResultLabel: NSLayoutConstraint!

    @IBOutlet weak var distanceBetweenResultLabelAndMiddleView: NSLayoutConstraint!
    
   
    @IBOutlet weak var tf_input: UITextField!
    @IBOutlet weak var lbl_result: UILabel!
    
    
    var isTappingNumber: Bool = false
    var isEndOperation: Bool = true
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var operation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tf_input.isUserInteractionEnabled = false
    }
    override func updateViewConstraints() {
        super.updateViewConstraints()
        updateConstraints()
    }
    
    
    func updateConstraints() -> Void {
        let scale = UIScreen().bounds.size.height / 667
        
        distanceBetweenResultLabelAndMiddleView.constant = UIScreen.main.bounds.size.height > 480 ? distanceBetweenResultLabelAndMiddleView.constant * scale : distanceBetweenResultLabelAndMiddleView.constant * 0.1
        
        distanceBetweenInputTextFieldAndResultLabel.constant = UIScreen.main.bounds.size.height > 480 ? distanceBetweenInputTextFieldAndResultLabel.constant * scale : distanceBetweenInputTextFieldAndResultLabel.constant * 0.1
        
    }
    
    @IBAction func action_number(_ sender: UIButton) {
   
        let number = sender.currentTitle
        
        if isTappingNumber {
            tf_input.text = tf_input.text! + number!
        }else{
            tf_input.text = number
            isTappingNumber = true
        }
        
    }
    
    
    @IBAction func action_operator(_ sender: UIButton) {
   
        operation = sender.currentTitle!
        
        if let inputOperator = Double(tf_input.text!){
            if isEndOperation {
                firstNumber = inputOperator
                isEndOperation = false
            }else{
                firstNumber = Double(lbl_result.text!)!
                tf_input.text = "\(firstNumber)"
            }
            lbl_noti.text = ""
        }else{
           lbl_noti.text = "Ban can nhap so va tinh toan"
        }
        isTappingNumber = false
        
        if operation == "%" {
            action_equal(sender)
        }else if operation == "+/-"{
            action_equal(sender)
        }
        
    }
    
    @IBAction func action_equal(_ sender: UIButton) {
   
        isTappingNumber = false
        var result: Double = 0
        
        if let realSecondNumber = Double(tf_input.text!){
            secondNumber = realSecondNumber
        }
        
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "*":
            result = firstNumber * secondNumber
        case "/":
            result = firstNumber / secondNumber
            if secondNumber == 0 {
                lbl_noti.text = "Khong chia duoc cho 0"
            }
        case "%":
            result = firstNumber / 100
        case "+/-":
            if firstNumber < 0 {
                firstNumber = fabs(firstNumber)
                result = firstNumber
            }else if firstNumber == 0{
                lbl_noti.text = "ban phai nhap so khac 0"
                result = 0
            }
            else{
                firstNumber = -1 * firstNumber
                result = firstNumber
            }
            tf_input.text = "\(result)"
        default:
            print("Error Opertion")
        }
        
        lbl_result.text = "\(result)"
    
    }
    
    
    @IBAction func action_ac(_ sender: Any) {
   
        firstNumber = 0
        secondNumber = 0
        tf_input.text = ""
        lbl_result.text = "0"
        isEndOperation = true
        lbl_noti.text = ""
    
    }
 

}

