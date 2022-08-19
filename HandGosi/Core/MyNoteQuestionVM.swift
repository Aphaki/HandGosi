//
//  MyNoteQuestionVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import Foundation

class MyNoteQuestionVM: ObservableObject {
    
    @Published var myNoteQuestion: MyNoteQuestion
    var myNoteService = MyNoteService.shared
    
    init(myNoteQuestion: MyNoteQuestion) {
        self.myNoteQuestion = myNoteQuestion
    }
    
    func deleteNoteQuestion(myNoteQuestion: MyNoteQuestion) {
        myNoteService.deleteMyNote(myNoteQuestion: myNoteQuestion)
    }
}
