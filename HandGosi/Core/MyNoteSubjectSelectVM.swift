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
    let examStoreDataService = ExamStoreDataService()
    private var subscription = Set<AnyCancellable>()
    
    func subscribeKorean() {
        examStoreDataService.$myNoteKorean
            .receive(on: DispatchQueue.main)
            .sink { myNoteStoredKorean in
                self.myNote = myNoteStoredKorean
            }
            .store(in: &subscription)
    }
    func subscribeEnglish() {
        examStoreDataService.$myNoteEnglish
            .receive(on: DispatchQueue.main)
            .sink { myNoteStoredKorean in
                self.myNote = myNoteStoredKorean
            }
            .store(in: &subscription)
    }
    func subscribeHistory() {
        examStoreDataService.$myNoteHistory
            .receive(on: DispatchQueue.main)
            .sink { myNoteStoredKorean in
                self.myNote = myNoteStoredKorean
            }
            .store(in: &subscription)
    }
}
