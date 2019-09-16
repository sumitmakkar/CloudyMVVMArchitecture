//
//  SettingsViewUnitsViewModel.swift
//  Cloudy
//
//  Created by Sumit Makkar on 15/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import UIKit


struct SettingsViewUnitsViewModel
{
    //MARK: - Properties
    let unitsNotation: UnitsNotation
    
    var text: String
    {
        switch self.unitsNotation
        {
            case .imperial:
                return "Imperial"
            case .metric:
                return "Metric"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType
    {
        if UserDefaults.unitsNotation() == self.unitsNotation
        {
            return .checkmark
        }
        else
        {
            return .none
        }
    }
}

extension SettingsViewUnitsViewModel: SettingsRepresentable
{
    
}
