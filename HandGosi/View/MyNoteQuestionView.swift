//
//  MyNoteQuestionView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import SwiftUI

struct MyNoteQuestionView: View {
    
    @StateObject var vm: MyNoteQuestionVM
    @EnvironmentObject var mainVM: MainVM
    
    init(myNoteQuestion: MyNoteQuestion) {
        _vm = StateObject(wrappedValue: MyNoteQuestionVM(myNoteQuestion: myNoteQuestion))
    }
    
    var body: some View {
        if vm.isDeleted {
            EmptyView()
        } else {
        ScrollView {
            ZStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        
                        Text("[\(vm.myNoteQuestion.year.description) \(vm.myNoteQuestion.type) \(vm.myNoteQuestion.subject) ]")
                            .font(.headline)
                        if vm.myNoteQuestion.question.exception != nil {
                            Text(vm.myNoteQuestion.question.exception!)
                        }
                        Spacer()
                        Button {
                            mainVM.deleteNoteQuestion(myNoteQuestion: vm.myNoteQuestion)
                            vm.isDeleted.toggle()
                        } label: {
                            Text("오답노트에서 제거")
                                .font(.custom("NotoSansKR-Bold", size: 10))
                                .foregroundColor(Color.theme.addMyNoteColor)
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.theme.addMyNoteColor).opacity(0.2)
                                )
                        }
                    }
                    HStack {
                        Text("\(vm.myNoteQuestion.question.num)" + ".")
                        Text(vm.myNoteQuestion.question.questionText)
                    }
                    if vm.myNoteQuestion.question.imgModel != nil {
                        HStack {
                            Spacer()
                            Image(vm.myNoteQuestion.question.imgModel!.imageString)
                                .resizable()
                                .frame(width: vm.myNoteQuestion.question.imgModel!.imgWidth, height: vm.myNoteQuestion.question.imgModel!.imgHeight)
                            Spacer()
                        }
                    }
                    if vm.myNoteQuestion.question.reference != nil {
                        Text(vm.myNoteQuestion.question.reference!)
                            .lineSpacing(5)
                            .padding(8)
                            .font(.custom("NanumMyeongjo-YetHangul", size: 15))
                            .overlay( RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                    }
                    if vm.myNoteQuestion.question.reference2 != nil {
                        Text(vm.myNoteQuestion.question.reference2!)
                            .lineSpacing(5)
                            .padding(8)
                            .font(.custom("NanumMyeongjo-YetHangul", size: 15))
                            .overlay( RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                    }
                    
                    NumberButtonView(selectedNum: $vm.myNoteQuestion.question.selectedNum, number: "①", numberInt: 1, text: vm.myNoteQuestion.question.num1Text)
                    NumberButtonView(selectedNum: $vm.myNoteQuestion.question.selectedNum, number: "②",numberInt: 2, text: vm.myNoteQuestion.question.num2Text)
                    NumberButtonView(selectedNum: $vm.myNoteQuestion.question.selectedNum, number: "③", numberInt: 3, text: vm.myNoteQuestion.question.num3Text)
                    NumberButtonView(selectedNum: $vm.myNoteQuestion.question.selectedNum, number: "④", numberInt: 4, text: vm.myNoteQuestion.question.num4Text)
                }
                VStack {
                    HStack {
                        if vm.myNoteQuestion.question.selectedNum == vm.myNoteQuestion.question.answer {
                            redCircle
                        } else if vm.myNoteQuestion.question.selectedNum == 0 {
                            EmptyView()
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
}
extension MyNoteQuestionView {
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
}

struct MyNoteQuestionView_Previews: PreviewProvider {
    
    @StateObject var vm: MyNoteQuestionVM
    
    static var previews: some View {
        MyNoteQuestionView(myNoteQuestion: dev.myNoteQuestionSample)
    }
}
