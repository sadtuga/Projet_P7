//
//  Calculate.swift
//  CountOnMe
//
//  Created by Marques Lucas on 31/12/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import Foundation

class Calculate {
    
    private var stringNumbers: [String] = [String()] // Stock the operation in a string array
    private var operators: [String] = ["+"]          // Stock the operators in a string array
    private var isDecimal: Bool = false              // Is equal to true if the user enters a decimal number
    
    // Return the array stringNumber
    func getStringNumber() -> [String] {
        return stringNumbers
    }
    
    // Return the last element of stringNumber
    func getLastStringNumber() -> String? {
        return stringNumbers.last!
    }
    
    // Return the array of operators
    func getOperators() -> [String] {
        return operators
    }
    
    // Return a boolean corresponding to the property isDecimal
    func getIsDecimal() -> Bool {
        return isDecimal
    }
    
    // Return the result of the operation
    func calculateTotal() -> Double {
        var total = 0.0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Double(stringNumber) {
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
    
    // Add a number in the array stringNumbers
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    // Add a point in the array stringNumbers
    func addPoint() {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "."
            isDecimal = true
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    // Add operator entered by user
    func addOperators(_ operators: String) {
        self.operators.append(operators)
        isDecimal = false
    }
    
    // Add the received parameter to the array stringNumbers
    func addStringNumber(_ number: String) {
        stringNumbers.append(number)
    }
    
    // Resets all the parameters of the class Calculate
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        isDecimal = false
    }
}
