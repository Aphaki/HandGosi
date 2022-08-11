//
//  ExamView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/09.
//

import SwiftUI

struct ExamView: View {
    
    let exam: ExamModel
    
    var body: some View {
        
        ScrollView(showsIndicators: true) {
            
            VStack(spacing: 40) {
                ForEach(exam.questions) { question in
                    QuestionView(question: question)
                }
            }
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct ExamView_Previews: PreviewProvider {
    static var previews: some View {
        ExamView(exam: dev.examSample)
    }
}
