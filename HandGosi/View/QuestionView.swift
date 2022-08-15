//
//  QuestionView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import SwiftUI

struct QuestionView: View {
    let num: Int
    let questionText: AttributedString
    let reference: AttributedString?
    let reference2: AttributedString?
    let imgModel: ImageModel?
    let num1Text: AttributedString
    let num2Text: AttributedString
    let num3Text: AttributedString
    let num4Text: AttributedString
    @State var selectedNum: [Int] = []
    
    @State var isSelected1 = false
    @State var isSelected2 = false
    @State var isSelected3 = false
    @State var isSelected4 = false
    
    init(question: QuestionModel) {
        self.num = question.num
        self.questionText = question.questionText
        self.reference = question.reference
        self.reference2 = question.reference2
        self.imgModel = question.imgModel
        self.num1Text = question.num1Text
        self.num2Text = question.num2Text
        self.num3Text = question.num3Text
        self.num4Text = question.num4Text
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("\(num)" + ".")
                    Text(questionText)
                }
                if reference != nil {
                    Text(reference!)
                        .lineSpacing(5)
                        .padding(8)
                        .font(.custom("NanumMyeongjo-YetHangul", size: 15))
                        .overlay( RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                }
                if reference2 != nil {
                    Text(reference2!)
                        .lineSpacing(5)
                        .padding(8)
                        .font(.custom("NanumMyeongjo-YetHangul", size: 15))
                        .overlay( RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                }
                if imgModel != nil {
                    HStack {
                        Spacer()
                        Image(imgModel!.imageString)
                            .resizable()
                            .frame(width: imgModel!.imgWidth, height: imgModel!.imgHeight)
                        Spacer()
                    }
                }
                NumberButtonView(isSelected: $isSelected1, number: "①", text: num1Text)
                NumberButtonView(isSelected: $isSelected2, number: "②", text: num2Text)
                NumberButtonView(isSelected: $isSelected3, number: "③", text: num3Text)
                NumberButtonView(isSelected: $isSelected4, number: "④", text: num4Text)
            }
        }.padding(15)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: dev.questionSample)
    }
}
