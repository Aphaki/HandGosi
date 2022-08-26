//
//  ExamSelectView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct ExamSelectView: View {
    
    @StateObject var vm: ExamSelectVM
//    @State var showNextView: Bool = false
    
    init(exams: [ExamModel]) {
        _vm = StateObject(wrappedValue: ExamSelectVM(exams: exams))
    }
    
    
    var body: some View {
            List {
                ForEach(vm.yearSubjectFilteredExam) { exam in
                    NavigationLink {
                        ExamView(exam: exam)
                    } label: {
                        HStack {
                            Text(exam.year.description + " " + exam.examTypeID + " " + exam.subjectID)
                            Spacer()
                            Text(exam.progressCount.description + "/20")
                        }
                            .font(.headline)
                    }
                }
            }
            .background(Color.theme.myBackgroundColor)
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
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
