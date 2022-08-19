//
//  MyNoteSubjectSelectVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import Foundation
import Combine

class MyNoteSubjectSelectVM: ObservableObject {
    
    @Published var myKoreanNote: [MyNoteQuestion] = []
    @Published var myEnglishNote: [MyNoteQuestion] = []
    @Published var myHistoryNote: [MyNoteQuestion] = []
    
    var noteService = MyNoteService.shared
    
    private var subscription = Set<AnyCancellable>()
    
    init() {
        subscribeKorean()
        subscribeEnglish()
        subscribeHistory()
    }
    
    func subscribeKorean() {
        noteService.$myNoteKorean
            .receive(on: DispatchQueue.main)
            .sink { myNoteQuestions in
                self.myKoreanNote = myNoteQuestions
            }
            .store(in: &subscription)
    }
    func subscribeEnglish() {
        noteService.$myNoteEnglish
            .receive(on: DispatchQueue.main)
            .sink { myNoteQuestions in
                self.myEnglishNote = myNoteQuestions
            }
            .store(in: &subscription)
    }
    func subscribeHistory() {
        noteService.$myNoteHistory
            .receive(on: DispatchQueue.main)
            .sink { myNoteQuestions in
                self.myHistoryNote = myNoteQuestions
            }
            .store(in: &subscription)
    }
}
