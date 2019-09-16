//
//  SettingsViewTimeViewModel.swift
//  Cloudy
//
//  Created by Sumit Makkar on 14/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewTimeViewModel
{
    //MARK: - Properties
    let timeNotation: TimeNotation
    
    var text: String
    {
        switch timeNotation
        {
            case .twelveHour: return "12 Hour"
            case .twentyFourHour: return "24 Hour"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType
    {
        if UserDefaults.timeNotation() == timeNotation
        {
            return .checkmark
        }
        else
        {
            return .none
        }
    }
}


extension SettingsViewTimeViewModel: SettingsRepresentable
{
    
}
