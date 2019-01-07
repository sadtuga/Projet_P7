//
//  ViewControllerUITestCase.swift
//  CountOnMeUITests
//
//  Created by Marques Lucas on 02/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest

class ViewControllerUITestCase: XCTestCase {
    
    private let app = XCUIApplication() // Stock a proxy for an application that can be launched and terminated.
    private var text: String?           // Store the string contained in the textView

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
    }

    // Test if the digit button displays returns the correct value
    func testGivenTheUserInterface_WhenTheNumericButtonsIsPressed_ThenDisplayInTextView() {
        var cpt: Int = 0
        var value: String = ""
        repeat {
            value = String(cpt)
            app.buttons[value].tap()
            cpt += 1
        } while cpt < 10
    
        text = app.textViews["Screen"].value as? String
        
        XCTAssertEqual(text, "0123456789")
    }
    
    // Test if the operator works
    func testGivenTheUserInterface_WhenAnOperationIsSeized_ThenDisplayInTextView() {
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["6"].tap()
        app.buttons["7"].tap()
        app.buttons["-"].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.buttons["1"].tap()
        app.buttons["x"].tap()
        app.buttons["4"].tap()
        app.buttons["÷"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        
        text = app.textViews["Screen"].value as? String
        
        XCTAssertEqual(text, "3+67-2.1x4÷2=135.8")
    }
    
    // Test if the Alerts works
    func testGivenTheUserInterface_whenAnIncorrectSequenceIsEntered_ThenDisplayAlert() {
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["="].tap()
        XCTAssertTrue(app.alerts["Zéro!"].isHittable)
    }
    
    // Test if the Alerts works
    func testGivenTheUserInterface_WhenThePlusOperatorPressed_ThenDisplayAlert() {
        app.buttons["+"].tap()
        XCTAssertTrue(app.alerts["Zéro!"].isHittable)
    }
    
    // Test if the Alerts works
    func testGivenTheUserInterface_WhenTheMinusOperatorPressed_ThenDisplayAlert() {
        app.buttons["-"].tap()
        XCTAssertTrue(app.alerts["Zéro!"].isHittable)
    }
    
    // Test if the Alerts works
    func testGivenTheUserInterface_WhenTheSplitOperatorPressed_ThenDisplayAlert() {
        app.buttons["÷"].tap()
        XCTAssertTrue(app.alerts["Zéro!"].isHittable)
    }
    
    // Test if the Alerts worksv
    func testGivenTheUserInterface_WhenTheMultipliedOperatorPressed_ThenDisplayAlert() {
        app.buttons["x"].tap()
        XCTAssertTrue(app.alerts["Zéro!"].isHittable)
    }
    
    // Test if the Alerts works
    func testGivenTheUserInterface_WhenTheEqualOperatorPressed_ThenDisplayAlert() {
        app.buttons["="].tap()
        XCTAssertTrue(app.alerts["Zéro!"].isHittable)
    }
    
    // Test if the c button works
    func testGivenGivenTheUserInterface_WhenTheResetButtonIsPressed_ThenTheTextViewIsReset() {
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["6"].tap()
        app.buttons["."].tap()
        app.buttons["7"].tap()
        app.buttons["-"].tap()
        app.buttons["2"].tap()
        app.buttons["1"].tap()
        app.buttons["C"].tap()
        
        text = app.textViews["Screen"].value as? String
        XCTAssertEqual(text, "")
    }
}
