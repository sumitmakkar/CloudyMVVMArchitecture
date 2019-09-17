//
//  SettingsViewUnitsViewModelTests.swift
//  CloudyTests
//
//  Created by Sumit Makkar on 17/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewUnitsViewModelTests: XCTestCase
{
    override func setUp()
    {
        super.setUp()
    }

    override func tearDown()
    {
        super.tearDown()
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
    }
    
    func testText_Imperial()
    {
        let viewModel = SettingsViewUnitsViewModel(unitsNotation: UnitsNotation.imperial)
        XCTAssertEqual(viewModel.text , "Imperial")
    }
    
    func testText_Metric()
    {
        let viewModel = SettingsViewUnitsViewModel(unitsNotation: UnitsNotation.metric)
        XCTAssertEqual(viewModel.text , "Metric")
    }
    
    func testAccessoryType_Imperial_Imperial()
    {
        let unitNotation: UnitsNotation = UnitsNotation.imperial
        UserDefaults.standard.set(unitNotation.rawValue , forKey: UserDefaultsKeys.unitsNotation)
        let viewModel                   = SettingsViewUnitsViewModel(unitsNotation: UnitsNotation.imperial)
        XCTAssertEqual(viewModel.accessoryType , UITableViewCell.AccessoryType.checkmark)
    }
    
    func testAccessoryType_Metric_Metric()
    {
        let unitNotation: UnitsNotation = UnitsNotation.metric
        UserDefaults.standard.set(unitNotation.rawValue , forKey: UserDefaultsKeys.unitsNotation)
        let viewModel                   = SettingsViewUnitsViewModel(unitsNotation: UnitsNotation.metric)
        XCTAssertEqual(viewModel.accessoryType , UITableViewCell.AccessoryType.checkmark)
    }
    
    func testAccessoryType_Imperial_Metric()
    {
        let unitNotation: UnitsNotation = UnitsNotation.imperial
        UserDefaults.standard.set(unitNotation.rawValue , forKey: UserDefaultsKeys.unitsNotation)
        let viewModel                   = SettingsViewUnitsViewModel(unitsNotation: UnitsNotation.metric)
        XCTAssertEqual(viewModel.accessoryType , UITableViewCell.AccessoryType.none)
    }

    func testAccessoryType_Metric_Imperial()
    {
        let unitNotation: UnitsNotation = UnitsNotation.metric
        UserDefaults.standard.set(unitNotation.rawValue , forKey: UserDefaultsKeys.unitsNotation)
        let viewModel                     = SettingsViewUnitsViewModel(unitsNotation: UnitsNotation.imperial)
        XCTAssertEqual(viewModel.accessoryType , UITableViewCell.AccessoryType.none)
    }
}
