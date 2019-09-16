//
//  WeekViewViewModel.swift
//  Cloudy
//
//  Created by Sumit Makkar on 14/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import UIKit


struct WeekViewViewModel
{
    let weatherData: [WeatherDayData]
    
    let dateFormatter = DateFormatter()
    
    var numberOfSections: Int
    {
        return 1
    }
    
    var numberOfDays: Int
    {
        return self.weatherData.count
    }
    
    func viewModel(for index: Int) -> WeatherDayViewViewModel
    {
        return WeatherDayViewViewModel(weatherDayData: weatherData[index])
    }
}
