//
//  PolishNotationAlgorithm.swift
//  Calculator-iOS
//
//  Created by Evhenii Shovkovyi on 15.06.2023.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation

enum Operators: String {
    case plus = "+"
    case minus = "-"
    case delete = "/"
    case multiply = "*"
    case undefined = "#"
}

enum InputError: String, Error {
    case unexpectedOperation = "Unexpected operation."
    case unexpectedValues = "Unexpected values."
    case emptyResult = "Empty result."
}

protocol PolishNotationAlgorithmProtocol {
    func transformToRPN(tokens: [String]) -> [String]
    func operate(action: Operators, operand1: Double, operand2: Double) -> Result<Double, InputError>
    func evaluateExpression(expression: String) -> Result<String, InputError>
}

class PolishNotationAlgorithm: NSObject, PolishNotationAlgorithmProtocol {
    
    private let operators = [
        "+": 1,
        "-": 1,
        "*": 2,
        "/": 2
    ]
    
    func transformToRPN(tokens: [String]) -> [String] {
        var rpn: [String] = []
        var stack: [String] = []
        
        for token in tokens {
            if let operand1 = operators[token] {
                for action in stack.reversed() {
                    if let operand2 = operators[action] {
                        if operand1 <= operand2 {
                            rpn += [stack.removeLast()]
                            continue
                        }
                    }
                    break
                }
                stack += [token]
            } else {
                rpn += [token]
            }
        }
        
        return rpn + stack.reversed()
    }
    
    func operate(action: Operators, operand1: Double, operand2: Double) -> Result<Double, InputError> {
        switch action {
        case .plus:
            return .success(operand1 + operand2)
        case .minus:
            return .success(operand1 - operand2)
        case .multiply:
            return .success(operand1 * operand2)
        case .delete:
            return .success(operand1 / operand2)
        default:
            return .failure(.unexpectedOperation)
        }
    }
    
    func evaluateExpression(expression: String) -> Result<String, InputError> {
        let operators = expression.split { $0 == " " }.map(String.init)
        let rpnExpression = transformToRPN(tokens: operators)
        var stack: [Double] = []
        
        for expression in rpnExpression {
            if let num = Double(expression) {
                stack.append(num)
            } else {
                let action: Operators = {
                    switch expression {
                    case "+":
                        return .plus
                    case "-":
                        return .minus
                    case "*":
                        return .multiply
                    case "/":
                        return .delete
                    default:
                        return .undefined
                    }
                }()
                guard let postNum = stack.popLast(), let prevNum = stack.popLast() else {
                    return .failure(.unexpectedValues)
                }
                let operationResult = operate(action: action, operand1: prevNum, operand2: postNum)
                switch operationResult {
                case .success(let result):
                    stack.append(result)
                case .failure(let error):
                    return .failure(error)
                }
                
            }
        }
        
        if let result = stack.last {
            return .success(String(result))
        } else {
            return .failure(.emptyResult)
        }
    }

}
