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
    
    let calculate = Calculate()
    
    func testGivenEmptyStringNumber_WhenAddingNumber_ThenGetThisNumber() {
        calculate.addNewNumber(1)
        let stringNumber = calculate.getStringNumber()
        XCTAssertEqual(stringNumber[0], "1")
    }
    
    func testGivenEmptyStringNumber_WhenAddingManyNumber_ThenGetThisNumbers() {
        calculate.addNewNumber(1)
        calculate.addNewNumber(2)
        let stringNumber = calculate.getStringNumber()
        XCTAssertEqual(stringNumber[0], "12")
    }
    
    func testGivenEmptyOperators_WhenAddingPlusOperator_ThenOperatorPlusAdd() {
        calculate.addOperators("+")
        let operators = calculate.getOperators()
        XCTAssertEqual(operators[0], "+")
    }
    
    func testGivenEmptyOperators_WhenAddingMinusOperator_ThenOperatorMinusAdd() {
        calculate.addOperators("-")
        let operators = calculate.getOperators()
        XCTAssertEqual(operators[1], "-")
    }
    
    func testGivenTotalIsNull_WhenSubtractionOperationAdded_ThenTheOperationGivesAResult() {
        calculate.addNewNumber(3)
        calculate.addNewNumber(4)
        calculate.addOperators("-")
        calculate.addStringNumber("")
        calculate.addNewNumber(1)
        calculate.addNewNumber(2)
        let total = calculate.calculateTotal()
        XCTAssertEqual(total, 22)
    }
    
    func testGivenTotalIsNull_WhenAdditionOperationAdded_ThenTheOperationGivesAResult() {
        calculate.addNewNumber(3)
        calculate.addNewNumber(4)
        calculate.addOperators("+")
        calculate.addStringNumber("")
        calculate.addNewNumber(1)
        calculate.addNewNumber(2)
        let total = calculate.calculateTotal()
        XCTAssertEqual(total, 46)
    }
    
    func testGivenTotalIsNull_WhenMultipleOperationAdded_ThenTheOperationGivesAResult() {
        calculate.addNewNumber(3)
        calculate.addNewNumber(4)
        calculate.addOperators("+")
        calculate.addStringNumber("")
        calculate.addNewNumber(1)
        calculate.addNewNumber(2)
        calculate.addOperators("-")
        calculate.addStringNumber("")
        calculate.addNewNumber(3)
        let total = calculate.calculateTotal()
        XCTAssertEqual(total, 43)
    }
    
    func testGivenTheOperationIsComplete_WhenTheMethodCleanIsCall_ThenAllParameterAreReset() {
        calculate.addNewNumber(3)
        calculate.addNewNumber(4)
        calculate.addOperators("+")
        calculate.addStringNumber("")
        calculate.addNewNumber(1)
        calculate.addNewNumber(2)
        calculate.clear()
        let stringNumber = calculate.getStringNumber()
        let operators = calculate.getOperators()
        XCTAssertTrue(stringNumber[0] == "")
        XCTAssertTrue(operators[0] == "+")
    }
}
