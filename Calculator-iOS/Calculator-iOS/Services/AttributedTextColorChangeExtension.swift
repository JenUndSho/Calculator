//
//  AttributedTextColorChangeExtension.swift
//  Calculator-iOS
//
//  Created by Evhenii Shovkovyi on 15.06.2023.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func textColorChange (fullText: String, charArrayToChange: [Character] ) {
        var indexOfOperand = 0
        var indexList = Set<Int>()
        fullText.forEach { char in
            if charArrayToChange.contains(char) {
                indexList.insert(indexOfOperand)
            }
            indexOfOperand += 1
        }
        let attribute = NSMutableAttributedString(string: fullText)
        for index in indexList {
            let range = NSRange(location: index, length: 1)
            attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: range)
            self.attributedText = attribute
        }
    }
    
}
