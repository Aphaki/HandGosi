//
//  ExamVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/17.
//

import Foundation
import Combine

class ExamVM: ObservableObject {
    @Published var finalExam: ExamModel
    @Published var isScored: Bool = false
    private var subscription = Set<AnyCancellable>()
    
    init(exam: ExamModel) {
        self.finalExam = exam
    }

    func resetQuestions() {
        let resetQuestions =
        finalExam.questions.map { question -> QuestionModel in
            question.selectedNum = 0
           return question
        }
        finalExam.questions = resetQuestions
    }
}
