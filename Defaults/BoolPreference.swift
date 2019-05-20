//
//  BoolPreference.swift
//  Defaults
//
//  Created by Fatih Şen on 20.05.2019.
//  Copyright © 2019 Fatih Şen. All rights reserved.
//

import Foundation

public class BoolPrefrence: Preference, PreferenceChangedDelegate {
	
	public typealias Value = Bool
	
	public var key: String {
		get {
			return self._key
		}
	}
	
	public var value: Bool {
		get {
			return self._value
		}
		set {
			self._value = newValue
			onChanged(newValue: newValue)
		}
	}
	
	private var _key: String
	private var _value: Bool
	private let callback: (Bool) -> Void
	
	init(_ key: String, _ value: Bool = false, callback: @escaping (Bool) -> Void) {
		self._key = key
		self._value = value
		self.callback = callback
	}
	
	public func onChanged(newValue: Bool) {
		callback(newValue)
	}
	
	public static func ==(lhs: BoolPrefrence, rhs: BoolPrefrence) -> Bool {
		return lhs.key == rhs.key
	}
}
