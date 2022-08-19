//
//  MyNoteView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import SwiftUI

struct MyNoteView: View {
    
    @State var myNotes: [MyNoteQuestion]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(myNotes) {myNoteQuestion in
                    MyNoteQuestionView(myNoteQuestion: myNoteQuestion)
                }
            }
        }.navigationTitle(myNotes.first?.subject ?? "노트가 비어있습니다.")
    }
}

//struct MyNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyNoteView()
//    }
//}
