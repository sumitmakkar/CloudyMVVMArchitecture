//
//  WeatherDayRepresentable.swift
//  Cloudy
//
//  Created by Sumit Makkar on 15/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import UIKit

protocol WeatherDayRepresentable
{
    var day        : String   { get }
    var date       : String   { get }
    var image      : UIImage? { get }
    var windSpeed  : String   { get }
    var temperature: String   { get }
}
