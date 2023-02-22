//
//  MyNoteQuestionVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import Foundation

class MyNoteQuestionVM: ObservableObject {
    
    @Published var myNoteQuestion: MyNoteQuestion
    @Published var isDeleted: Bool = false
    
    init(myNoteQuestion: MyNoteQuestion) {
        self.myNoteQuestion = myNoteQuestion
    }
    
    
}
