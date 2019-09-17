//
//  SettingsViewTemperatureViewModelTests.swift
//  CloudyTests
//
//  Created by Sumit Makkar on 17/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewTemperatureViewModelTests: XCTestCase
{
    override func setUp()
    {
        super.setUp()
    }

    override func tearDown()
    {
        super.tearDown()
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
    }
    
    func testText_Celcius()
    {
        let viewModel = SettingsViewTemperatureViewModel(tempratureNotation: TemperatureNotation.celsius)
        XCTAssertEqual(viewModel.text , "Celcius")
    }
    
    func testText_Fahrenheit()
    {
        let viewModel = SettingsViewTemperatureViewModel(tempratureNotation: TemperatureNotation.fahrenheit)
        XCTAssertEqual(viewModel.text , "Fahrenheit")
    }
    
    func testAccessoryType_Celcius_Celcius()
    {
        let tempretureNotation: TemperatureNotation = TemperatureNotation.celsius
        UserDefaults.standard.set(tempretureNotation.rawValue , forKey: UserDefaultsKeys.temperatureNotation)
        let viewModel                               = SettingsViewTemperatureViewModel(tempratureNotation: TemperatureNotation.celsius)
        XCTAssertEqual(viewModel.accessoryType , UITableViewCell.AccessoryType.checkmark)
    }
    
    func testAccessoryType_Fahrenheit_Fahrenheit()
    {
        let tempratureNotation: TemperatureNotation = TemperatureNotation.fahrenheit
        UserDefaults.standard.set(tempratureNotation.rawValue , forKey: UserDefaultsKeys.temperatureNotation)
        let viewModel                               = SettingsViewTemperatureViewModel(tempratureNotation: TemperatureNotation.fahrenheit)
        XCTAssertEqual(viewModel.accessoryType , UITableViewCell.AccessoryType.checkmark)
    }
    
    func testAccessoryType_Celcius_Fahrenheit()
    {
        let tempratureNotation: TemperatureNotation = TemperatureNotation.celsius
        UserDefaults.standard.set(tempratureNotation.rawValue , forKey: UserDefaultsKeys.temperatureNotation)
        let viewModel                               = SettingsViewTemperatureViewModel(tempratureNotation: TemperatureNotation.fahrenheit)
        XCTAssertEqual(viewModel.accessoryType , UITableViewCell.AccessoryType.none)
    }
    
    func testAccessoryType_Fahrenheit_Celcius()
    {
        let tempratureNotation: TemperatureNotation = TemperatureNotation.fahrenheit
        UserDefaults.standard.set(tempratureNotation.rawValue , forKey: UserDefaultsKeys.temperatureNotation)
        let viewModel                               = SettingsViewTemperatureViewModel(tempratureNotation: TemperatureNotation.celsius)
        XCTAssertEqual(viewModel.accessoryType , UITableViewCell.AccessoryType.none)
    }
}
