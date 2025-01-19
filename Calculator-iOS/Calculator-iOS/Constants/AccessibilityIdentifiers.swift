//
//  AccessibilityIdentifiers.swift
//  Calculator-iOS
//
//  Created by Evhenii Shovkovyi on 22.07.2023.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation

enum AccessibilityIdentifiers {
    
    enum MainScreen: String, CaseIterable {
        case outputLabel = "main-screen.output.label"
        case inputLabel = "main-screen.input.label"
        
        case divisionButton = "main-screen.division.button"
        case multiplyButton = "main-screen.multiply.button"
        case minusButton = "main-screen.minus.button"
        case plusButton = "main-screen.plus.button"
        case equalsButton = "main-screen.equals.button"
        case allClearButton = "main-screen.allClear.button"
        case eraseButton = "main-screen.erase.button"
        
        case dotButton = "main-screen.dot.button"
        case zeroButton = "main-screen.zero.button"
        case oneButton = "main-screen.one.button"
        case twoButton = "main-screen.two.button"
        case threeButton = "main-screen.three.button"
        case fourButton = "main-screen.four.button"
        case fiveButton = "main-screen.five.button"
        case sixButton = "main-screen.six.button"
        case sevenButton = "main-screen.seven.button"
        case eightButton = "main-screen.eight.button"
        case nineButton = "main-screen.nine.button"
    }
    
    case mainScreen(_ value: MainScreen)
    
    var value: String {
        switch self {
        case .mainScreen(let val):
            return val.rawValue
        }
    }
    
}
