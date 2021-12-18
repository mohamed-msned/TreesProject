//
//  FetchUsers.swift
//  Shatlah
//
//  Created by Wejdan Alkhaldi on 13/05/1443 AH.
//

import UIKit

import UIKit
import Firebase
class FetchUsers: UIViewController {
    var users = [User]()
    private let db = Firestore.firestore()
    func fetchData(){
        db.collection("Users").addSnapshotListener { (QuerySnapshot, error) in
            guard let document = QuerySnapshot?.documents else{
                return
            }
            self.users = document.map({ (QueryDocumentSnapshot) -> User in
                let data = QueryDocumentSnapshot.data()
                let id = data["userID"] as? String ?? ""
                let firstname = data["firstName"] as? String ?? "NO VALUE"
                let lastname = data["lastName"] as? String ?? "NO VALUE"
                let email = data["email"] as? String ?? "NO VALUE"
                let image = data["profilePic"] as? Data ?? Data()
                return User(id: id,firstname: firstname, lastname: lastname,email: email,image: image)
            })
        }
    }
}
struct User: Identifiable {
    var id : String = UUID().uuidString
    var firstname : String
    var lastname : String
    var email : String
    var image : Data
}
