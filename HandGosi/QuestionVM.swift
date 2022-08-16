//
//  QuestionVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation

class QuestionVM: ObservableObject {
    
    @Published var question: QuestionModel
    
    init(question: QuestionModel) {
        self.question = question
    }
}
