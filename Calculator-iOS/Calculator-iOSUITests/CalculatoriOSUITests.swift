//
//  CalculatoriOSUITests.swift
//  Calculator-iOSUITests
//
//  Created by Serhii Liamtsev on 4/9/22.
//  Copyright © 2022 Grid Dynamics. All rights reserved.
//

import XCTest

@testable import Calculator_iOS

final class CalculatoriOSUITests: XCTestCase {
    
    let app = XCUIApplication()
    var actions = MainScreenActions(app: XCUIApplication())
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        actions = MainScreenActions(app: app)
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testInputFieldCorrespondsInputSequenceTapping() throws {
        _ = actions.tapSeven()
            .tapNine()
            .tapMinus()
            .tapSix()
        
        let expectedResult = "79-6"
        XCTAssertTrue(app.staticTexts[AccessibilityIdentifiers.mainScreen(.inputLabel).value].label == expectedResult)
    }
    
    func testExecuteValidExpression() throws {
        _ = actions.tapSix()
            .tapDot()
            .tapNine()
            .tapTwo()
            .tapMultiply()
            .tapFive()
            .tapDot()
            .tapTwo()
            .tapEquals()
        
        let expectedResult = "=35.984"
        XCTAssertTrue(app.staticTexts[AccessibilityIdentifiers.mainScreen(.outputLabel).value].label == expectedResult)
        
    }
    
    func testAlertIsDisplayedForInvalidInput() {
        _ = actions.tapNine()
            .tapMinus()
            .tapMultiply()
        
        let expectedErrorText = "Please do not enter operators one by one."
        
        XCTAssertTrue(app.staticTexts[expectedErrorText].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
