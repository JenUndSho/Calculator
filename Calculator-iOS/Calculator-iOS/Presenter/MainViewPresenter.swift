//
//  MainViewPresenter.swift
//  Calculator-iOS
//
//  Created by Evhenii Shovkovyi on 15.06.2023.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation

protocol MainViewPresenterDelegate: AnyObject {
    
    func updateLabels(withInputText inputLabelText: String, withOutputText outputLabelText: String)
    func getInputLabelText() -> String
    func getOutputLabelText() -> String
    func setInputLabelText(text: String)
    func updateViewAccordingToTheme(isDark: Bool)
    func showInvalidInputAlert(withTitle: String, withMessage: String)
}

protocol MainViewPresenterProtocol {
    func buttonDidTap(with type: BasicButtonType)
    func themeDidChanged(isDark: Bool)
    init(algorithmExecutor: PolishNotationAlgorithm)
}

class MainViewPresenter: MainViewPresenterProtocol {
    
    private weak var delegate: MainViewPresenterDelegate?
    private var inputText: String = ""
    private var outputText: String = ""
    private var operators: [BasicButtonType] = [.delete, .multiply, .plus, .minus]
    private let algorithmExecutor: PolishNotationAlgorithm
    private var lastTappedButtonType: BasicButtonType = .allClear
    
    required init(algorithmExecutor: PolishNotationAlgorithm) {
        self.algorithmExecutor = algorithmExecutor
    }
    
    func setMainViewPresenterDelegate(mainViewPresenterDelegate: MainViewPresenterDelegate) {
        delegate = mainViewPresenterDelegate
    }
    
    func buttonDidTap(with type: BasicButtonType) {
        
        if operators.contains(type) && operators.contains(lastTappedButtonType) {
            delegate?.showInvalidInputAlert(withTitle: "Invalid input", withMessage: "Please do not enter operators one by one.")
            return
        }
        
        switch type {
        case .allClear:
            inputText = ""
            outputText = "0"
        case .erase:
            if inputText != "" {
                inputText.removeLast()
            }
        case .equals:
            if operators.contains(lastTappedButtonType) {
                delegate?.showInvalidInputAlert(withTitle: "Invalid input", withMessage: "Operator cannot be the last character.")
                return
            }
            
            if inputText != "" {
                let res = algorithmExecutor.evaluateExpression(expression: inputText)
                switch res {
                case .success(let result):
                    outputText = "=" + result
                case .failure(let error):
                    delegate?.showInvalidInputAlert(withTitle: "Invalid input", withMessage: error.rawValue)
                }
                
            }
        default:
            if lastTappedButtonType == .equals &&
                [BasicButtonType.delete, BasicButtonType.multiply, BasicButtonType.plus, BasicButtonType.minus].contains(type) {
                inputText = outputText.dropFirst().lowercased() + type.rawValue
            } else {
                inputText += type.rawValue
            }
        }
        
        delegate?.updateLabels(withInputText: inputText.replacingOccurrences(of: " ", with: ""),
                               withOutputText: outputText.replacingOccurrences(of: " ", with: ""))
        lastTappedButtonType = type
    }
    
    func themeDidChanged(isDark: Bool) {
        delegate?.updateViewAccordingToTheme(isDark: isDark)
    }
    
}
