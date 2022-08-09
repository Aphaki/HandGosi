//
//  FinalMenuViewModel.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation

class FinalMenuViewModel: ObservableObject {
    @Published var questions: [QuestionModel] = []
    
    
    func fetchQuestion() {
        
        questions = DevPreview.shared.examSample.questions
    }
}
