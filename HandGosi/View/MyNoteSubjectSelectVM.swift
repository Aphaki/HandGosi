//
//  MyNoteSubjectSelectVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import Foundation
import Combine

class MyNoteSubjectSelectVM: ObservableObject {
    
    @Published var myNotes: [MyNoteQuestion] = []
    @Published var selectedMyNotes: [MyNoteQuestion] = []
    
    private var subscription = Set<AnyCancellable>()
    
    init(myNotes: [MyNoteQuestion]) {
        self.myNotes = myNotes
    }
    
    
}
