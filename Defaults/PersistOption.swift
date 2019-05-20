//
//  PersistOption.swift
//  Defaults
//
//  Created by Fatih Şen on 19.05.2019.
//  Copyright © 2019 Fatih Şen. All rights reserved.
//

import Foundation

public enum PersistOption {
	case immediate // any change effect disk read and write
	case memory // keep thing on memory
	case defaults // keep things memory until app session over and write disk
}
