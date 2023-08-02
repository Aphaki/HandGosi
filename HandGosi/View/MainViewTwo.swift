//
//  MainViewTwo.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/08/02.
//

import SwiftUI

struct MainViewTwo: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    topView
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Section {
                    Text("2023년")
                    Text("2022년")
                    Text("2023년")
                    Text("2022년")
                    Text("2023년")
                    Text("2022년")
                    Text("2023년")
                    Text("2022년")
                } header: {
                    Text("연도별 기출문제")
                        .font(.custom("NotoSansKR-Bold", size: 20))
                        .foregroundColor(Color.theme.myAccentColor)
                }
                
                
            }
            .listStyle(.insetGrouped)
            
        }
        .navigationBarTitle("HandGosi")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image("NoteIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 30)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image("SettingIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
        }
    }
    
    var topView: some View {
        VStack {
            ZStack {
                Image("grabThePhone")
                    .resizable()
                    .scaledToFit()
                Text("HandGosi")
                    .font(.custom("GangwonEduPowerExtraBold", size: 40))
                    .foregroundColor(Color.theme.myFontColorTwo)
            }

            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("핸드고시")
                        .font(.custom("NotoSansKR-Bold", size: 20))
                    Text("공무원 시험 기출문제가 내 손안에\n언제 어디서든 핸드고시로 문제를 풀어보세요")
                        .font(.custom("NotoSansKR-Regular", size: 15))
                }
                Spacer()
            }
            
        }
    }
}

struct MainViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainViewTwo()
        }
    }
}
