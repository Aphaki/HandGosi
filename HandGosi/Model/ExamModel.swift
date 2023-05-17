//
//  ExamModel.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation

class ExamModel: Identifiable, Codable {
    let id: Int // 연도 + 타입 + 과목 (ex. 202211 = 22년도 국가직 국어)
    let year: Int
    let examTypeID: String
    let subjectID: String
    var questions: [QuestionModel]
    var progressCount: Int {
       return questions.filter { question in
           return question.selectedNum != 0
        }.count
    }
    var totalCount: Int { return questions.count }
    var score: String {
        let correctCounts =
        questions.filter { aQuestionModel in
           return aQuestionModel.answer == aQuestionModel.selectedNum
        }.count
        
        let thisScore = correctCounts * 5
        return "\(thisScore)"
    }
    
    init(id: Int, year: Int, examTypeID: String, subjectID: String, questions: [QuestionModel]) {
        self.id = id
        self.year = year
        self.examTypeID = examTypeID
        self.subjectID = subjectID
        self.questions = questions
    }
}
