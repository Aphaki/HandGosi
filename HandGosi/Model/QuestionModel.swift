//
//  QuestionModel.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import Foundation

class QuestionModel: Identifiable {
    let num: Int
    let questionText: AttributedString
    let reference: AttributedString?
    let num1Text: AttributedString
    let num2Text: AttributedString
    let num3Text: AttributedString
    let num4Text: AttributedString
    
    init(num: Int, questionText: AttributedString, reference: AttributedString? = nil, num1Text: AttributedString, num2Text: AttributedString, num3Text: AttributedString, num4Text: AttributedString) {
        self.num = num
        self.questionText = questionText
        self.reference = reference
        self.num1Text = num1Text
        self.num2Text = num2Text
        self.num3Text = num3Text
        self.num4Text = num4Text

    }
}
