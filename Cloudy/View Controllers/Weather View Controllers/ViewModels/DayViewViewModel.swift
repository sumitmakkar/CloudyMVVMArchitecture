//
//  DayViewViewModel.swift
//  Cloudy
//
//  Created by Sumit Makkar on 14/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import UIKit


struct DayViewViewModel
{
    //MARK: - Properties
    let weatherData: WeatherData
    
    private let dateFormatter = DateFormatter()
    
    var date: String
    {
        self.dateFormatter.dateFormat = "EEE, MMMM d"
        return dateFormatter.string(from: weatherData.time)
    }
    
    var time: String
    {
        self.dateFormatter.dateFormat = UserDefaults.timeNotation().timeFormat
        return dateFormatter.string(from: weatherData.time)
    }
    
    var summary: String
    {
        return weatherData.summary
    }
    
    var temperature: String
    {
        let temperature = weatherData.temperature
        switch UserDefaults.temperatureNotation()
        {
            case .fahrenheit:
                return String(format: "%.1f °F", temperature)
            case .celsius:
                return String(format: "%.1f °C", temperature.toCelcius())
        }
    }
    
    var windSpeed: String
    {
        let windSpeed = weatherData.windSpeed
        switch UserDefaults.unitsNotation()
        {
            case .imperial:
                return String(format: "%.f MPH", windSpeed)
            case .metric:
                return String(format: "%.f KPH", windSpeed.toKPH())
        }
    }
    
    var image: UIImage?
    {
        return UIImage.imageForIcon(withName: weatherData.icon)
    }
}
