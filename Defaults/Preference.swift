//
//  Preference.swift
//  Defaults
//
//  Created by Fatih Şen on 19.05.2019.
//  Copyright © 2019 Fatih Şen. All rights reserved.
//

import Foundation

public protocol Preference: Equatable {
	
	associatedtype Value
	
	var key: String { get }
	var value: Value { get set }
}
