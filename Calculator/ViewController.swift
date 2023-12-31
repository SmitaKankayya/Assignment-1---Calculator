//
//  ViewController.swift
//  Calculator
//
//  Created by Smita Kankayya on 09/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen : Double = 0
    var previousNumber : Double = 0
    var performingMath = false
    var operation = 0
    
    
    @IBOutlet var valueContainer: UIView!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var allButton: [UIButton]!
    
    var borderWidth: CGFloat!
    var borderColor: UIColor!
    var cornerRadius: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueContainer.layer.borderWidth = 1
        valueContainer.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        for button in allButton {
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        }
        
}
    
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true{
            resultLabel.text = String(sender.tag - 1)
            numberOnScreen = Double(resultLabel.text!)!
            performingMath = false
        }
        else{
            resultLabel.text = resultLabel.text! + String(sender.tag - 1)
            numberOnScreen = Double(resultLabel.text!)!
            
        }
    }
    
    
    @IBAction func Calculate(_ sender: UIButton) {
        if resultLabel.text != ""  && sender.tag != 15 && sender.tag != 16
        {
            previousNumber = Double(resultLabel.text!)!
            if sender.tag
                == 11
            {
                resultLabel.text = " + "
            }
            else if sender.tag == 12
            {
                resultLabel.text = " - "
            }
            else if sender.tag == 13
            {
                resultLabel.text = " * "
            }
            else if sender.tag == 14
            {
                resultLabel.text = " / "
            }
            operation = sender.tag
            performingMath = true
        }
        
        else if sender.tag == 15
        {
            if operation == 11
            {
                resultLabel.text = String(previousNumber + numberOnScreen)
            }
            else if operation == 12
            {
                resultLabel.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 13
            {
                resultLabel.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                resultLabel.text = String(previousNumber / numberOnScreen)
            }
        }
        else if sender.tag == 16
        {
            resultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            
        }
        
    }
    
}

