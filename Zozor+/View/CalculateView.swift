//
//  CalculateView.swift
//  CountOnMe
//
//  Created by Marques Lucas on 31/12/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import UIKit

class CalculateView: UIView {

    @IBOutlet private var textView: UITextView!
    
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
    
    private func isDecimal(_ total: Double) -> Bool {
        let x : String = String(total)
        var check: Bool = false
        for (i, e) in x.enumerated() {
            if e == "." {
                check = true
            }
            if e == "0" && i == x.count-1 && check == true {
                return true
            }
        }
        return false
    }
    
    func updateresult(total: Double) {
        let check: Bool = isDecimal(total)
        if check == true {
            let integer: Int = Int(total)
            textView.text = textView.text + "=\(integer)"
        } else {
            textView.text = textView.text + "=\(total)"
        }
    }
    
    func clearTextView() {
        textView.text = ""
    }
}
