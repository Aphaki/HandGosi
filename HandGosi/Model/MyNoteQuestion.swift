//
//  MyNoteQuestion.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import Foundation

class MyNoteQuestion {
    let year: Int
    let type: String
    let subject: String
    var question: QuestionModel
    
    init(year: Int, type: String, subject: String, question: QuestionModel) {
        self.year = year
        self.type = type
        self.subject = subject
        self.question = question
    }
}
