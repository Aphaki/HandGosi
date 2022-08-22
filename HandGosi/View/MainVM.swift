//
//  MainVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/17.
//

import Foundation
import Combine

class MainVM: ObservableObject {
    @Published var allExams: [ExamModel] = []
    @Published var filteredExams: [ExamModel] = []
    let examStoreDataService = ExamStoreDataService()
    private var subscription = Set<AnyCancellable>()
    
    init() {
        subscribeAllExams()
        fetchAllExams()
    }
    
    
    private func subscribeAllExams() {
        examStoreDataService.$allExams
            .receive(on: DispatchQueue.main)
            .sink { [weak self] exams in
                guard let self = self else { return }
                self.allExams = exams
            }
            .store(in: &subscription)
    }
    
    private func fetchAllExams() {
        examStoreDataService.saveAllExam()
    }
}
