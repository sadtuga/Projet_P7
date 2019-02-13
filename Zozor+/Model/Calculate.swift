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
    private var operators: [String] = ["+"]           // Stock the operators in a string array
    private var isDecimal: Bool = false              // Is equal to true if the user enters a decimal number
    
    // Is true if the expression is correct
     var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumber.count == 1 {
                    notification(message: "Démarrez un nouveau calcul !")
                } else {
                    notification(message: "Entrez une expression correcte !")
                }
                return false
            }
        }
        return true
    }
    
    // Is true if it is possible to add an operator
    private var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                notification(message: "Expression incorrecte !")
                return false
            }
        }
        return true
    }

    // Return the array stringNumber
    func getStringNumber() -> [String] {
        return stringNumbers
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
        
        if let total = diviseOrMultiply() {
            if operators.count == 1 {
                print(total)
                return total
            }
        }
            return addOrMinus()
    }
    
    // Returns the result of addition and subtraction
    private func addOrMinus() -> Double {
        var total: Double = 0.0
        for (cpt, stringNumber) in stringNumbers.enumerated() {
            if let number: Double = Double(stringNumber) {
                if operators[cpt] == "+" {
                    total += Double(number)
                } else if operators[cpt] == "-" {
                    total -= Double(number)
                }
            }
        }
        return total
    }
    
    // Returns the result of multiplication and division
    private func diviseOrMultiply() -> Double? {
        var total: Double = 0.0
        var tmpOperator = ""
        while operators.contains("x") || operators.contains("÷") {
            
            tmpOperator = containsAnOperator()
            
            guard let operatorIndex = operators.index(of: tmpOperator) else {return nil}
            guard let numberOne = Double(stringNumbers[operatorIndex-1]) else {return nil}
            guard let numberTwoo = Double(stringNumbers[operatorIndex]) else {return nil}
                
            if tmpOperator == "x" {
                total =  numberOne * numberTwoo
            } else if tmpOperator == "÷" {
                total =  numberOne / numberTwoo
            }
            modifyStringNumber(index: operatorIndex, total: total)
        }
        return total
    }
    
    // Return the operator if the operators array contains
    private func containsAnOperator() -> String {
        if operators.contains("x") {
            return "x"
        } else {
            return "÷"
        }
    }
    
    // Add the result to the array stringNumber and remove the box from the array corresponding to the index received
    private func modifyStringNumber(index: Int, total: Double) {
        stringNumbers.remove(at: index)
        stringNumbers[index - 1] = "\(total)"
        operators.remove(at: index)
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
    private func addOperators(_ operators: String) {
        self.operators.append(operators)
        isDecimal = false
    }

    // Add the received parameter to the array stringNumbers
    private func addStringNumber(_ number: String) {
        stringNumbers.append(number)
    }

    // Resets all the parameters of the class Calculate
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        isDecimal = false
    }
    
    // Check if an operator can be add and add if possible
    func operators(_ operators: String) {
        if canAddOperator {
            addOperators(operators)
            addStringNumber("")
        }
    }
    
    // Check if the operation is valid and return the result if this is the case
    func isCalculable() -> Double? {
        if isExpressionCorrect {
            return calculateTotal()
        }
        return nil
    }
    
    // Send a notification
    private func notification(message: String) {
        let name = Notification.Name(message)
        let notification = Notification(name: name)
        NotificationCenter.default.post(notification)
    }
}
