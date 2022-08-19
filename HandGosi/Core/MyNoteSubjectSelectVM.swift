//
//  MyNoteSubjectSelectVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import Foundation
import Combine

class MyNoteSubjectSelectVM: ObservableObject {
    @Published var myNote: [MyNoteQuestion] = []
    
    var noteService = MyNoteService.shared
    
    private var subscription = Set<AnyCancellable>()
    
    func subscribeKorean() {
        noteService.$myNoteKorean
            .receive(on: DispatchQueue.main)
            .sink { myNoteQuestions in
                self.myNote = myNoteQuestions
            }
            .store(in: &subscription)
    }
    func subscribeEnglish() {
        noteService.$myNoteEnglish
            .receive(on: DispatchQueue.main)
            .sink { myNoteQuestions in
                self.myNote = myNoteQuestions
            }
            .store(in: &subscription)
    }
    func subscribeHistory() {
        noteService.$myNoteHistory
            .receive(on: DispatchQueue.main)
            .sink { myNoteQuestions in
                self.myNote = myNoteQuestions
            }
            .store(in: &subscription)
    }
}
