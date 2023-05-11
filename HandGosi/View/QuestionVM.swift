//
//  QuestionVM.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import Foundation
import SwiftUI

class QuestionVM: ObservableObject {
    
    @Binding var question: QuestionModel
    
    @Published var year: Int
    @Published var type: String
    @Published var subject: String
    
    @Published var addNoteText: String?
    
    init(question: Binding<QuestionModel>, year: Int = 0, type: String = "", subject: String = "") {
        _question = question
        self.year = year
        self.type = type
        self.subject = subject
    }
}
