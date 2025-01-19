//
//  CalculatoriOSUISnapshotTests.swift
//  Calculator-iOSUITests
//
//  Created by Evhenii Shovkovyi on 24.07.2023.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

@testable import Calculator_iOS
import FBSnapshotTestCase
import XCTest

final class CalculatoriOSUISnapshotTests: FBSnapshotTestCase {
    
    var controller: MainViewController!
    
    override func setUp() {
        super.setUp()
//        recordMode = true
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        controller = MainViewController()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        controller = nil
    }
    
    func testMainControllersView() {
        FBSnapshotVerifyView(controller.view)
    }
    
    func testMainViewController() {
        FBSnapshotVerifyViewController(controller)
    }
    
}
