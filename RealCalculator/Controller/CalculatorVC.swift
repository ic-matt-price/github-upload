//
//  ViewController.swift
//  RealCalculator
//
//  Created by Matt Price on 9/4/20.
//  Copyright © 2020 Matt Price. All rights reserved.
//

import UIKit
class CalculatorVC: UIViewController {

    var equation = Equation()
    
    @IBOutlet weak var resultLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        equation.clear()
        updateResultLabel()
        // Do any additional setup after loading the view.
    }
    
    func updateResultLabel() {
        resultLbl.text = equation.getEntryDisplay()
    }
    @IBAction func onClearClicked(_ sender: Any) {
        equation.clear()
        updateResultLabel()
    }
    
    @IBAction func onSignToggleClicked(_ sender: Any) {
        equation.toggleEntryIsPositive()
        updateResultLabel()
    }
    @IBAction func onPercentClicked(_ sender: Any) {
        equation.updateValueToPercent()
        updateResultLabel()
    }
    @IBAction func onDivideClicked(_ sender: Any) {
        equation.setOperator(.divide)
    }
    @IBAction func onSevenClicked(_ sender: Any) {
        equation.buildEntry("7")
        updateResultLabel()
    }
    @IBAction func onEightClicked(_ sender: Any) {
        equation.buildEntry("8")
        updateResultLabel()
    }
    @IBAction func onNineClicked(_ sender: Any) {
        equation.buildEntry("9")
        updateResultLabel()
    }
    @IBAction func onMultiplyClicked(_ sender: Any) {
        equation.setOperator(.multiply)
    }
    @IBAction func onFourClicked(_ sender: Any) {
        equation.buildEntry("4")
        updateResultLabel()
    }
    @IBAction func onFiveClicked(_ sender: Any) {
        equation.buildEntry("5")
        updateResultLabel()
    }
    @IBAction func onSixClicked(_ sender: Any) {
        equation.buildEntry("6")
        updateResultLabel()
    }
    @IBAction func onSubtractClicked(_ sender: Any) {
        equation.setOperator(.subtract)
    }
    @IBAction func onOneClicked(_ sender: Any) {
        equation.buildEntry("1")
        updateResultLabel()
    }
    @IBAction func onTwoClicked(_ sender: Any) {
        equation.buildEntry("2")
        updateResultLabel()
    }
    @IBAction func onThreeClicked(_ sender: Any) {
        equation.buildEntry("3")
        updateResultLabel()
    }
    @IBAction func onAddClicked(_ sender: Any) {
        equation.setOperator(.add)
    }
    @IBAction func onZeroClicked(_ sender: Any) {
        equation.buildEntry("0")
        updateResultLabel()
    }
    @IBAction func onDecimalClicked(_ sender: Any) {
        guard !equation.decimalClicked else {
            return
        }
        equation.decimalClicked = true
        equation.buildEntry(".")
        updateResultLabel()
    }
    @IBAction func onEqualsClicked(_ sender: Any) {
        do {
            let result = try equation.equals()
            let isInteger = floor(result) == result
            equation.clear()
            if isInteger {
                equation.buildEntry("\(Int(result))")
            } else {
                equation.buildEntry("\(result)")
            }
            updateResultLabel()
        } catch {
            resultLbl.text = "ERROR"
        }
        
    }
    
}

