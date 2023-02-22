//
//  MyNoteSubjectSelectView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import SwiftUI

struct MyNoteSubjectSelectView: View {
    
    @State private var showNextView = false
    
    @StateObject var vm: MyNoteSubjectSelectVM
    
    init(myNotes: [MyNoteQuestion]) {
        _vm = StateObject(wrappedValue: MyNoteSubjectSelectVM(myNotes: myNotes))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Spacer()
            Button {
                vm.selectedMyNotes = vm.myNotes.filter({ element in
                    return element.subject == "국어"
                })
                showNextView.toggle()
            } label: {
                Text("국  어")
                    .myNoteButton(color: .red)
            }
            HStack {
                Spacer()
                Button {
                    vm.selectedMyNotes = vm.myNotes.filter({ element in
                        return element.subject == "영어"
                    })
                    showNextView.toggle()
                } label: {
                    Text("영  어")
                        .myNoteButton(color: .red)
                }
                Button {
                    vm.selectedMyNotes = vm.myNotes.filter({ element in
                        return element.subject == "한국사"
                    })
                    showNextView.toggle()
                } label: {
                    Text("한국사")
                        .myNoteButton(color: .red)
                }
                Spacer()
            }
            Spacer()
            Spacer()
            Spacer()
        }
        .background(
            NavigationLink(isActive: $showNextView,
                           destination: { MyNoteView(myNotes: vm.selectedMyNotes)},
                           label: { EmptyView() })
        )
        .navigationTitle("오답노트")
    }
}

