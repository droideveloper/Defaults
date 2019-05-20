//
//  TypePreference.swift
//  Defaults
//
//  Created by Fatih Şen on 20.05.2019.
//  Copyright © 2019 Fatih Şen. All rights reserved.
//

import Foundation

public class TypePreference<T>: Preference, PreferenceChangedDelegate {
	
	public typealias Value = T
	
	public var key: String {
		get {
			return self._key
		}
	}
	
	public var value: T {
		get {
			return self._value
		}
		set {
			self._value = newValue
		}
	}
	
	private var _key: String
	private var _value: T
	private let callback: (T) -> Void
	
	init(_ key: String, _ value: T, callback: @escaping (T) -> Void) {
		self._key = key
		self._value = value
		self.callback = callback
	}
	
	public func onChanged(newValue: T) {
		callback(newValue)
	}
	
	public static func ==(lhs: TypePreference<T>, rhs: TypePreference<T>) -> Bool {
		return lhs.key == rhs.key
	}
}
