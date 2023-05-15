//
//  MainView.swift
//  HandGosi
//
//  Created by Sy Lee on 2022/08/12.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var vm: MainVM
    @EnvironmentObject var purchaseManager: PurchaseManager
    
    @State private var isloading = true
    
    // View Changer
    @State private var isClicked: Bool = false
    @State var goToNextView: Bool = false
    @State private var goToMyNote: Bool = false
    @State private var goToSettingView: Bool = false
    
    var body: some View {
        
        VStack {
            NavigationView {
                ZStack {
                    Color.theme.myBackgroundColor.ignoresSafeArea()
                    VStack(spacing: 30) {
                        if isClicked {
                            HStack(spacing: 30) {
                                Button {
                                    vm.filteredExams = vm.currentExams.filter({ aExam in
                                        return aExam.year == 2022
                                    })
                                    goToNextView.toggle()
                                } label: {
                                    ZStack {
                                        ProgressCircle(degree: vm.percentage2022 * 3.6)
                                            .foregroundColor(.green)
                                            .frame(width: 45, height: 45)
                                        Text("2022")
                                            .yearText()
                                    }
                                }
                                Button {
                                    vm.filteredExams = vm.currentExams.filter({ aExam in
                                        return aExam.year == 2021
                                    })
                                    goToNextView.toggle()
                                } label: {
                                    ZStack {
                                        ProgressCircle(degree: vm.percentage2021 * 3.6)
                                            .foregroundColor(.green)
                                            .frame(width: 45, height: 45)
                                        Text("2021")
                                            .yearText()
                                    }
                                }
                            }
                            HStack(spacing: 30) {
                                Button {
                                    vm.filteredExams = vm.currentExams.filter({ aExam in
                                        return aExam.year == 2020
                                    })
                                    goToNextView.toggle()
                                } label: {
                                    ZStack {
                                        ProgressCircle(degree: vm.percentage2020 * 3.6)
                                            .foregroundColor(.green)
                                            .frame(width: 45, height: 45)
                                        Text("2020")
                                            .yearText()
                                    }
                                }
                                Button {
                                    vm.filteredExams = vm.currentExams.filter({ aExam in
                                        return aExam.year == 2019
                                    })
                                    goToNextView.toggle()
                                } label: {
                                    ZStack {
                                        ProgressCircle(degree: vm.percentage2019 * 3.6)
                                            .foregroundColor(.green)
                                            .frame(width: 45, height: 45)
                                        Text("2019")
                                            .yearText()
                                    }
                                }
                            }
                            
                        }
                        ZStack {
                            ZStack {
                                Image("HandGosiRed")
                                    .resizable()
                                Text("Click")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.theme.myAccentColor)
                                    .shadow(color: .white, radius: 10, x: 0, y: 5)
                            }
                            .frame(width: 100, height: 180)
                            .shadow(color: .red, radius: 10, x: 0, y: 5)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    isClicked.toggle()
                                }
                            }
                            .scaleEffect(isClicked ? 0.2 : 1.0)
                            
                            if isClicked {
                                HStack {
                                    Spacer()
                                        .frame(width: 40)
                                    Button {
                                        vm.filteredNotes = vm.myNotes
                                        goToMyNote.toggle()
                                    } label: {
                                        Text("오답\n노트")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .padding(20)
                                            .background(Circle().foregroundColor(.red).shadow(color: .red, radius: 10, x: 0, y: 10))
                                    }
                                    Spacer()
                                    Button {
                                        goToSettingView.toggle()
                                    } label: {
                                        VStack {
                                            Image(systemName: "gear")
                                                .resizable()
                                                .foregroundColor(.gray)
                                                .frame(width: 50, height: 50, alignment: .center)
                                        }
                                        
                                    }
                                    Spacer()
                                        .frame(width: 40)
                                    
                                }
                            }
                        }
                        if isClicked {
                            HStack(spacing: 30) {
                                Button {
                                    vm.filteredExams = vm.currentExams.filter({ aExam in
                                        return aExam.year == 2018
                                    })
                                    goToNextView.toggle()
                                } label: {
                                    ZStack {
                                        ProgressCircle(degree: vm.percentage2018 * 3.6)
                                            .foregroundColor(.green)
                                            .frame(width: 45, height: 45)
                                        Text("2018")
                                            .yearText()
                                    }
                                }
                                Button {
                                    vm.filteredExams = vm.currentExams.filter({ aExam in
                                        return aExam.year == 2017
                                    })
                                    goToNextView.toggle()
                                } label: {
                                    ZStack {
                                        ProgressCircle(degree: vm.percentage2017 * 3.6)
                                            .foregroundColor(.green)
                                            .frame(width: 45, height: 45)
                                        Text("2017")
                                            .yearText()
                                    }
                                }
                            }
                            HStack(spacing: 30) {
                                Button {
                                    vm.filteredExams = vm.currentExams.filter({ aExam in
                                        return aExam.year == 2016
                                    })
                                    goToNextView.toggle()
                                } label: {
                                    ZStack {
                                        ProgressCircle(degree: vm.percentage2016 * 3.6)
                                            .foregroundColor(.green)
                                            .frame(width: 45, height: 45)
                                        Text("2016")
                                            .yearText()
                                    }
                                }
                                Button {
                                    vm.filteredExams = vm.currentExams.filter({ aExam in
                                        return aExam.year == 2015
                                    })
                                    goToNextView.toggle()
                                } label: {
                                    ZStack {
                                        ProgressCircle(degree: vm.percentage2015 * 3.6)
                                            .foregroundColor(.green)
                                            .frame(width: 45, height: 45)
                                        Text("2015")
                                            .yearText()
                                    }
                                }
                            }
                        }
                    } // VStack
                    // Next View Setting
                    .background(
                        NavigationLink(isActive: $goToSettingView, destination: {
                            SettingView()
                        }, label: {
                            EmptyView()
                        })
                    )
                    .background(
                        NavigationLink(isActive: $goToMyNote, destination: { MyNoteSubjectSelectView(myNotes: vm.filteredNotes) }, label: {
                            EmptyView()
                        })
                    )
                    .background(
                        NavigationLink(isActive: $goToNextView, destination: { SubjectSelectView(exams: vm.filteredExams, navigationBool: $goToNextView) }, label: { EmptyView() })
                    )
                    .navigationBarHidden(true)
                    
                    
                    if isloading {
                        LoadingView(isLoading: $isloading)
                    }
                }
            } // NavigationView
            if !purchaseManager.purchasedProductIDs.contains("com.maru.handgosi4") {
                BannerAdView(adUnitId: "ca-app-pub-3940256099942544/2934735716")
            }
//            BannerAdView(adUnitId: "pub-1837011492216327")
        }
        .task {
            do {
                try await purchaseManager.loadProducts()
            }
            catch {
                print(error)
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
