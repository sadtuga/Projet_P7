//
//  ViewControllerTestCase.swift
//  CountOnMeUITests
//
//  Created by Marques Lucas on 02/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest

class ViewControllerTestCase: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGiven_When_Then() {
        let app = XCUIApplication()
        var cpt: Int = 0
        var value: String = ""
        
        while cpt < 9 {
            value = String(cpt)
            app.buttons[value].tap()
            cpt += 1
        }
        let calculatorScreenTextView = app.textViews["Calculator Screen"]
        let screenText = calculatorScreenTextView.value as? String
        XCTAssertEqual(screenText!, "1234567890")
    }

}
