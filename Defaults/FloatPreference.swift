//
//  FloatPreference.swift
//  Defaults
//
//  Created by Fatih Şen on 20.05.2019.
//  Copyright © 2019 Fatih Şen. All rights reserved.
//

import Foundation

public class FloatPreference: Preference, PreferenceChangedDelegate {
	
	public typealias Value = Float
	
	public var key: String {
		get {
			return self._key
		}
	}
	
	public var value: Float {
		get {
			return self._value
		}
		set {
			self._value = newValue
			onChanged(newValue: newValue)
		}
	}
	
	private var _key: String
	private var _value: Float
	private let callback: (Float) -> Void
	
	init(_ key: String, _ value: Float = 0, callback: @escaping (Float) -> Void) {
		self._key = key
		self._value = value
		self.callback = callback
	}
	
	public func onChanged(newValue: Float) {
		callback(newValue)
	}
	
	public static func ==(lhs: FloatPreference, rhs: FloatPreference) -> Bool {
		return lhs.key == rhs.key
	}
}
