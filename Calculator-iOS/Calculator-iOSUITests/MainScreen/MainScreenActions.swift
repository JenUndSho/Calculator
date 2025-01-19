//
//  MainScreenActions.swift
//  Calculator-iOSUITests
//
//  Created by Evhenii Shovkovyi on 23.07.2023.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

@testable import Calculator_iOS
import XCTest

class MainScreenActions {
    
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func tapZero() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.zeroButton))
        return self
    }
    
    func tapDot() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.dotButton))
        return self
    }
    
    func tapOne() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.oneButton))
        return self
    }
    
    func tapTwo() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.twoButton))
        return self
    }
    
    func tapThree() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.threeButton))
        return self
    }
    
    func tapFour() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.fourButton))
        return self
    }
    
    func tapFive() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.fiveButton))
        return self
    }
    
    func tapSix() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.sixButton))
        return self
    }
    
    func tapSeven() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.sevenButton))
        return self
    }
    
    func tapEight() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.eightButton))
        return self
    }
    
    func tapNine() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.nineButton))
        return self
    }
    
    func tapErase() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.eraseButton))
        return self
    }
    
    func tapAllClear() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.allClearButton))
        return self
    }
    
    func tapDelete() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.divisionButton))
        return self
    }
    
    func tapMultiply() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.multiplyButton))
        return self
    }
    
    func tapMinus() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.minusButton))
        return self
    }
    
    func tapPlus() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.plusButton))
        return self
    }
    
    func tapEquals() -> MainScreenActions {
        tapButton(btnType: .mainScreen(.equalsButton))
        return self
    }
    
    func tapButton(btnType: AccessibilityIdentifiers) {
        app.buttons[btnType.value].tap()
    }
    
}
