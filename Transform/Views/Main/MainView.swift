//
//  MainView.swift
//  Transform
//
//  Created by SeongHoon Jang on 2022/10/13.
//

import SwiftUI
import Firebase

enum MenuList: String, CaseIterable {
    case todo = "To Do"
    case check = "내가 만든 설문"
}

struct MainView: View {
    @AppStorage("log_status") var log_Status = false
    @State var selectedTab = MenuList.todo.rawValue
    @Namespace var animation
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20){
                    HStack(spacing: 0){
                        TabBarButton(current: $selectedTab, item: "To Do", animation: animation)
                        TabBarButton(current: $selectedTab, item: "내가 만든 설문", animation: animation)
                    }

                    switch selectedTab {
                    case MenuList.todo.rawValue:
                        MainTodoView()
                    default:
                        MainCheckView()
                    }
                    
                    Spacer()
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Bamboothon")
                            .font(.custom(FontManager.Poppins.semibold, size: 20))
                            .foregroundColor(Color("accentYellow"))
                            .accessibilityAddTraits(.isHeader)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            
                        } label: {
                            NavigationLink(destination: EmptyView()) {
                                Image(systemName: "plus")
                                    .foregroundColor(Color("accentYellow"))
                            }
                        }
                    }
                }
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}