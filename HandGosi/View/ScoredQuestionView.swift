//
//  ScoredQuestionView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/17.
//

import SwiftUI

struct ScoredQuestionView: View {
    
    @StateObject var vm: QuestionVM
    @EnvironmentObject var mainVM: MainVM
    
    init(question: Binding<QuestionModel>, year: Int, type: String, subject: String) {
        _vm = StateObject(wrappedValue: QuestionVM(question: question,
                                                  year: year,
                                                  type: type,
                                                  subject: subject))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Spacer()
                        if vm.addNoteText != nil {
                            myNoteAddPopUpText
                        }
                        if vm.question.exception != nil {
                            Text(vm.question.exception!)
                        }
                        addMyNoteButton
                    }
                    HStack {
                        Text("\(vm.question.num)" + ".")
                        Text(vm.question.questionText)
                    }
                    if vm.question.imgModel != nil {
                        HStack {
                            Spacer()
                            Image(vm.question.imgModel!.imageString)
                                .resizable()
                                .frame(width: vm.question.imgModel!.imgWidth, height: vm.question.imgModel!.imgHeight)
                            Spacer()
                        }
                    }
                    if vm.question.reference != nil {
                        Text(vm.question.reference!)
                            .lineSpacing(5)
                            .padding(8)
                            .font(.custom("NanumMyeongjo-YetHangul", size: 16))
                            .overlay( RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                    }
                    if vm.question.reference2 != nil {
                        Text(vm.question.reference2!)
                            .lineSpacing(5)
                            .padding(8)
                            .font(.custom("NanumMyeongjo-YetHangul", size: 16))
                            .overlay( RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                    }
                    NumberButtonView(selectedNum: $vm.question.selectedNum, number: "①", numberInt: 1, text: vm.question.num1Text)
                    NumberButtonView(selectedNum: $vm.question.selectedNum, number: "②",numberInt: 2, text: vm.question.num2Text)
                    NumberButtonView(selectedNum: $vm.question.selectedNum, number: "③", numberInt: 3, text: vm.question.num3Text)
                    NumberButtonView(selectedNum: $vm.question.selectedNum, number: "④", numberInt: 4, text: vm.question.num4Text)
                }
                VStack {
                    HStack {
                        if vm.question.selectedNum == vm.question.answer {
                            redCircle
                        } else {
                            redFalseMark
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
        }.padding(15)
    }
}
extension ScoredQuestionView {
    var redCircle: some View {
        Circle().stroke(lineWidth: 8)
            .frame(width: 100, height: 100)
            .foregroundColor(.red)
            .opacity(0.7)
            .padding(8)
    }
    var redFalseMark: some View {
        Rectangle()
            .frame(width: 140, height: 10)
            .rotationEffect(Angle(degrees: 135))
            .foregroundColor(.red).opacity(0.7)
            .offset(y: 50)
    }
    var myNoteAddPopUpText: some View {
        HStack {
            Spacer()
            Text(vm.addNoteText!)
                .padding(5)
                .font(.custom("NotoSansKR-Bold", size: 10))
                .foregroundColor(.white)
                .background( RoundedRectangle(cornerRadius: 10).opacity(0.8) )
            Spacer()
        }
    }
    var addMyNoteButton: some View {
        Button {
            let addNoteString = mainVM.saveMyNoteAndReturnMessage(myNoteQuestion: MyNoteQuestion(year: vm.year, type: vm.type, subject: vm.subject, question: vm.question)) // String
            vm.addNoteText = addNoteString
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.easeInOut) {
                    vm.addNoteText = nil
                }
            }
        } label: {
            Text("오답노트 추가")
                .font(.custom("NotoSansKR-Bold", size: 10))
                .foregroundColor(Color.theme.addMyNoteColor)
                .padding(5)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.theme.addMyNoteColor).opacity(0.2)
                )
        }
    }
}

//struct ScoredQuestionView_Previews: PreviewProvider {
//    
//    @StateObject var vm: QuestionVM
//    
//    static var previews: some View {
//        ScoredQuestionView(question: dev.questionSample, year: 2022, type: "국가직", subject: "국어")
//    }
//}
