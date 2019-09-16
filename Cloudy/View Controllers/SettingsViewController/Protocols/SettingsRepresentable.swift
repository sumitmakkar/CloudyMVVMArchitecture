//
//  SettingsRepresentable.swift
//  Cloudy
//
//  Created by Sumit Makkar on 15/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import UIKit

protocol SettingsRepresentable
{
    var text: String { get }
    var accessoryType: UITableViewCellAccessoryType { get }
}
