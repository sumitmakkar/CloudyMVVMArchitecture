//
//  WeekViewViewModelTests.swift
//  CloudyTests
//
//  Created by Sumit Makkar on 17/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class WeekViewViewModelTests: XCTestCase
{
    var viewModel: WeekViewViewModel!
    
    override func setUp()
    {
        super.setUp()
        let data                     = loadStubFromBundle(withName: "darksky", extensionString: "json")
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
        self.viewModel               = WeekViewViewModel(weatherData: weatherData.dailyData)
    }

    override func tearDown()
    {
        super.tearDown()
    }
    
    func testNumberOfSections()
    {
        XCTAssertEqual(self.viewModel.numberOfSections , 1)
    }
    
    func testNumberOfDays()
    {
        XCTAssertEqual(self.viewModel.weatherData.count , 8)
    }
    
    func testViewModelForIndex()
    {
        let weatherDayViewViewModel = self.viewModel.viewModel(for: 5)
        XCTAssertEqual(weatherDayViewViewModel.day  , "Saturday")
        XCTAssertEqual(weatherDayViewViewModel.date , "September 21")
    }
}
