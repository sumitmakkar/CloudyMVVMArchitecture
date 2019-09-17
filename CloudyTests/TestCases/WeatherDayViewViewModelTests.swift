//
//  WeatherDayViewViewModelTests.swift
//  CloudyTests
//
//  Created by Sumit Makkar on 17/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class WeatherDayViewViewModelTests: XCTestCase
{
    var viewModel: WeatherDayViewViewModel!
    
    override func setUp()
    {
        super.setUp()
        let data                     = loadStubFromBundle(withName: "darksky", extensionString: "json")
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
        self.viewModel               = WeatherDayViewViewModel(weatherDayData: weatherData.dailyData[5])
    }

    override func tearDown()
    {
        super.tearDown()
        
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
    }
    
    func testDay()
    {
        XCTAssertEqual(self.viewModel.day , "Saturday")
    }
    
    func testDate()
    {
        XCTAssertEqual(self.viewModel.date , "September 21")
    }
    
    func testTemprature_Fahrenheit()
    {
        let tempratureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(tempratureNotation.rawValue , forKey: UserDefaultsKeys.temperatureNotation)
        XCTAssertEqual(self.viewModel.temperature , "55 °F - 86 °F")
    }
    
    func testTemprature_Celsius()
    {
        let tempratureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(tempratureNotation.rawValue , forKey: UserDefaultsKeys.temperatureNotation)
        XCTAssertEqual(self.viewModel.temperature , "13 °C - 30 °C")
    }
    
    func testWindSpeed_Imperial()
    {
        let unitNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitNotation.rawValue , forKey: UserDefaultsKeys.unitsNotation)
        XCTAssertEqual(self.viewModel.windSpeed , "3 MPH")
    }
    
    func testWindSpeed_Metric()
    {
        let unitNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitNotation.rawValue , forKey: UserDefaultsKeys.unitsNotation)
        XCTAssertEqual(self.viewModel.windSpeed , "5 KPH")
    }
    
    func testImage()
    {
        let viewModelImage     = self.viewModel.image
        let imageDataViewModel = (viewModelImage!.pngData())!
        let imageDataReference = ((UIImage(named: "clear-day"))!.pngData())!
        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage!.size.width, 236.0)
        XCTAssertEqual(viewModelImage!.size.height, 236.0)
        XCTAssertEqual(imageDataViewModel, imageDataReference)
    }
}
