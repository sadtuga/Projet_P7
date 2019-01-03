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
    
    func updateresult(total: Int) {
        textView.text = textView.text + "=\(total)"
    }
    
    func clearTextView() {
        textView.text = ""
    }
}
