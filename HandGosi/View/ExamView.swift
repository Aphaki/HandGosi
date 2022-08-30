//
//  ExamView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct ExamView: View {
    
    @StateObject var vm: ExamVM
    
    init(exam: ExamModel) {
        _vm = StateObject(wrappedValue: ExamVM(exam: exam))
    }
    
    var body: some View {
        
        ZStack {
            Color.theme.myBackgroundColor.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(vm.finalExam.questions) { question in
                        if vm.isScored == false {
                            QuestionView(question: question)
                        } else {
                            ScoredQuestionView(question: question,
                                               year: vm.finalExam.year,
                                               type: vm.finalExam.examTypeID,
                                               subject: vm.finalExam.subjectID)
                        }
                    }
                }
            }
            .navigationTitle( vm.finalExam.year.description + " " + vm.finalExam.examTypeID + " " + vm.finalExam.subjectID)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text(vm.isScored ? "시험지로" : "채점하기")
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 10).opacity(0.3))
                        .onTapGesture {
                            vm.isScored.toggle()
                        }
                }
            }
        }
    }
}
struct ExamView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExamView(exam: dev.examSample)
        }
    }
}
