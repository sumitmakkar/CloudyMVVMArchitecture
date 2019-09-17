//
//  XCTestCase.swift
//  CloudyTests
//
//  Created by Sumit Makkar on 17/09/19.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import XCTest


extension XCTestCase
{
    func loadStubFromBundle(withName name: String, extensionString: String) -> Data
    {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: extensionString)
        return try! Data(contentsOf: url!)
    }
}
