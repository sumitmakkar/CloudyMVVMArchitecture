//
//  DayViewViewModelTests.swift
//  CloudyTests
//
//  Created by Sumit Makkar on 17/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class DayViewViewModelTests: XCTestCase
{
    var viewModel: DayViewViewModel!
    
    override func setUp()
    {
        super.setUp()
        
        let data                     = loadStubFromBundle(withName: "darksky", extensionString: "json")
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
        self.viewModel               = DayViewViewModel(weatherData: weatherData)
    }

    override func tearDown()
    {
        super.tearDown()
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
    }

    func testDate()
    {
//        let dateFormatter        = DateFormatter()
//        dateFormatter.dateFormat = "EEE, MMMM d"
//        let todaysDate           = dateFormatter.string(from: Date())
//        XCTAssertEqual(self.viewModel.date , todaysDate)//"Tue, September 17"
        
        XCTAssertEqual(self.viewModel.date , "Tue, September 17")
    }
    
    func testTime_TwelveHour()
    {
        let timeNotation: TimeNotation = .twelveHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        XCTAssertEqual(viewModel.time, "11:39 AM")
    }
    
    func testTime_TwentyFourHour()
    {
        let timeNotation: TimeNotation = .twentyFourHour
        UserDefaults.standard.set(timeNotation.rawValue , forKey: UserDefaultsKeys.timeNotation)
        XCTAssertEqual(self.viewModel.time , "11:39")
    }
    
    func testSummary()
    {
        XCTAssertEqual(self.viewModel.summary , "Partly Cloudy")
    }
    
    func testTemprature_Fahrenheit()
    {
        let tempratureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(tempratureNotation.rawValue , forKey: UserDefaultsKeys.temperatureNotation)
        XCTAssertEqual(self.viewModel.temperature , "60.5 °F")
    }
    
    func testTemprature_Celsius()
    {
        let tempratureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(tempratureNotation.rawValue , forKey: UserDefaultsKeys.temperatureNotation)
        XCTAssertEqual(self.viewModel.temperature , "15.8 °C")
    }
    
    func testwindSpeed_Imperial()
    {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue , forKey: UserDefaultsKeys.unitsNotation)
        XCTAssertEqual(self.viewModel.windSpeed , "4 MPH")
    }
    
    func testWindSpeed_Metric()
    {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue , forKey: UserDefaultsKeys.unitsNotation)
        XCTAssertEqual(self.viewModel.windSpeed , "6 KPH")
    }
    
    func testImage()
    {
        let viewModelImage     = viewModel.image
        let imageDataViewModel = (viewModelImage!.pngData())!
        let imageDataReference = (UIImage(named: "cloudy")!.pngData())!
        
        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage!.size.width, 236.0)
        XCTAssertEqual(viewModelImage!.size.height, 172.0)
        XCTAssertEqual(imageDataViewModel, imageDataReference)
    }
}
