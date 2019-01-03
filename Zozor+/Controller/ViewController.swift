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
    
    private var calculate = Calculate()

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
    
    @IBOutlet private var mainView: CalculateView!
    @IBOutlet private var numberButtons: [UIButton]!
    @IBOutlet private var resetButton: UIButton!
    
    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        let value: Int? = Int(sender.tag)
        for i in numberButtons {
            if sender.tag == i.tag {
                if  value != nil {
                    updateNumber(value!)
                }
            }
        }
    }

    @IBAction func plus() {
       operators("+")
    }

    @IBAction func minus() {
        operators("-")
    }
    
    @IBAction func multiplied(_ sender: Any) {
        operators("x")
    }
    
    @IBAction func split(_ sender: Any) {
        operators("÷")
    }

    @IBAction func equal() {
        var total: Int = 0
        if isExpressionCorrect {
            total = calculate.calculateTotal()
            mainView.updateresult(total: total)
        }
        calculate.clear()
    }
    
    @IBAction func resetTextView(_ sender: Any) {
        mainView.clearTextView()
        calculate.clear()
    }
    
    // MARK: - Methods
    
    private func operators(_ operators: String) {
        if canAddOperator {
            calculate.addOperators(operators)
            calculate.addStringNumber("")
            mainView.updateDisplay(calculate.getStringNumber(), calculate.getOperators())
        }
    }
    
    private func alert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

    private func updateNumber(_ newNumber: Int) {
        calculate.addNewNumber(newNumber)
        mainView.updateDisplay(calculate.getStringNumber(), calculate.getOperators())
    }
}
