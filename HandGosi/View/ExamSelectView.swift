//
//  ExamSelectView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct ExamSelectView: View {
    
    let exams: [ExamModel]
    
    @Binding var subjectID: String?
    @State var selectedExam: ExamModel?
    @State var showQuestionView: Bool = false
    
    
    var body: some View {
        List {
            ForEach(exams) { exam in
                Text(exam.examTypeID)
                    .onTapGesture {
                        selectedExam = exam
                        showQuestionView.toggle()
                    }
            }
        }
        .background(
            NavigationLink(isActive: $showQuestionView,
                           destination: {
                               ExamView(exam: selectedExam ?? DevPreview.shared.examSample)
                           },
                           label: { EmptyView() })
        )
        .listStyle(.plain)
        .navigationTitle(subjectID ?? "실패야")
    }
}

struct ExamSelectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExamSelectView(exams: dev.exams, subjectID: .constant("국어"))
        }
    }
}