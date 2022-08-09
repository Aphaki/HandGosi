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
    let num1Text: AttributedString
    let num2Text: AttributedString
    let num3Text: AttributedString
    let num4Text: AttributedString
    @State var selectedNum: [Int] = []
    
    init(question: QuestionModel) {
        self.num = question.num
        self.questionText = question.questionText
        self.reference = question.reference
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
                        .padding(8)
                        .font(.custom("NanumMyeongjo-YetHangul", size: 15))
                        .overlay( RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                }
                NumberButtonView(number: "①", text: num1Text)
                NumberButtonView(number: "②", text: num2Text)
                NumberButtonView(number: "③", text: num3Text)
                NumberButtonView(number: "④", text: num4Text)
            }
        }.padding(.horizontal, 10)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: dev.questionSample)
    }
}
