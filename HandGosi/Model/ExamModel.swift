//
//  ExamModel.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation

struct ExamModel {
    
    let year: Int
    
    // 1 = 국가직, 2 = 서울시, 3 = 지방직
    let examTypeID: Int
    
    // 1 = 국어, 2 = 영어 , 3 = 한국사
    let subjectID: Int
    let questions: [QuestionModel]
}
