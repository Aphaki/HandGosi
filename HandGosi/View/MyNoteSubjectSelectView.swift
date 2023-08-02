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
        List {
            Button {
                vm.selectedMyNotes = vm.myNotes.filter({ element in
                    return element.subject == "국어"
                })
                showNextView.toggle()
            } label: {
                HStack {
                    Text("국어 오답노트")
                        .foregroundColor(Color.theme.myAccentColor)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.theme.chevronColor)
                        .scaleEffect(0.8)
                }

                    
            }
            Button {
                vm.selectedMyNotes = vm.myNotes.filter({ element in
                    return element.subject == "영어"
                })
                showNextView.toggle()
            } label: {
                HStack {
                    Text("영어 오답노트")
                        .foregroundColor(Color.theme.myAccentColor)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.theme.chevronColor)
                        .scaleEffect(0.8)
                }
            }
            Button {
                vm.selectedMyNotes = vm.myNotes.filter({ element in
                    return element.subject == "한국사"
                })
                showNextView.toggle()
            } label: {
                HStack {
                    Text("한국사 오답노트")
                        .foregroundColor(Color.theme.myAccentColor)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.theme.chevronColor)
                        .scaleEffect(0.8)
                }

            }
            
            
            .navigationTitle("오답노트")
        }
        .background(
            NavigationLink(isActive: $showNextView,
                           destination: { MyNoteView(myNotes: vm.selectedMyNotes)},
                           label: { EmptyView() })
        )
    }
}
