//
//  SettingsViewUnitsViewModel.swift
//  Cloudy
//
//  Created by Sumit Makkar on 15/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import UIKit


struct SettingsViewTemperatureViewModel
{
    //MARK: - Properties
    let tempratureNotation: TemperatureNotation
    
    var text: String
    {
        switch self.tempratureNotation
        {
            case .celsius:
                return "Celcius"
            case .fahrenheit:
                return "Fahrenheit"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType
    {
        if UserDefaults.temperatureNotation() == self.tempratureNotation
        {
            return .checkmark
        }
        else
        {
            return .none
        }
    }
}


extension SettingsViewTemperatureViewModel: SettingsRepresentable
{
    
}
