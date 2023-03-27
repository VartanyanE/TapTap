//
//  Settings.swift
//  TapTap
//
//  Created by Emanuil Vartanyan on 3/26/23.
//

import SpriteKit

enum PhysicsCategories {
    static let none: UInt32 = 0
    static let penguinCategory: UInt32 = 0x1           // 01
    static let snakeCategory: UInt32 = 0x1 << 1    // 10
}

