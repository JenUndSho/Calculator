//
//  Calculator.swift
//  Calculator-iOS
//
//  Created by Evhenii Shovkovyi on 15.06.2023.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation

struct Calculator {
    
    var inputText: String
    var outputText: String
    
    init(inputText: String = "", outputText: String = "") {
        self.inputText = inputText
        self.outputText = outputText
    }
}
