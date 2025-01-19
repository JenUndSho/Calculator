//
//  BasicButton.swift
//  Calculator-iOS
//
//  Created by Evhenii Shovkovyi on 11.06.2023.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

enum BasicButtonType: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case dot = "."
    case allClear = "Ac"
    case erase = "<"
    case delete = " / "
    case multiply = " * "
    case minus = " - "
    case plus = " + "
    case equals = " ="
}

class BasicButton: UIButton {
    
    var type: BasicButtonType
    
    init(titleTxt: String, titleColor: UIColor, bgColor: UIColor, type: BasicButtonType, id: AccessibilityIdentifiers) {
        self.type = type
        super.init(frame: .zero)
        
        accessibilityIdentifier = id.value
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(titleTxt, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = bgColor
        titleLabel?.font = .systemFont(ofSize: 30, weight: .semibold)
        clipsToBounds = true
        layer.cornerRadius = 16
        
    }
    
    convenience init(imageButtonName: String, titleColor: UIColor, bgColor: UIColor, type: BasicButtonType, id: AccessibilityIdentifiers) {
        self.init(titleTxt: "", titleColor: titleColor, bgColor: bgColor, type: type, id: id)
        setImage(UIImage(named: imageButtonName), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("No coder")
    }

}
