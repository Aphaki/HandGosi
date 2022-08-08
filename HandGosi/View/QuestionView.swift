//
//  QuestionView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/05.
//

import SwiftUI

struct QuestionView: View {
    let num: Int
    let questionText: String
    let reference: String?
    let num1Text: String
    let num2Text: String
    let num3Text: String
    let num4Text: String
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
                        .overlay( RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                }
                NumberButton(number: "①", numberInt: 1, text: num1Text)
                NumberButton(number: "②", numberInt: 2, text: num2Text)
                NumberButton(number: "③", numberInt: 3, text: num3Text)
                NumberButton(number: "④", numberInt: 4, text: num4Text)
            }
        }.padding(.horizontal, 10)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: dev.questionSample)
    }
}
