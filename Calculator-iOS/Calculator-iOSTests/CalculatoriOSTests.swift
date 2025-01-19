//
//  CalculatoriOSTests.swift
//  Calculator-iOSTests
//
//  Created by Serhii Liamtsev on 4/9/22.
//

@testable import Calculator_iOS
import XCTest

final class CalculatoriOSTests: XCTestCase {
    
    let algorithmExecutor = PolishNotationAlgorithm()
    var controller: MainViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        controller = MainViewController()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        controller = nil
    }

    func testExample() throws {
        XCTAssert(true, "The true test")
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }
    
    func testTransformToRPNFailed() throws {
        let inputExpression = "18 * 9 + 23 / 2 - 8".split { $0 == " " }.map(String.init)
        let expectedExpression = "18 23 - 9 8 / + 2 -"
        
        XCTAssertNotEqual(algorithmExecutor.transformToRPN(tokens: inputExpression).joined(separator: " "),
                          expectedExpression,
                          "PRN expression is valid")
    }
    
    func testTransformToRPNSuccessful() throws {
        let inputExpression = "18 * 9 + 23 / 2 - 8".split { $0 == " " }.map(String.init)
        let expectedExpression = "18 9 * 23 2 / + 8 -"
        
        XCTAssertEqual(algorithmExecutor.transformToRPN(tokens: inputExpression).joined(separator: " "),
                       expectedExpression,
                       "PRN expression is invalid")
    }
    
    func testOperateSuccessful() throws {
        let o1 = 15.3
        let o2 = 3.0
        let result = algorithmExecutor.operate(action: Operators.multiply, operand1: o1, operand2: o2)
        
        switch result {
        case .success(let success):
            XCTAssertEqual(success, o1 * o2, "Operate function logic failed")
        case .failure:
            print("Failed assertion")
        }
    }
    
    func testOperateFailed() throws {
        let o1 = 15.3
        let o2 = 11.32
        let expectedValue = 5.1
        let result = algorithmExecutor.operate(action: Operators.multiply, operand1: o1, operand2: o2)
        
        switch result {
        case .success(let success):
            XCTAssertNotEqual(success, expectedValue, "Operate function logic succeded")
        case .failure:
            print("Failed assertion")
        }
        
    }
    
    func testEvaluateExpressionSuccessful() throws {
        let expression = "14 + 12.82 / 6 * 3.3 - 1"
        let expectedValue = (String) (14 + 12.82 / 6 * 3.3 - 1)
        let result = algorithmExecutor.evaluateExpression(expression: expression)
        switch result {
        case .success(let success):
            XCTAssertEqual(success, expectedValue)
        case .failure:
            print("Failed assertion")
        }
    }
    
    func testEvaluateExpressionFailed() throws {
        let expression = "14 / 12.82 * 6 * 3.3 + 1"
        let expectedValue = (String) (14 + 12.82 / 6 * 3.3 - 1)
        
        let result = algorithmExecutor.evaluateExpression(expression: expression)
        switch result {
        case .success(let success):
            XCTAssertNotEqual(success, expectedValue)
        case .failure:
            print("Failed assertion")
        }
    }

}
