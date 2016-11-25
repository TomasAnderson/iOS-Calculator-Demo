//
//  ViewController.swift
//  Calculator
//
//  Created by Zhou You on 16/11/16.
//  Copyright © 2016 Zhou You. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet private weak var display: UILabel!
    
    private var isInTheMiddleOfTyping = false

    @IBAction private func PressDigit(_ sender: UIButton) {
        if isInTheMiddleOfTyping {
            let currentDisplayText = display.text!
            display.text = currentDisplayText + sender.currentTitle!
        } else {
            display.text = sender.currentTitle!
        }
        isInTheMiddleOfTyping = true
        

    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()

    @IBAction private func PerformOperation(_ sender: UIButton) {
        if isInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            isInTheMiddleOfTyping = false
        }
        if let mathematicalSymble = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymble)
        }
        displayValue = brain.result
    }
}

