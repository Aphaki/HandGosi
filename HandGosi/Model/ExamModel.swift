//
//  ExamModel.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation

struct ExamModel: Identifiable {
    let id: Int // 연도 + 타입 + 과목 (ex. 202211 = 22년도 국가직 국어)
    let year: Int
    let examTypeID: String
    let subjectID: String
    var questions: [QuestionModel]
}
