//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties

    private var calculate = Calculate() // Stock the instance of the class Calculate

    // Is true if the expression is correct
    private var isExpressionCorrect: Bool {
        if let stringNumber = calculate.getLastStringNumber() {
            if stringNumber.isEmpty {
                if calculate.getStringNumber().count == 1 {
                    alert(title: "Zéro!", message: "Démarrez un nouveau calcul !")
                } else {
                    alert(title: "Zéro!", message: "Entrez une expression correcte !")
                }
                return false
            }
        }
        return true
    }

    // Is true if it is possible to add an operator
    private var canAddOperator: Bool {
        if let stringNumber = calculate.getLastStringNumber() {
            if stringNumber.isEmpty {
                alert(title: "Zéro!", message: "Expression incorrecte !")
                return false
            }
        }
        return true
    }

    // MARK: - Outlets

    @IBOutlet private var mainView: CalculateView!   // Stock the main view of the application
    @IBOutlet private var numberButtons: [UIButton]! // Stock the UIButton corresponding to the numeric button
    @IBOutlet private var resetButton: UIButton!     // Stock the UIButton corresponding to the "c" button

    // MARK: - Action

    // Send to the method updateNumber the value of the digit button pressed
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        let value: Int? = Int(sender.tag)
        for element in numberButtons {
            if sender.tag == element.tag {
                if  value != nil {
                    updateNumber(value!)
                }
            }
        }
    }

    // Sending in parameter of the operators method "+"
    @IBAction func plus() {
       operators("+")
    }

    // Sending in parameter of the operators method "-"
    @IBAction func minus() {
        operators("-")
    }

    // Sending in parameter of the operators method "x"
    @IBAction func multiplied() {
        operators("x")
    }

    // Sending in parameter of the operators method "÷"
    @IBAction func split() {
        operators("÷")
    }

    // Calculates and displays the total
    @IBAction func equal() {
        var total: Double = 0.0
        if isExpressionCorrect {
            total = calculate.calculateTotal()
            mainView.updateresult(total: total)
        }
        calculate.clear()
    }

    // Resets the operation
    @IBAction func resetTextView(_ sender: Any) {
        mainView.clearTextView()
        calculate.clear()
    }

    // Add and display a point
    @IBAction func point(_ sender: Any) {
        if !calculate.getIsDecimal() {
            calculate.addPoint()
            mainView.updateDisplay(calculate.getStringNumber(), calculate.getOperators())
        }
    }

    // MARK: - Methods

    // Add an operator and display it on the screen if this is possible
    private func operators(_ operators: String) {
        if canAddOperator {
            calculate.addOperators(operators)
            calculate.addStringNumber("")
            mainView.updateDisplay(calculate.getStringNumber(), calculate.getOperators())
        }
    }

    // Displays a custom alert based on the received parameter
    private func alert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

    // Add a number and display on the screen
    private func updateNumber(_ newNumber: Int) {
        calculate.addNewNumber(newNumber)
        mainView.updateDisplay(calculate.getStringNumber(), calculate.getOperators())
    }
}
