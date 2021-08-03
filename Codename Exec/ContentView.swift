//
//  ContentView.swift
//  Codename Exec
//
//  Created by Danny Makogon on 8/2/21.
//

import SwiftUI

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
                    print("Logged In")
                    print (user.username)
                    print (user.password)
                    
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

    


}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(ViewChanger: viewChanger())
    }
}
