//
//  Bucket.swift
//  Defaults
//
//  Created by Fatih Şen on 20.05.2019.
//  Copyright © 2019 Fatih Şen. All rights reserved.
//

import Foundation

public class Bucket {
	
	private var cache: Dictionary<String, AnyObject> = [:]
	
	private let option: PersistOption
	private let fileManager = FileManager.default
	private let fileName = "userPreference.pref"
	
	init(option: PersistOption = .defaults) {
		self.option = option
		executePendingReadOperation()
	}
	
	public func newStringPreference(key: String, for value: String = "") -> StringPreference {
		let stringPreference = StringPreference(key, value) { [weak weakSelf = self] _ in
			weakSelf?.executePendingOperation()
		}
		cache[key] = stringPreference
		return stringPreference
	}
	
	public func getOrCreateStringPrefrence(key: String) -> StringPreference {
		return (cache[key] as? StringPreference) ?? newStringPreference(key: key)
	}
	
	public func newIntPreference(key: String, for value: Int = 0) -> IntPreference {
		let intPreference = IntPreference(key, value) { [weak weakSelf = self] _ in
			weakSelf?.executePendingOperation()
		}
		cache[key] = intPreference
		return intPreference
	}
	
	public func getOrCreateIntPreference(key: String) -> IntPreference {
		return (cache[key] as? IntPreference) ?? newIntPreference(key: key)
	}
	
	public func newDoublePreference(key: String, for value: Double = 0) -> DoublePreference {
		let doublePreference = DoublePreference(key, value) { [weak weakSelf = self] _ in
			weakSelf?.executePendingOperation()
		}
		cache[key] = doublePreference
		return doublePreference
	}
	
	public func getOrCreateDoublePreference(key: String) -> DoublePreference {
		return (cache[key] as? DoublePreference) ?? newDoublePreference(key: key)
	}
	
	public func newFloatPreference(key: String, for value: Float = 0) -> FloatPreference {
		let floatPreference = FloatPreference(key, value) { [weak weakSelf = self] _ in
			weakSelf?.executePendingOperation()
		}
		cache[key] = floatPreference
		return floatPreference
	}
	
	public func getOrCreateFloatPreference(key: String) -> FloatPreference {
		return (cache[key] as? FloatPreference) ?? newFloatPreference(key: key)
	}
	
	public func newBoolPreference(key: String, for value: Bool = false) -> BoolPrefrence {
		let boolPreference = BoolPrefrence(key, value) { [weak weakSelf = self] _ in
			weakSelf?.executePendingOperation()
		}
		cache[key] = boolPreference
		return boolPreference
	}
	
	public func getOrCreateBoolPreference(key: String) -> BoolPrefrence {
		return (cache[key] as? BoolPrefrence) ?? newBoolPreference(key: key)
	}
	
	private func executePendingReadOperation() {
		let fileManager = self.fileManager
		let fileName = self.fileName
		DispatchQueue.main.async { [weak weakSelf = self] in
			if let uri = fileManager.urls(for: .userDirectory, in: .userDomainMask).first {
				let dictionary = NSDictionary(contentsOf: uri.appendingPathComponent(fileName))
				if let dictionary = dictionary as? [String: AnyObject] {
					
				}
			}
		}
	}

	private func executePendingOperation(dealloc: Bool = false) {
		switch option {
			case .immediate:
			  executeWrite()
			case .defaults:
				if dealloc {
					executeWrite()
				}
			case .memory:
				break
		}
	}
	
	private func executeWrite() {
		let fileManager = self.fileManager
		let fileName = self.fileName
		let cache = self.cache
		DispatchQueue.main.async {
			if let uri = fileManager.urls(for: .userDirectory, in: .userDomainMask).first {
				NSDictionary(dictionary: cache).write(to: uri.appendingPathComponent(fileName), atomically: true)
			}
		}
	}
	
	private func reinit(read: [String: AnyObject]) {	}
	
	deinit {
		executePendingOperation(dealloc: true)
	}
}
