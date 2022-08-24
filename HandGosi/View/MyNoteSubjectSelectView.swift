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
            Text("국  어")
                .font(.largeTitle)
                .padding(30)
                .background(
                    Circle().opacity(0.1)
                )
                .onTapGesture {
                    vm.selectedMyNotes = vm.myNotes.filter({ element in
                        return element.subject == "국어"
                    })
                    showNextView.toggle()
                }
            HStack {
                Spacer()
                Text("영  어")
                    .font(.largeTitle)
                    .padding(30)
                    .background(
                        Circle().opacity(0.1)
                    )
                    .onTapGesture {
                        vm.selectedMyNotes = vm.myNotes.filter({ element in
                            return element.subject == "영어"
                        })
                        showNextView.toggle()
                    }
                Text("한국사")
                    .font(.largeTitle)
                    .padding(30)
                    .background(
                        Circle().opacity(0.1)
                    )
                    .onTapGesture {
                        vm.selectedMyNotes = vm.myNotes.filter({ element in
                            return element.subject == "한국사"
                        })
                        showNextView.toggle()
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

