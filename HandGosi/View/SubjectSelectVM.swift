//
//  SubjectSelectVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation
import Combine

class SubjectSelectVM: ObservableObject {
    
    @Published var yearFilteredExams: [ExamModel]
    @Published var yearSubjectFilteredExams: [ExamModel] = []
    
    init(exams: [ExamModel]) {
        self.yearFilteredExams = exams
    }
}
