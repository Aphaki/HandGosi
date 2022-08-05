//
//  QuestionModel.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import Foundation

class QuestionModel {
    let num: Int
    let questionText: String
    let reference: String?
    let num1Text: String
    let num2Text: String
    let num3Text: String
    let num4Text: String
    
    init(num: Int, questionText: String, reference: String? = nil, num1Text: String, num2Text: String, num3Text: String, num4Text: String) {
        self.num = num
        self.questionText = questionText
        self.reference = reference
        self.num1Text = num1Text
        self.num2Text = num2Text
        self.num3Text = num3Text
        self.num4Text = num4Text

    }
}
