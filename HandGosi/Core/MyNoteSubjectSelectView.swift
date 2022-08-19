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
            Text("국  어")
                .font(.largeTitle)
                .padding(30)
                .background(Circle().opacity(0.1))
                .onTapGesture {
                    vm.subscribeKorean()
                    showNextView.toggle()
                }
            HStack {
                Spacer()
                Text("영  어")
                    .font(.largeTitle)
                    .padding(30)
                    .background(Circle().opacity(0.1))
                    .onTapGesture {
                        vm.subscribeEnglish()
                        showNextView.toggle()
                    }
                Text("한국사")
                    .font(.largeTitle)
                    .padding(30)
                    .background(Circle().opacity(0.1))
                    .onTapGesture {
                        vm.subscribeHistory()
                        showNextView.toggle()
                    }
                Spacer()
            }
            Spacer()
            Spacer()
            Spacer()
        }
        .background(
            NavigationLink(isActive: $showNextView, destination: { MyNoteView(myNotes: vm.myNote) }, label: { EmptyView() })
        )
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
