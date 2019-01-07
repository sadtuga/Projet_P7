//
//  CalculateView.swift
//  CountOnMe
//
//  Created by Marques Lucas on 31/12/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import UIKit

class CalculateView: UIView {

    @IBOutlet private var textView: UITextView! // Contains the textView that displays the operation
    
    // Update the textView
    func updateDisplay(_ stringNumbers: [String], _ operators: [String]) {
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }

        textView.text = text
    }
    
    // Check if the result of the operation is not a float with a zero as the only decimal
    private func isDecimal(_ total: Double) -> Bool {
        let totalString : String = String(total)
        var check: Bool = false
        for (i, e) in totalString.enumerated() {
            if e == "." {
                check = true
            }
            if e == "0" && i == totalString.count-1 && check == true {
                return true
            }
        }
        return false
    }
    
    // Add the result of the operation to the textView
    func updateresult(total: Double) {
        let check: Bool = isDecimal(total)
        if check == true {
            let integer: Int = Int(total)
            textView.text = textView.text + "=\(integer)"
        } else {
            textView.text = textView.text + "=\(total)"
        }
    }
    
    // Resets the textView
    func clearTextView() {
        textView.text = ""
    }
}
