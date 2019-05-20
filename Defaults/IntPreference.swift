//
//  IntPreference.swift
//  Defaults
//
//  Created by Fatih Şen on 20.05.2019.
//  Copyright © 2019 Fatih Şen. All rights reserved.
//

import Foundation

public class IntPreference: Preference, PreferenceChangedDelegate {
	
	public typealias Value = Int
	
	public var key: String {
		get {
			return self._key
		}
	}
	
	public var value: Int {
		get {
			return self._value
		}
		set {
			self._value = newValue
			onChanged(newValue: newValue)
		}
	}
	
	private var _key: String
	private var _value: Int
	private var callback: (Int) -> Void
	
	init(_ key: String, _ value: Int = 0, callback: @escaping (Int) -> Void) {
		self._key = key
		self._value = value
		self.callback = callback
	}
	
	public func onChanged(newValue: Int) {
		callback(newValue)
	}
	
	public static func ==(lhs: IntPreference, rhs: IntPreference) -> Bool {
		return lhs.key == rhs.key
	}
}
