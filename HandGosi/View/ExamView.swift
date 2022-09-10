//
//  ExamView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct ExamView: View {
    
    @StateObject var vm: ExamVM
    @EnvironmentObject var mainVM: MainVM
    @State var showAlert = false
    @Environment(\.dismiss) var dismiss
    
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
            .navigationBarBackButtonHidden(true)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text(vm.isScored ? "시험지로" : "채점모드")
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 10).opacity(0.3))
                        .onTapGesture {
                            vm.isScored.toggle()
                        }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showAlert.toggle()
//                        vm.resetQuestions()
//                        dismiss()
                    } label: {
                        Text("back")
                    }
                    .alert("입력된 답안 기록을 어떻게 할까요?", isPresented: $showAlert) {
                        Button(role: .destructive) {
                            vm.resetQuestions()
                            dismiss()
                        } label: {
                            Text("초기화")
                        }
                        Button {
                            let selectedNumArray = vm.finalExam.questions.map { $0.selectedNum }
                            let examProgressModel = ExamProgressModel(year: vm.finalExam.year, type: vm.finalExam.examTypeID, subject: vm.finalExam.subjectID, selectedNumArray: selectedNumArray)
                            mainVM.saveExamProgressModel(saveModel: examProgressModel)
                        } label: {
                            Text("저장")
                        }

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
                .environmentObject(MainVM())
        }
    }
}
