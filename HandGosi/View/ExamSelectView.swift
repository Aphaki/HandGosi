//
//  ExamSelectView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct ExamSelectView: View {
    
    @StateObject var vm: ExamSelectVM
    
    init(exams: [ExamModel]) {
        _vm = StateObject(wrappedValue: ExamSelectVM(exams: exams))
    }
    
    
    var body: some View {
        List {
            ForEach(vm.yearSubjectFilteredExam) { exam in
                NavigationLink {
                    ExamView(exam: exam)
                } label: {
                    Text(exam.year.description + " " + exam.examTypeID + " " + exam.subjectID)
                        .font(.headline)
                }
            }
        }
        .listStyle(.automatic)
        .navigationTitle(vm.yearSubjectFilteredExam.first?.subjectID ?? "실패야 실패라고")
    }
}

struct ExamSelectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExamSelectView(exams: dev.exams)
        }
    }
}
