//
//  WeatherDayViewViewModel.swift
//  Cloudy
//
//  Created by Sumit Makkar on 15/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import UIKit


struct WeatherDayViewViewModel
{
    //MARK: - Properties
    let weatherDayData: WeatherDayData
    
    let dateFormatter = DateFormatter()
    
    var day: String
    {
        self.dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: weatherDayData.time)
    }
    
    var date: String
    {
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: weatherDayData.time)
    }
    
    var temperature: String
    {
        let min            = format(temperature: weatherDayData.temperatureMin)
        let max            = format(temperature: weatherDayData.temperatureMax)
        return "\(min) - \(max)"
    }
    
    var windSpeed: String
    {
        let windSpeed = weatherDayData.windSpeed
        
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
        return UIImage.imageForIcon(withName: weatherDayData.icon)
    }
    
    
    private func format(temperature: Double) -> String
    {
        switch UserDefaults.temperatureNotation()
        {
        case .fahrenheit:
            return String(format: "%.0f °F", temperature)
        case .celsius:
            return String(format: "%.0f °C", temperature.toCelcius())
        }
    }
}


extension WeatherDayViewViewModel: WeatherDayRepresentable
{
    
}
