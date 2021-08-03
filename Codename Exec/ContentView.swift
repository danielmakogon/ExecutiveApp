//
//  ContentView.swift
//  Codename Exec
//
//  Created by Danny Makogon on 8/2/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @StateObject var ViewChanger: viewChanger
    @State var currentPage : Page = .ContentView
    
    @ObservedObject var user = User()
    
    var body: some View {
        
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            #if os(iOS)
//            EditButton()
//            #endif
//
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }
        Form{
            //for logging in
            TextField("Username", text: $user.username)
            TextField("Password", text: $user.password)
            Section{
                Button(action: {
                    print("attempting log in")
                    print (user.username)
                    print (user.password)
                    login(username: user.username, password: user.password)
                    
                    
                }, label: {
                    Text("Login")
                }
                ).disabled(!user.isValid())
            }
            Section{
                Button(action: {
                    ViewChanger.currentPage = .CreateAccountView
                    print("Clicked Create Account")
                    
                }, label: {
                    Text("Create Account")
                }
                )
            }
        }
        
        
    }
    func login(username: String, password: String) {
        //code for logging in
        
        Auth.auth().signIn(withEmail: username, password: password) {
            (result, error) in
            if error != nil {
                print("error signing in")
            } else {
                print("LOG IN WORKED!")
                ViewChanger.currentPage = .HomeView
            }
        }
    }
    
    
    


}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(ViewChanger: viewChanger())
    }
}
