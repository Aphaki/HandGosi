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
        ZStack {
            VStack {
                // Main View Contents
                NavigationView {
                    
                    List {
                        Section {
                            topView
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .listRowInsets(EdgeInsets())
                        }
                        Section {
                            Button {
                                vm.filteredExams = vm.currentExams.filter({ aExam in
                                    return aExam.year == 2023
                                })
                                goToNextView.toggle()
                            } label: {
                                
                                YearCell(year: 2023, degree: vm.percentage2023 * 3.6)
                            }
                            Button {
                                vm.filteredExams = vm.currentExams.filter({ aExam in
                                    return aExam.year == 2022
                                })
                                goToNextView.toggle()
                            } label: {
                                YearCell(year: 2022, degree: vm.percentage2022 * 3.6)
                            }
                            Button {
                                vm.filteredExams = vm.currentExams.filter({ aExam in
                                    return aExam.year == 2021
                                })
                                goToNextView.toggle()
                            } label: {
                                YearCell(year: 2021, degree: vm.percentage2021 * 3.6)
                            }
                            Button {
                                vm.filteredExams = vm.currentExams.filter({ aExam in
                                    return aExam.year == 2020
                                })
                                goToNextView.toggle()
                            } label: {
                                YearCell(year: 2020, degree: vm.percentage2020 * 3.6)
                            }
                            Button {
                                vm.filteredExams = vm.currentExams.filter({ aExam in
                                    return aExam.year == 2019
                                })
                                goToNextView.toggle()
                            } label: {
                                YearCell(year: 2019, degree: vm.percentage2019 * 3.6)
                            }
                            Button {
                                vm.filteredExams = vm.currentExams.filter({ aExam in
                                    return aExam.year == 2018
                                })
                                goToNextView.toggle()
                            } label: {
                                YearCell(year: 2018, degree: vm.percentage2018 * 3.6)
                            }
                            Button {
                                vm.filteredExams = vm.currentExams.filter({ aExam in
                                    return aExam.year == 2017
                                })
                                goToNextView.toggle()
                            } label: {
                                YearCell(year: 2017, degree: vm.percentage2017 * 3.6)
                            }
                            Button {
                                vm.filteredExams = vm.currentExams.filter({ aExam in
                                    return aExam.year == 2016
                                })
                                goToNextView.toggle()
                            } label: {
                                YearCell(year: 2016, degree: vm.percentage2016 * 3.6)
                            }
                            Button {
                                vm.filteredExams = vm.currentExams.filter({ aExam in
                                    return aExam.year == 2015
                                })
                                goToNextView.toggle()
                            } label: {
                                YearCell(year: 2015, degree: vm.percentage2015 * 3.6)
                                
                            }
                            
                            
                        } header: {
                            Text("연도별 기출문제")
                                .font(.custom("NotoSansKR-Bold", size: 22))
                                .foregroundColor(Color.theme.myAccentColor)
                        }
                        .listStyle(.automatic)
                        .padding(0)
                    }
                    .padding(0)
                    .background(
                        NavigationLink(isActive: $goToNextView, destination: { SubjectSelectView(exams: vm.filteredExams, navigationBool: $goToNextView) }, label: { EmptyView() })
                    )
                    .background(
                        NavigationLink(isActive: $goToMyNote, destination: { MyNoteSubjectSelectView(myNotes: vm.filteredNotes) }, label: {
                            EmptyView()
                        })
                    )
                    .background(
                        NavigationLink(isActive: $goToSettingView, destination: {
                            SettingView()
                        }, label: {
                            EmptyView()
                        })
                    )

                    .navigationBarTitle("핸드고시")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                vm.filteredNotes = vm.myNotes
                                goToMyNote.toggle()
                            } label: {
                                Image("NoteIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 30)
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                goToSettingView.toggle()
                            } label: {
                                Image("SettingIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 23, height: 23)
                            }

                            
                        }
                    }
                    
                }
                
                
                
                
                // AD Banner
    //            if !purchaseManager.purchasedProductIDs.contains("com.maru.handgosi4") {
    //                BannerAdView(adUnitId: "ca-app-pub-1837011492216327/2493086106")
    //            }
            }
            if vm.firstLoad {
                GuideView(toMain: true)
            }
            if isloading {
                LoadingView(isLoading: $isloading)
            }
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
                Image("PeopleGrabPhone")
                    .resizable()
                    .scaledToFill()
                Text("HandGosi")
                    .font(.custom("GangwonEduPowerExtraBold", size: 43))
                    .foregroundColor(Color.white)
            }.listStyle(.plain)
            HStack {
                VStack(alignment: .leading, spacing: 7) {
                    Text("공무원 시험 기출문제가 내 손안에")
                        .font(.custom("NotoSansKR-Bold", size: 22))
                    Text("핸드고시로 언제 어디서든 기출 문제를 풀고 틀린 문제는 오답노트에 저장해 보세요.")
                        .font(.custom("NotoSansKR-Regular", size: 16))
                }
                Spacer()
            }
            .padding(.bottom, 10)
            .padding(.trailing, 10)
            .padding(.leading, 20)
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MainVM())
//            .environmentObject(PurchaseManager())
    }
}

struct YearCell: View {
    let year: Int
    let degree: Double
    
    var body: some View {
        HStack {
            Text("\(year.intToString())년")
            Spacer()
            ProgressCircleView(degree: degree)
                .frame(width: 10, height: 10)
                .padding(.trailing, 10)
            Image(systemName: "chevron.right")
                .foregroundColor(Color.theme.chevronColor)
                .scaleEffect(0.8)
        }
        .foregroundColor(Color.theme.myAccentColor)

    }
}

/*

 */
