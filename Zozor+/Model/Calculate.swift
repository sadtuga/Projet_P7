//
//  Calculate.swift
//  CountOnMe
//
//  Created by Marques Lucas on 31/12/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import Foundation

class Calculate {
    
    private var stringNumbers: [String] = [String()]
    private var operators: [String] = ["+"]
    
    func getStringNumber() -> [String] {
        return stringNumbers
    }
    
    func getLastStringNumber() -> String? {
        return stringNumbers.last!
    }
    
    func getOperators() -> [String] {
        return operators
    }
    
    func calculateTotal() -> Int {
        var total = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                } else if operators[i] == "x" {
                    total *= number
                } else if operators[i] == "÷" {
                    total /= number
                }
            }
        }
        return total
    }
    
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    func addOperators(_ operators: String) {
        self.operators.append(operators)
    }
    
    func addStringNumber(_ number: String) {
        stringNumbers.append(number)
    }
    
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
    }
}
