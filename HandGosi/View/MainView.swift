//
//  MainView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var vm: MainVM
//    @EnvironmentObject var purchaseManager: PurchaseManager
    
    @State private var isloading = true
    
    // View Changer
    @State private var isClicked: Bool = false
    @State var goToNextView: Bool = false
    @State private var goToMyNote: Bool = false
    @State private var goToSettingView: Bool = false
    
    var body: some View {
        
        VStack {
            // Main View Contents
            NavigationView {
                List {
                    Section {
                        topView
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(0)
                    Section {
                        Button {
                            vm.filteredExams = vm.currentExams.filter({ aExam in
                                return aExam.year == 2023
                            })
                            goToNextView.toggle()
                        } label: {
                            YearCell(year: 2023)
                        }
                        Button {
                            vm.filteredExams = vm.currentExams.filter({ aExam in
                                return aExam.year == 2022
                            })
                            goToNextView.toggle()
                        } label: {
                            YearCell(year: 2022)
                        }
                        Button {
                            vm.filteredExams = vm.currentExams.filter({ aExam in
                                return aExam.year == 2021
                            })
                            goToNextView.toggle()
                        } label: {
                            YearCell(year: 2021)
                        }
                        Button {
                            vm.filteredExams = vm.currentExams.filter({ aExam in
                                return aExam.year == 2020
                            })
                            goToNextView.toggle()
                        } label: {
                            YearCell(year: 2020)
                        }
                        Button {
                            vm.filteredExams = vm.currentExams.filter({ aExam in
                                return aExam.year == 2019
                            })
                            goToNextView.toggle()
                        } label: {
                            YearCell(year: 2019)
                        }
                        Button {
                            vm.filteredExams = vm.currentExams.filter({ aExam in
                                return aExam.year == 2018
                            })
                            goToNextView.toggle()
                        } label: {
                            YearCell(year: 2018)
                        }
                        Button {
                            vm.filteredExams = vm.currentExams.filter({ aExam in
                                return aExam.year == 2017
                            })
                            goToNextView.toggle()
                        } label: {
                            YearCell(year: 2017)
                        }
                        Button {
                            vm.filteredExams = vm.currentExams.filter({ aExam in
                                return aExam.year == 2016
                            })
                            goToNextView.toggle()
                        } label: {
                            YearCell(year: 2016)
                        }
                        Button {
                            vm.filteredExams = vm.currentExams.filter({ aExam in
                                return aExam.year == 2015
                            })
                            goToNextView.toggle()
                        } label: {
                            YearCell(year: 2015)
                            
                        }
                        
                        
                    } header: {
                        Text("연도별 기출문제")
                            .font(.custom("NotoSansKR-Bold", size: 23))
                            .foregroundColor(Color.theme.myAccentColor)
                    }
                    .listStyle(.automatic)
                    .padding(0)
                }
                .padding(0)
                .background(
                    NavigationLink(isActive: $goToNextView, destination: { SubjectSelectView(exams: vm.filteredExams, navigationBool: $goToNextView) }, label: { EmptyView() })
                )
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
            
            
            
            
            // AD Banner
//            if !purchaseManager.purchasedProductIDs.contains("com.maru.handgosi4") {
//                BannerAdView(adUnitId: "ca-app-pub-1837011492216327/2493086106")
//            }
        }
        // Store Kit Task
//        .task {
//            do {
//                try await purchaseManager.loadProducts()
//            }
//            catch {
//                print(error)
//            }
//        }
        
    }
    
    var topView: some View {
        VStack {
            ZStack {
                Image("grabThePhone")
                    .resizable()
                    .scaledToFill()
                Text("HandGosi")
                    .font(.custom("GangwonEduPowerExtraBold", size: 40))
                    .foregroundColor(Color.white)
            }.listStyle(.plain)

            HStack {
                VStack(alignment: .leading, spacing: 7) {
                    Text("핸드고시")
                        .font(.custom("NotoSansKR-Bold", size: 23))
                    Text("공무원 시험 기출문제가 내 손안에\n언제 어디서든 핸드고시로 문제를 풀어보세요.")
                        .font(.custom("NotoSansKR-Regular", size: 16))
                }
                Spacer()
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MainVM())
            .environmentObject(PurchaseManager())
    }
}

struct YearCell: View {
    let year: Int
    
    var body: some View {
        HStack {
            Text("\(year.intToString())년")
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color(hex: 0x535455))
                .scaleEffect(0.8)
        }
        .foregroundColor(Color.theme.myAccentColor)

    }
}
