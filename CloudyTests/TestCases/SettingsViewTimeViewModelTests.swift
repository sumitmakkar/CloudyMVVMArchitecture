//
//  SettingsViewTimeViewModelTests.swift
//  CloudyTests
//
//  Created by Sumit Makkar on 16/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewTimeViewModelTests: XCTestCase
{

    override func setUp()
    {
        super.setUp()
    }

    override func tearDown()
    {
        super.tearDown()
        
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
    }

    
    func testText_TwelveHour()
    {
        let viewModel = SettingsViewTimeViewModel(timeNotation: .twelveHour)
        XCTAssertEqual(viewModel.text, "12 Hour")
    }

    func testText_TwentyFourHour()
    {
         let viewModel = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)
         XCTAssertEqual(viewModel.text, "24 Hour")
    }

    // MARK: - Tests for Accessory Type
    func testAccessoryType_TwelveHour_TwelveHour()
    {
        let timeNotation: TimeNotation = .twelveHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        let viewModel                  = SettingsViewTimeViewModel(timeNotation: .twelveHour)
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.checkmark)
    }
    
    func testAccessoryType_TwentyFourHour_TwentyFourHour()
    {
        let timeNotation: TimeNotation = .twentyFourHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        let viewModel                  = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.checkmark)
    }
    
    func testAccessoryType_TwelveHour_TwentyFourHour()
    {
        let timeNotation: TimeNotation = .twelveHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        let viewModel                  = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.none)
    }
    
    func testAccessoryType_TwentyFourHour_TwelveHour()
    {
        let timeNotation: TimeNotation = .twentyFourHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        let viewModel                  = SettingsViewTimeViewModel(timeNotation: .twelveHour)
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.none)
    }
}
