//
//  MainView.swift
//  MainView
//
//  Created by Danny Makogon on 8/2/21.
//

import SwiftUI

struct MainView: View {
    @StateObject var ViewChanger: viewChanger
    @State var currentPage : Page = .ContentView
    var body: some View {
        switch ViewChanger.currentPage {
        case .ContentView:
                ContentView(ViewChanger: ViewChanger)
                    
        case .CreateAccountView:
            CreateAccountView(ViewChanger: ViewChanger)
                
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(ViewChanger: viewChanger())
    }
}
