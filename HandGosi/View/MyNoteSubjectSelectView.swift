//
//  MyNoteSubjectSelectView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/19.
//

import SwiftUI

struct MyNoteSubjectSelectView: View {
    
    @State private var showNextView = false
    
    @StateObject var vm = MyNoteSubjectSelectVM()
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Spacer()
            NavigationLink(destination: {
                MyNoteView(myNotes: vm.myKoreanNote)
            },
                           label: { Text("국  어")
                    .font(.largeTitle)
                    .padding(30)
                .background(Circle().opacity(0.1)) })
            HStack {
                Spacer()
                NavigationLink(
                    destination: {
                        MyNoteView(myNotes: vm.myEnglishNote)
                    },
                    label: { Text("영  어")
                            .font(.largeTitle)
                            .padding(30)
                            .background(Circle().opacity(0.1)) }
                )
                NavigationLink(
                    destination: {
                        MyNoteView(myNotes: vm.myHistoryNote)
                    },
                    label: { Text("한국사")
                            .font(.largeTitle)
                            .padding(30)
                            .background(Circle().opacity(0.1)) }
                )
                Spacer()
            }
            Spacer()
            Spacer()
            Spacer()
        }
        .navigationTitle("오답노트")
    }
}

struct MyNoteSubjectSelectView_Previews: PreviewProvider {
    
    @StateObject var vm = MyNoteSubjectSelectVM()
    static var previews: some View {
        
        NavigationView{
        MyNoteSubjectSelectView()
        }
    }
}
