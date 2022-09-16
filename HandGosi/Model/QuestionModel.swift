//
//  QuestionModel.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import Foundation

class QuestionModel: Identifiable, Codable {
    var id = UUID().uuidString
    let num: Int
    let questionText: AttributedString
    let reference: AttributedString?
    let reference2: AttributedString?
    let imgModel: ImageModel?
    let num1Text: AttributedString
    let num2Text: AttributedString
    let num3Text: AttributedString
    let num4Text: AttributedString
    let answer: Int
    var selectedNum: Int
    
    init(num: Int, questionText: AttributedString, reference: AttributedString? = nil, reference2: AttributedString? = nil, imgModel: ImageModel? = nil, num1Text: AttributedString, num2Text: AttributedString, num3Text: AttributedString, num4Text: AttributedString, answer: Int, selectedNum: Int = 0) {
        self.num = num
        self.questionText = questionText
        self.reference = reference
        self.reference2 = reference2
        self.imgModel = imgModel
        self.num1Text = num1Text
        self.num2Text = num2Text
        self.num3Text = num3Text
        self.num4Text = num4Text
        self.answer = answer
        self.selectedNum = selectedNum
    }
}
