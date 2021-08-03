//
//  CreateAccountView.swift
//  CreateAccountView
//
//  Created by Danny Makogon on 8/2/21.
//

import SwiftUI
import CloudKit
import CoreData
import Firebase

struct CreateAccountView: View {
    @ObservedObject var user = User()
    @ObservedObject var currentUser = CurrentUser()
    //let thisUserData = CKUserData()
    @StateObject var ViewChanger: viewChanger
    @State var currentPage : Page = .CreateAccountView
    
    var body: some View {
        Form{
            TextField("Username", text: $user.username)
            TextField("Password", text: $user.password)
            TextField("Repeat Password", text: $user.repeatedPassword)
            Section{
                Button(action: {
                    print("creating user...")
                    signUp(username: user.username, password: user.password)
                    ViewChanger.currentPage = .ContentView
                    
                    //print (testCloudKit())
                    //thisUserData.saveUsers(username: user.username,password: user.password)
                    
                }, label: {
                    Text("Create Account")
                }
                ).disabled(!user.creationIsValid())
            }

        }
    }
    func signUp(username: String, password: String){
        
        
        Auth.auth().createUser(withEmail: username, password: password) { (result, error) in
            if error != nil{
                print("error signing up")
                return
            } else {
                print("SIGN UP WORKED!")
            }
        }
    }
    
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView(ViewChanger: viewChanger())
    }
}
