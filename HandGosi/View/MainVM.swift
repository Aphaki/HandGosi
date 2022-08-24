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
    @Published var myNotes: [MyNoteQuestion] = []
    @Published var changedMyNotes: [MyNoteQuestion] = []
    
    let examStoreDataService = ExamStoreDataService()
    let myNoteStoreService = MyNoteService()
    
    private var subscription = Set<AnyCancellable>()
    
    init() {
        subscribeAllExams()
        subscribeMyNote()
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
    private func subscribeMyNote() {
        myNoteStoreService.$myNotes
            .receive(on: DispatchQueue.main)
            .sink { [weak self] myNotesInService in
                guard let self = self else { return }
                self.changedMyNotes = myNotesInService
            }
            .store(in: &subscription)
    }
    func saveMyNoteAndReturnMessage(myNoteQuestion: MyNoteQuestion) -> String {
        return myNoteStoreService.myNoteSave(myNoteQuestion: myNoteQuestion)
    }
    func deleteNoteQuestion(myNoteQuestion: MyNoteQuestion) {
        myNoteStoreService.deleteMyNote(myNoteQuestion: myNoteQuestion)
    }
}
