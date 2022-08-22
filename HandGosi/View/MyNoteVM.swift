//
//  MyNoteVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import Foundation

class MyNoteVM: ObservableObject {
    @Published var myNotes: [MyNoteQuestion]
    
    init(myNotes: [MyNoteQuestion]) {
        self.myNotes = myNotes
    }
}
