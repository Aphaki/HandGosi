//
//  ExamSelectView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct ExamSelectView: View {
    
    @StateObject var vm: ExamSelectVM
    @Binding var navigationBool: Bool
    
    init(exams: [ExamModel], navigationBool: Binding<Bool>) {
        _vm = StateObject(wrappedValue: ExamSelectVM(exams: exams))
        _navigationBool = navigationBool
    }
    
    
    var body: some View {
            List {
                ForEach(vm.yearSubjectFilteredExam) { exam in
                    NavigationLink {
                        ExamView(exam: exam, navigationBool: $navigationBool)
                    } label: {
                        HStack {
                            Text(exam.year.description + " " + exam.examTypeID + " " + exam.subjectID)
                            Spacer()
                            Text(exam.progressCount.description + "/20")
                        }
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
            ExamSelectView(exams: dev.exams, navigationBool: .constant(true))
        }
    }
}
