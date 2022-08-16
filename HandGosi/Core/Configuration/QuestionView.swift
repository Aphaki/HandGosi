//
//  QuestionView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import SwiftUI

struct QuestionView: View {
    
    @StateObject var vm: QuestionVM
    
    init(question: QuestionModel) {
        _vm = StateObject(wrappedValue: QuestionVM(question: question))

    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("\(vm.question.num)" + ".")
                    Text(vm.question.questionText)
                }
                if vm.question.reference != nil {
                    Text(vm.question.reference!)
                        .lineSpacing(5)
                        .padding(8)
                        .font(.custom("NanumMyeongjo-YetHangul", size: 15))
                        .overlay( RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                }
                if vm.question.reference2 != nil {
                    Text(vm.question.reference2!)
                        .lineSpacing(5)
                        .padding(8)
                        .font(.custom("NanumMyeongjo-YetHangul", size: 15))
                        .overlay( RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
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
                NumberButtonView(selectedNum: $vm.question.selectedNum, number: "①", numberInt: 1, text: vm.question.num1Text)
                NumberButtonView(selectedNum: $vm.question.selectedNum, number: "②",numberInt: 2, text: vm.question.num2Text)
                NumberButtonView(selectedNum: $vm.question.selectedNum, number: "③", numberInt: 3, text: vm.question.num3Text)
                NumberButtonView(selectedNum: $vm.question.selectedNum, number: "④", numberInt: 4, text: vm.question.num4Text)
            }
        }.padding(15)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: dev.questionSample)
    }
}
