//
//  NumButtonModel.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation

struct NumButtonModel {
    let numInt: Int
    let text: String
    let isClicked: Bool
    let selectedNum: [Int]
    
    init(numInt: Int, text: String, isClicked: Bool = false, selectedNum: [Int] = []) {
        self.numInt = numInt
        self.text = text
        self.isClicked = isClicked
        self.selectedNum = selectedNum
    }
}
