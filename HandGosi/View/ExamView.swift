//
//  ExamView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct ExamView: View {
    
    let exam: ExamModel
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(exam.questions) { question in
                    QuestionView(question: question)
                }
            }
        }.navigationTitle( exam.year.description + " " + exam.examTypeID + " " + exam.subjectID)
    }
}

struct ExamView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        ExamView(exam: dev.examSample)
        }
    }
}
