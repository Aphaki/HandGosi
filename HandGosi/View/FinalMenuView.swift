//
//  FinalMenuView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/08.
//

import SwiftUI

struct FinalMenuView: View {
    
    let year: Int
    @State var selectedExam: ExamModel?
    @StateObject var vm = FinalMenuViewModel()
    
    init(year: Int) {
        self.year = year
    }
    
    var body: some View {
        VStack(spacing: 50) {
            VStack(spacing: 20) {
                Text("국가직")
                    .font(.largeTitle)
                Text("국어")
                    .onTapGesture {
                        vm.fetchQuestion()
                        selectedExam = ExamModel(year: year, examTypeID: 1, subjectID: 1, questions: vm.questions)
                    }
                Text("영어")
                Text("한국사")
            }.padding()
                .background( RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black, radius: 5, x: 0, y: 5)
                )
            
            HStack(spacing: 60) {
                VStack(spacing: 20) {
                    Text("서울시")
                        .font(.largeTitle)
                    Text("국어")
                    Text("영어")
                    Text("한국사")
                }.padding()
                    .background( RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black, radius: 5, x: 0, y: 5)
                    )
                VStack(spacing: 20) {
                    Text("지방직")
                        .font(.largeTitle)
                    Text("국어")
                    Text("영어")
                    Text("한국사")
                }.padding()
                    .background( RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black, radius: 5, x: 0, y: 5)
                    )
            }
        }
        .font(.headline)
        .navigationTitle("\(year.description)")
        
    }
}

struct FinalMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FinalMenuView(year: 2022)
        }
    }
}
