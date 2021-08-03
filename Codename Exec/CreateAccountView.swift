//
//  CreateAccountView.swift
//  CreateAccountView
//
//  Created by Danny Makogon on 8/2/21.
//

import SwiftUI
import CloudKit
import CoreData

struct CreateAccountView: View {
    @ObservedObject var user = User()
    let thisUserData = CKUserData()
    @StateObject var ViewChanger: viewChanger
    @State var currentPage : Page = .CreateAccountView
    
    var body: some View {
        Form{
            TextField("Username", text: $user.username)
            TextField("Password", text: $user.password)
            TextField("Repeat Password", text: $user.repeatedPassword)
            Section{
                Button(action: {
                    print (testCloudKit())
                    thisUserData.saveUsers(username: user.username,password: user.password)
                    
                }, label: {
                    Text("Create Account")
                }
                ).disabled(!user.creationIsValid())
            }

        }
    }
    func testCloudKit() -> Bool {
        if let _ = FileManager.default.ubiquityIdentityToken {
            return true
        } else {
            return false
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView(ViewChanger: viewChanger())
    }
}
