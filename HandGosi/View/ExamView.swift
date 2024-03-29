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
    @Binding var navigationBool: Bool
    @State var showAlert = false
    @Environment(\.dismiss) var dismiss
    
    
    init(exam: ExamModel, navigationBool: Binding<Bool>) {
        _vm = StateObject(wrappedValue: ExamVM(exam: exam))
        _navigationBool = navigationBool
    }
    
    var body: some View {
        ZStack {
            Color.theme.myBackgroundColor.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach($vm.finalExam.questions) { question in
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
                    Text(vm.isScored ? "시험지로" : "채점지로")
                        .font(.custom("NotoSansKR-Bold", size: 10))
                        .foregroundColor(Color.theme.myAccentColor)
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 10).opacity(0.1)
                        )
                        .onTapGesture {
                            vm.isScored.toggle()
                        }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showAlert.toggle()
                    } label: {
                        Image(systemName: "xmark.circle")
                    }
                    .alert("입력된 답안 기록을 어떻게 할까요?", isPresented: $showAlert) {
                        Button(role: .destructive) {
                            vm.resetQuestions()
                            mainVM.saveCurrentExam(exam: vm.finalExam)
                            navigationBool.toggle()
                        } label: {
                            Text("초기화")
                        }
                        Button("저장") {
                            mainVM.saveCurrentExam(exam: vm.finalExam)
                            navigationBool.toggle()
                        }
                    }

                }
            } // toolbar
            if vm.isScored {
                VStack {
                    HStack {
                        Text(vm.finalExam.score)
                            .font(.system(size:50))
                            .underline()
                            .bold()
                            .foregroundColor(.red)
                            .opacity(0.5)
                    }
                    Spacer()
                }
            }
        }
    }
}
struct ExamView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExamView(exam: dev.examSample, navigationBool: .constant(true))
                .environmentObject(MainVM())
        }
    }
}
