//
//  Color.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/07.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
            let red = Double((hex >> 16) & 0xFF) / 255.0
            let green = Double((hex >> 8) & 0xFF) / 255.0
            let blue = Double(hex & 0xFF) / 255.0
            self.init(red: red, green: green, blue: blue, opacity: alpha)
        }
    static let theme = MyColor()
}

struct MyColor {
    let myFontColor = Color("MyFontColor")
    let myAccentColor = Color("MyAccentColor")
    let myBackgroundColor = Color("MyBackgroundColor")
    let mySecondary = Color("MySecondary")
    let myFontColorTwo = Color("MyFontColorTwo")
    let myRed = Color("MyRed")
    let myBlack = Color("MyBlack")
    let myGray = Color("MyGray")
    let circleCenterColor = Color("CircleCenterColor")
    let chevronColor = Color("ChevronColor")
    let addMyNoteColor = Color("AddMyNoteColor")
}
