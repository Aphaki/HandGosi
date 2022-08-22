//
//  QuestionVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation

class QuestionVM: ObservableObject {
    
    @Published var question: QuestionModel
    let noteService = MyNoteService.shared
    
    @Published var year: Int
    @Published var type: String
    @Published var subject: String
    
    @Published var addNoteText: String?
    
    init(question: QuestionModel, year: Int = 0, type: String = "", subject: String = "") {
        self.question = question
        self.year = year
        self.type = type
        self.subject = subject
    }
    
    func saveMyNoteAndReturnMessage(myNoteQuestion: MyNoteQuestion) -> String {
        return noteService.myNoteSave(myNoteQuestion: myNoteQuestion)
    }
}
