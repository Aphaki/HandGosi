//
//  FinalMenuViewModel.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation

class FinalMenuViewModel: ObservableObject {
    @Published var questions: [QuestionModel] = []
    let examStore = ExamStore.shared
    
    func fetchQuestion() {
        
        questions = examStore.exam202211
    }
}
