//
//  HomeView.swift
//  HomeView
//
//  Created by Danny Makogon on 8/3/21.
//

import SwiftUI
import Firebase
import UIKit
import Combine


struct HomeView: View {
    @ObservedObject var currentUser = User()
    
    @StateObject var ViewChanger: viewChanger
    @State var currentPage : Page = .HomeView
    var body: some View {
        Text(currentUser.username)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(ViewChanger: viewChanger())
    }
}
