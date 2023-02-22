//
//  MyNoteView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import SwiftUI

struct MyNoteView: View {
    
    @StateObject var vm: MyNoteVM
    
    init(myNotes: [MyNoteQuestion]) {
        _vm = StateObject(wrappedValue: MyNoteVM(myNotes: myNotes))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(vm.myNotes) {myNoteQuestion in
                    MyNoteQuestionView(myNoteQuestion: myNoteQuestion)
                }
            }
        }.navigationTitle(vm.myNotes.first?.subject ?? "노트가 비어있습니다.")
    }
}

//struct MyNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyNoteView()
//    }
//}
