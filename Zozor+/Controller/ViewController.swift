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
    
    var calculate = Calculate()

    var isExpressionCorrect: Bool {
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

    var canAddOperator: Bool {
        if let stringNumber = calculate.getLastStringNumber() {
            if stringNumber.isEmpty {
                alert(title: "Zéro!", message: "Expression incorrecte !")
                return false
            }
        }
        return true
    }

    // MARK: - Outlets
    
    @IBOutlet var mainView: CalculateView!
    @IBOutlet var numberButtons: [UIButton]!

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
        if canAddOperator {
            calculate.addOperators("+")
            calculate.addStringNumber("")
            mainView.updateDisplay(calculate.getStringNumber(), calculate.getOperators())
        }
    }

    @IBAction func minus() {
        if canAddOperator {
            calculate.addOperators("-")
            calculate.addStringNumber("")
            mainView.updateDisplay(calculate.getStringNumber(), calculate.getOperators())
        }
    }

    @IBAction func equal() {
        var total: Int = 0
        if isExpressionCorrect {
            total = calculate.calculateTotal()
            mainView.updateresult(total: total)
        }
        calculate.clear()
    }

    // MARK: - Methods
    
    private func alert(title: String, message: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

    func updateNumber(_ newNumber: Int) {
        calculate.addNewNumber(newNumber)
        mainView.updateDisplay(calculate.getStringNumber(), calculate.getOperators())
    }
}
