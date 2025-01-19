//
//  BasicStackView.swift
//  Calculator-iOS
//
//  Created by Evhenii Shovkovyi on 11.06.2023.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

class BasicStackView: UIStackView {

    convenience init(_ parentView: UIStackView, _ axis: NSLayoutConstraint.Axis, _ distribution: Distribution, _ alignment: Alignment, _ spacing: CGFloat, _ bgColor: UIColor) {
        self.init(axis, distribution, alignment, spacing, bgColor)
        parentView.addArrangedSubview(self)
    }
    
    init(_ axis: NSLayoutConstraint.Axis, _ distribution: Distribution, _ alignment: Alignment, _ spacing: CGFloat, _ bgColor: UIColor) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        self.backgroundColor = bgColor
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
