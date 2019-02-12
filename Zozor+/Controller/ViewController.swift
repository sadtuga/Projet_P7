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

    // MARK: - Outlets

    @IBOutlet private var mainView: CalculateView!   // Stock the main view of the application
    @IBOutlet private var numberButtons: [UIButton]! // Stock the UIButton corresponding to the numeric button
    @IBOutlet private var resetButton: UIButton!     // Stock the UIButton corresponding to the "c" button
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstNotif = Notification.Name(rawValue: "Démarrez un nouveau calcul !")
        NotificationCenter.default.addObserver(self, selector: #selector(beginNewCalculateAlert), name: firstNotif, object: nil)
        
        let secondNotif = Notification.Name(rawValue: "Entrez une expression correcte !")
        NotificationCenter.default.addObserver(self, selector: #selector(enterCorrectExpressionAlert), name: secondNotif, object: nil)
        
        let thirdNotif = Notification.Name(rawValue: "Expression incorrecte !")
        NotificationCenter.default.addObserver(self, selector: #selector(incorrectExpressionAlert), name: thirdNotif, object: nil)
    }

    // MARK: - Action

    // Send to the method updateNumber the value of the digit button pressed
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        updateNumber(sender.tag)
    }

    // Sending in parameter of the operators method "+"
    @IBAction func plus() {
        calculate.operators("+")
        updateScreen()
    }

    // Sending in parameter of the operators method "-"
    @IBAction func minus() {
        calculate.operators("-")
        updateScreen()
    }

    // Sending in parameter of the operators method "x"
    @IBAction func multiplied() {
        calculate.operators("x")
        updateScreen()
    }

    // Sending in parameter of the operators method "÷"
    @IBAction func split() {
        calculate.operators("÷")
        updateScreen()
    }

    // Calculates and displays the total
    @IBAction func equal() {
        if let total: Double = calculate.isCalculable() {
            mainView.updateresult(total: total)
            calculate.clear()
        }
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
            updateScreen()
        }
    }

    // MARK: - Methods

    // Update the app view
    private func updateScreen() {
        mainView.updateDisplay(calculate.getStringNumber(), calculate.getOperators())
    }

    // Create a "begin new calculated" alert
    @objc private func beginNewCalculateAlert() {
        let alert = UIAlertController(title: title, message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
        displayAlert(alert)
    }
    
    // Create a "enter correct expression" alert
    @objc private func enterCorrectExpressionAlert() {
        let alert = UIAlertController(title: title, message: "Entrez une expression correcte !", preferredStyle: .alert)
        displayAlert(alert)
    }
    
    // Create a "incorrect expression" alert
    @objc private func incorrectExpressionAlert() {
        let alert = UIAlertController(title: title, message: "Expression incorrecte !", preferredStyle: .alert)
        displayAlert(alert)
    }
    
    // Display Custom alert
    private func displayAlert(_ alert: UIAlertController) {
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // Add a number and display on the screen
    private func updateNumber(_ newNumber: Int) {
        calculate.addNewNumber(newNumber)
        mainView.updateDisplay(calculate.getStringNumber(), calculate.getOperators())
    }
}
