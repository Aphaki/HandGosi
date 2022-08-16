//
//  ExamSelectView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct ExamSelectView: View {
    
//    @Binding var subjectID: String?
//    @State var selectedExam: ExamModel?
    
    @StateObject var vm: ExamSelectVM
    @State var showQuestionView: Bool = false
    
    init(exams: [ExamModel]) {
        _vm = StateObject(wrappedValue: ExamSelectVM(exams: exams))
    }
    
    
    var body: some View {
        List {
            ForEach(vm.yearSubjectFilteredExam) { exam in
                Text(exam.year.description + " " + exam.examTypeID + " " + exam.subjectID)
                    .font(.headline)
                    .onTapGesture {
                        vm.selectedExam = exam
                        showQuestionView.toggle()
                    }
            }
        }
        .background(
            NavigationLink(isActive: $showQuestionView,
                           destination: {
                               ExamView(exam: vm.selectedExam ?? DevPreview.shared.examSample)
                           },
                           label: { EmptyView() })
        )
        .listStyle(.plain)
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
