//
//  PreferenceChangedDelegate.swift
//  Defaults
//
//  Created by Fatih Şen on 19.05.2019.
//  Copyright © 2019 Fatih Şen. All rights reserved.
//

import Foundation

public protocol PreferenceChangedDelegate {
	
	associatedtype Value
	
	func onChanged(newValue: Value)
}
