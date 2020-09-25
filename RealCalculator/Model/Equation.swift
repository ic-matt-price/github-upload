//
//  Calculator.swift
//  RealCalculator
//
//  Created by Matt Price on 9/9/20.
//  Copyright © 2020 Matt Price. All rights reserved.
//

import Foundation

enum EquationError: Error {
    case invalidOperator
    case invalidDivisor
}
enum Operator {
    case none
    case add
    case subtract
    case multiply
    case divide
}
struct Equation {
    var entry: String = ""
    var decimalClicked: Bool = false
    var entryIsPositive: Bool = true
    var leftOperand: Double = 0.0
    var equationOperator: Operator = .none
    var rightOperand: Double = 0.0
    
    mutating func buildEntry(_ digit: String) {
        entry += digit
        if entry.count > 15 {
            entry = String(entry.prefix(15))
        }
        if entry.prefix(1) == "-" {
            entryIsPositive = false
        } else {
            entryIsPositive = true
        }
    }
    
    mutating func toggleEntryIsPositive() {
        entryIsPositive = !entryIsPositive
        if !entryIsPositive {
            entry = "-\(entry)"
        } else {
            entry = String(entry.suffix(entry.count - 1))
        }
    }
    
    func getEntryDisplay() -> String {
        return entry
    }
    
    mutating func updateValueToPercent() {
        if let value = Double(entry) {
            let percent = value / 100.0
            entry = "\(percent)"
        } else {
            entry = ""
        }
    }
    
    mutating func equals() throws -> Double {
        if let value = Double(entry) {
            rightOperand = value
        } else {
            rightOperand = 0.0
        }
        switch equationOperator {
        case .none:
            return leftOperand + rightOperand
        case .add:
            return leftOperand + rightOperand
        case .subtract:
            return leftOperand - rightOperand
        case .multiply:
            return leftOperand * rightOperand
        case .divide:
            if rightOperand == 0.0 {
                throw EquationError.invalidDivisor
            }
            return leftOperand / rightOperand
        }
    }
    
    mutating func setOperator(_ op: Operator) {
        if op != .none {
            if let value = Double(entry) {
                leftOperand = value
            } else {
                leftOperand = 0.0
            }
        }else{
            leftOperand = 0.0
        }
        equationOperator = op
        entry = ""
        decimalClicked = false
        entryIsPositive = true
    }
    
    mutating func clear() {
        equationOperator = .none
        entry = ""
        decimalClicked = false
        entryIsPositive = true
        leftOperand = 0.0
        rightOperand = 0.0
    }
    
    
}
