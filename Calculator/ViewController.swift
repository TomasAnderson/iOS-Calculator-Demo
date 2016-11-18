//
//  ViewController.swift
//  Calculator
//
//  Created by Zhou You on 16/11/16.
//  Copyright © 2016 Zhou You. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var display: UILabel!
    
    var isInTheMiddleOfTyping = false

    @IBAction func PressDigit(_ sender: UIButton) {
        if isInTheMiddleOfTyping {
            let currentDisplayText = display.text!
            display.text = currentDisplayText + sender.currentTitle!
        } else {
            display.text = sender.currentTitle!
        }
        isInTheMiddleOfTyping = true
        

    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }

    @IBAction func PerformOperation(_ sender: UIButton) {
        isInTheMiddleOfTyping = false
        if let symbol = sender.currentTitle {
            if symbol == "π" {
                displayValue = M_PI
            } else if symbol == "√" {
                displayValue = sqrt(displayValue)
            }

        }
        
    }
}

