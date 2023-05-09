//
//  ScoredQuestionView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/17.
//

import SwiftUI

struct ScoredQuestionView: View {
    
//    @StateObject var vm: QuestionVM
    @Binding var question: QuestionModel
    let year: Int
    let type: String
    let subject: String
    @State var addNoteText: String?
    
    @EnvironmentObject var mainVM: MainVM
    
//    init(question: QuestionModel, year: Int, type: String, subject: String) {
//        _vm = StateObject(wrappedValue: QuestionVM(question: question,
//                                                  year: year,
//                                                  type: type,
//                                                  subject: subject))
//        _question =
//    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Spacer()
                        if addNoteText != nil {
                            myNoteAddPopUpText
                        }
                        addMyNoteButton
                    }
                    
                    HStack {
                        Text("\(question.num)" + ".")
                        Text(question.questionText)
                    }
                    if question.reference != nil {
                        Text(question.reference!)
                            .lineSpacing(5)
                            .padding(8)
                            .font(.custom("NanumMyeongjo-YetHangul", size: 15))
                            .overlay( RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                    }
                    if question.reference2 != nil {
                        Text(question.reference2!)
                            .lineSpacing(5)
                            .padding(8)
                            .font(.custom("NanumMyeongjo-YetHangul", size: 15))
                            .overlay( RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                    }
                    if question.imgModel != nil {
                        HStack {
                            Spacer()
                            Image(question.imgModel!.imageString)
                                .resizable()
                                .frame(width: question.imgModel!.imgWidth, height: question.imgModel!.imgHeight)
                            Spacer()
                        }
                    }
                    NumberButtonView(selectedNum: $question.selectedNum, number: "①", numberInt: 1, text: question.num1Text)
                    NumberButtonView(selectedNum: $question.selectedNum, number: "②",numberInt: 2, text: question.num2Text)
                    NumberButtonView(selectedNum: $question.selectedNum, number: "③", numberInt: 3, text: question.num3Text)
                    NumberButtonView(selectedNum: $question.selectedNum, number: "④", numberInt: 4, text: question.num4Text)
                }
                VStack {
                    HStack {
                        if question.selectedNum == question.answer {
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
            Text(addNoteText!)
                .padding(8)
                .font(.caption)
                .foregroundColor(.white)
                .background( RoundedRectangle(cornerRadius: 20).opacity(0.8) )
            Spacer()
        }
    }
    var addMyNoteButton: some View {
        Button {
            let addNoteString = mainVM.saveMyNoteAndReturnMessage(myNoteQuestion: MyNoteQuestion(year: year, type: type, subject: subject, question: question)) // String
            addNoteText = addNoteString
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.easeInOut) {
                    addNoteText = nil
                }
            }
        } label: {
            Text("오답노트 추가")
                .padding(5)
                .background(RoundedRectangle(cornerRadius: 5).opacity(0.2))
        }
    }
}

struct ScoredQuestionView_Previews: PreviewProvider {
    
    @StateObject var vm: QuestionVM
    
    static var previews: some View {
//        ScoredQuestionView(question: dev.questionSample, year: 2022, type: "국가직", subject: "국어")
        ScoredQuestionView(question: .constant(dev.questionSample), year: 2022, type: "국가직", subject: "국어")
    }
}
