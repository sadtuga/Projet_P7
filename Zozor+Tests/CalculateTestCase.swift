//
//  CalculateTestCase.swift
//  CountOnMeTests
//
//  Created by Marques Lucas on 02/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculateTestCase: XCTestCase {

    private let calculate = Calculate()             // Stock the instance of the class Calculate
    private var stringNumber: [String] = [String()] // Stock the operation in a string array
    private var operators: [String] = [String()]    // Stock the operators in a string array

    // Test if adding a number in the StringNumbers array works
    func testGivenEmptyStringNumber_WhenAddingManyNumber_ThenTheseNumbersAreDisplayed() {
        calculate.addNewNumber(1)
        calculate.addNewNumber(2)
        stringNumber = calculate.getStringNumber()
        XCTAssertEqual(stringNumber[0], "12")
    }

    // Test if adding the operator "+" in the operators array works
    func testGivenEmptyOperators_WhenAddingPlusOperator_ThenOperatorPlusAdd() {
        calculate.addOperators("+")
        operators = calculate.getOperators()
        XCTAssertEqual(operators[0], "+")
    }

    // Test if adding the operator "-" in the operators array works
    func testGivenEmptyOperators_WhenAddingMinusOperator_ThenOperatorMinusAdd() {
        calculate.addOperators("-")
        operators = calculate.getOperators()
        XCTAssertEqual(operators[1], "-")
    }
    
    // Test if adding the operator "x" in the operators array works
    func testGivenEmptyOperators_WhenAddingMultipliedOperator_ThenOperatorMultipliedAdd() {
        calculate.addOperators("x")
        operators = calculate.getOperators()
        XCTAssertEqual(operators[1], "x")
    }

    // Test if adding the operator "÷" in the operators array works
    func testGivenEmptyOperators_WhenAddingSplitOperator_ThenOperatorSplitAdd() {
        calculate.addOperators("÷")
        operators = calculate.getOperators()
        XCTAssertEqual(operators[1], "÷")
    }

    // Test if adding a decimal number in the StringNumbers array works
    func testGivenEmptyStringNumber_WhenAddingNumberAndPoint_ThenThisDecimalNumberIsDisplayed() {
        calculate.addNewNumber(1)
        calculate.addPoint()
        calculate.addNewNumber(2)
        stringNumber = calculate.getStringNumber()
        XCTAssertEqual(stringNumber[0], "1.2")
    }

    // Test if the calculateTotal method works
    func testGivenTotalIsNull_WhenMultipleOperationAdded_ThenTheOperationGivesAResult() {
        calculate.addNewNumber(3)
        calculate.addPoint()
        calculate.addNewNumber(4)
        calculate.addOperators("+")
        calculate.addStringNumber("")
        calculate.addNewNumber(1)
        calculate.addNewNumber(2)
        calculate.addOperators("-")
        calculate.addStringNumber("")
        calculate.addNewNumber(3)
        calculate.addOperators("x")
        calculate.addStringNumber("")
        calculate.addNewNumber(9)
        calculate.addOperators("÷")
        calculate.addStringNumber("")
        calculate.addNewNumber(6)

        let total = calculate.calculateTotal()
        XCTAssertEqual(total, 18.6)
    }

    // Test if the clear method works
    func testGivenTheOperationIsComplete_WhenTheMethodCleanIsCall_ThenAllParameterAreReset() {
        calculate.addNewNumber(3)
        calculate.addNewNumber(4)
        calculate.addOperators("+")
        calculate.addStringNumber("")
        calculate.addNewNumber(1)
        calculate.addNewNumber(2)
        calculate.clear()
        stringNumber = calculate.getStringNumber()
        operators = calculate.getOperators()
        XCTAssertTrue(stringNumber[0] == "")
        XCTAssertTrue(operators[0] == "+")
    }
}
