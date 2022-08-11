//
//  FinalMenuViewModel.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation
import Combine

class FinalMenuViewModel: ObservableObject {
    @Published var questions: [QuestionModel] = []
    
    let examStoreDataService = ExamStoreDataService()
    var subscription = Set<AnyCancellable>()
    
    func fetchQuestion() {
        examStoreDataService.fetchExam202211()
        examStoreDataService.$questions
            .sink { [weak self] storeQuestions in
                guard let self = self else { return }
                self.questions = storeQuestions
            }
            .store(in: &subscription)
    }
}
