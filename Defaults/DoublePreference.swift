//
//  DoublePreference.swift
//  Defaults
//
//  Created by Fatih Şen on 20.05.2019.
//  Copyright © 2019 Fatih Şen. All rights reserved.
//

import Foundation

public class DoublePreference: Preference, PreferenceChangedDelegate {
	
	public typealias Value = Double
	
	public var key: String {
		get {
			return self._key
		}
	}
	
	public var value: Double {
		get {
			return self._value
		}
		set {
			self._value = newValue
			onChanged(newValue: newValue)
		}
	}
	
	private var _key: String
	private var _value: Double
	private let callback: (Double) -> Void

	init(_ key: String, _ value: Double = 0, callback: @escaping (Double) -> Void) {
		self._key = key
		self._value = value
		self.callback = callback
	}
	
	public func onChanged(newValue: Double) {
		callback(newValue)
	}
	
	public static func ==(lhs: DoublePreference, rhs: DoublePreference) -> Bool {
		return lhs._key == rhs._key
	}
}
