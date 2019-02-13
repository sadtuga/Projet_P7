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
        print(calculate.getOperators())
        calculate.addNewNumber(1)
        calculate.operators("+")
        operators = calculate.getOperators()
        XCTAssertEqual(operators[1], "+")
    }

    // Test if adding the operator "-" in the operators array works
    func testGivenEmptyOperators_WhenAddingMinusOperator_ThenOperatorMinusAdd() {
        calculate.addNewNumber(1)
        calculate.operators("-")
        operators = calculate.getOperators()
        XCTAssertEqual(operators[1], "-")
    }
    
    // Test if adding the operator "x" in the operators array works
    func testGivenEmptyOperators_WhenAddingMultipliedOperator_ThenOperatorMultipliedAdd() {
        calculate.addNewNumber(1)
        calculate.operators("x")
        operators = calculate.getOperators()
        XCTAssertEqual(operators[1], "x")
    }

    // Test if adding the operator "÷" in the operators array works
    func testGivenEmptyOperators_WhenAddingSplitOperator_ThenOperatorSplitAdd() {
        calculate.addNewNumber(1)
        calculate.operators("÷")
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
    func testNumberOne_GivenTotalIsNull_WhenMultipleOperationAdded_ThenTheOperationGivesAResult() {
        calculate.addNewNumber(3)
        calculate.addPoint()
        calculate.addNewNumber(4)
        calculate.operators("+")
        calculate.addNewNumber(1)
        calculate.addNewNumber(2)
        calculate.operators("-")
        calculate.addNewNumber(3)
        calculate.operators("x")
        calculate.addNewNumber(9)
        calculate.operators("÷")
        calculate.addNewNumber(6)

        let total = calculate.calculateTotal()
        XCTAssertEqual(total, 10.9)
    }
    
    // Test if the calculateTotal method works
    func testNumberTwoo_GivenTotalIsNull_WhenMultipleOperationAdded_ThenTheOperationGivesAResult() {
        calculate.addNewNumber(100)
        calculate.operators("÷")
        calculate.addNewNumber(2)
        calculate.operators("x")
        calculate.addNewNumber(2)
        
        let total = calculate.calculateTotal()
        XCTAssertEqual(total, 100)
    }
    
    // Test if the calculateTotal method works
    func testNumberThree_GivenTotalIsNull_WhenMultipleOperationAdded_ThenTheOperationGivesAResult() {
        calculate.addNewNumber(100)
        calculate.operators("x")
        calculate.addNewNumber(2)
        calculate.operators("÷")
        calculate.addNewNumber(2)
        
        let total = calculate.calculateTotal()
        XCTAssertEqual(total, 100)
    }
    
    // Test if the calculateTotal method works
    func testNumberFour_GivenTotalIsNull_WhenMultipleOperationAdded_ThenTheOperationGivesAResult() {
        calculate.addNewNumber(3)
        calculate.operators("+")
        calculate.addNewNumber(100)
        calculate.operators("÷")
        calculate.addNewNumber(2)
        calculate.operators("x")
        calculate.addNewNumber(2)
        
        let total = calculate.calculateTotal()
        XCTAssertEqual(total, 103)
    }
    
    // Test if the calculateTotal method works
    func testNumberFive_GivenTotalIsNull_WhenMultipleOperationAdded_ThenTheOperationGivesAResult() {
        calculate.addNewNumber(100)
        calculate.operators("÷")
        calculate.addNewNumber(2)
        calculate.operators("x")
        calculate.addNewNumber(2)
        calculate.operators("+")
        calculate.addNewNumber(3)
        
        let total = calculate.calculateTotal()
        XCTAssertEqual(total, 103)
    }
    
    // Test if the calculateTotal method works
    func testNumberSix_GivenTotalIsNull_WhenMultipleOperationAdded_ThenTheOperationGivesAResult() {
        calculate.addNewNumber(3)
        calculate.operators("+")
        calculate.addNewNumber(100)
        calculate.operators("÷")
        calculate.addNewNumber(25)
        calculate.operators("+")
        calculate.addNewNumber(2)
        calculate.operators("x")
        calculate.addNewNumber(2)
        calculate.operators("-")
        calculate.addNewNumber(6)
        
        let total = calculate.calculateTotal()
        XCTAssertEqual(total, 5)
    }

    // Test if the clear method works
    func testGivenTheOperationIsComplete_WhenTheMethodCleanIsCall_ThenAllParameterAreReset() {
        calculate.addNewNumber(3)
        calculate.addNewNumber(4)
        calculate.operators("+")
        calculate.addNewNumber(1)
        calculate.addNewNumber(2)
        calculate.clear()
        stringNumber = calculate.getStringNumber()
        operators = calculate.getOperators()
        XCTAssertTrue(stringNumber[0] == "")
        XCTAssertTrue(operators[0] == "+")
    }
    
    
}
