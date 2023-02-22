//
//  ExamSelectVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/17.
//

import Foundation

class ExamSelectVM: ObservableObject {
    @Published var yearSubjectFilteredExam: [ExamModel]
    
    init(exams: [ExamModel]) {
        self.yearSubjectFilteredExam = exams
    }
}
