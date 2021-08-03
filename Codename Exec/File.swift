////
////  File.swift
////  File
////
////  Created by Danny Makogon on 8/2/21.
////
//
//import Foundation
//import Combine
//import Firebase
//import UIKit
//import SwiftUI
//
//class CKUserData {
//
//    @ObservedObject var user = User()
//
//    var users: [User] = []
//
//    static let shared = CKUserData()
//
//    let privateDB : CKDatabase = CKContainer.default().privateCloudDatabase
//
//    func addUser(Username: String, Password: String) {
//        user.username = Username
//        user.password = Password
//        users.append(user)
//    }
//
//    func saveUsers(username: String, password: String) {
//        print ("saving users...")
//
//        let record = CKRecord(recordType: "User")
//
//        record.setObject(username as CKRecordValue?, forKey: "username")
//        record.setObject(password as CKRecordValue?, forKey: "password")
//        privateDB.save(record) {
//            (savedRecord: CKRecord?, error: Error?) -> Void in
//            if error == nil{
//                print ("saved")
//            }
//            else {
//                print ("unable to save")
//            }
//        }
//
//    }
//
//    func loadUsers() {
//        print ("loading users from CloudKit")
//
//        let predicate = NSPredicate(value: true)
//        let query = CKQuery(recordType: "User", predicate: predicate)
//        privateDB.perform(query, inZoneWith: nil) { (records: [CKRecord]?, error: Error?) in
//            if error == nil {
//                guard let records = records else
//                {
//                    print ("no records")
//                    return
//                }
//                for record in records {
//                    let username = record.object(forKey: "username") as! String
//                    let password = record.object(forKey: "password") as! String
//                    print ("\(String(describing: username)), \(String(describing: password))")
//                    self.addUser(Username: username, Password: password)
//                }
//            }
//            else{
//                print ("Error with CloudKit")
//            }
//        }
//        print("Loading Complete")
//    }
//
//}
//
//
