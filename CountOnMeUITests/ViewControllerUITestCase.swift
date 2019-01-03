//
//  ViewControllerUITestCase.swift
//  CountOnMeUITests
//
//  Created by Marques Lucas on 02/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest

class ViewControllerUITestCase: XCTestCase {
    
    private let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
    }

    func testGivenTheUserInterface_WhenTheNumericButtonsIsPressed_ThenDisplayInTextView() {
        var cpt: Int = 0
        var value: String = ""
        repeat {
            value = String(cpt)
            app.buttons[value].tap()
            cpt += 1
        } while cpt < 10
    
        let text = app.textViews["Screen"].value as? String
        
        XCTAssertEqual(text, "0123456789")
    }
    
    func testGivenTheUserInterface_WhenTheOperationWithNumericButtonsAndOperators_ThenDisplayInTextView() {
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["6"].tap()
        app.buttons["7"].tap()
        app.buttons["-"].tap()
        app.buttons["2"].tap()
        app.buttons["1"].tap()
        app.buttons["x"].tap()
        app.buttons["4"].tap()
        app.buttons["÷"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        
        let text = app.textViews["Screen"].value as? String
        
        XCTAssertEqual(text, "3+67-21x4÷2=98")
    }
    
    func testGivenTheUserInterface_whenAnIncorrectSequenceIsEntered_ThenDisplayAlert() {
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["="].tap()
        XCTAssertTrue(app.alerts["Zéro!"].isHittable)
    }
    
    func testGivenTheUserInterface_WhenThePlusOperatorPressed_ThenDisplayAlert() {
        app.buttons["+"].tap()
        XCTAssertTrue(app.alerts["Zéro!"].isHittable)
    }
    
    func testGivenTheUserInterface_WhenTheMinusOperatorPressed_ThenDisplayAlert() {
        app.buttons["-"].tap()
        XCTAssertTrue(app.alerts["Zéro!"].isHittable)
    }
    
    func testGivenTheUserInterface_WhenTheSplitOperatorPressed_ThenDisplayAlert() {
        app.buttons["÷"].tap()
        XCTAssertTrue(app.alerts["Zéro!"].isHittable)
    }
    
    func testGivenTheUserInterface_WhenTheMultipliedOperatorPressed_ThenDisplayAlert() {
        app.buttons["x"].tap()
        XCTAssertTrue(app.alerts["Zéro!"].isHittable)
    }
    
    func testGivenTheUserInterface_WhenTheEqualOperatorPressed_ThenDisplayAlert() {
        app.buttons["="].tap()
        XCTAssertTrue(app.alerts["Zéro!"].isHittable)
    }
    
    func testGivenGivenTheUserInterface_WhenTheResetButtonIsPressed_ThenTheTextViewIsReset() {
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["6"].tap()
        app.buttons["7"].tap()
        app.buttons["-"].tap()
        app.buttons["2"].tap()
        app.buttons["1"].tap()
        app.buttons["C"].tap()
        
        let text = app.textViews["Screen"].value as? String
        XCTAssertEqual(text, "")
    }
}
