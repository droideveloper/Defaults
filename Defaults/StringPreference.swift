//
//  StringPreference.swift
//  Defaults
//
//  Created by Fatih Şen on 19.05.2019.
//  Copyright © 2019 Fatih Şen. All rights reserved.
//

import Foundation

public class StringPreference: Preference, PreferenceChangedDelegate {
	
	public typealias Value = String
	
	public var value: String {
		get {
			return self._value
		}
		set {
			self._value = newValue
			onChanged(newValue: newValue)
		}
	}
	
	public var key: String {
		get {
			return self._key
		}
	}
	
	private var _key: String
	private var _value: String
	private let callback: (Value) -> Void
	
	init(_ key: String, _ value: String = "", callback: @escaping (Value) -> Void) {
		self._key = key
		self._value = value
		self.callback = callback
	}
	
	public func onChanged(newValue: String) {
		callback(newValue)
	}
	
	public static func ==(lhs: StringPreference, rhs: StringPreference) -> Bool {
		return lhs._key == rhs.key
	}
}
