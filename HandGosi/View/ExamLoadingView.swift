//
//  ExamLoadingView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/29.
//

import SwiftUI

struct ExamLoadingView: View {
    @Binding var exam: ExamModel?
    
    var body: some View {
        if let exam = exam {
            ExamView(exam: exam)
        }
    }
}

//struct ExamLoadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExamLoadingView()
//    }
//}
