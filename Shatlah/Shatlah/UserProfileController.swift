//
//  UserProfileController.swift
//  Shatlah
//
//  Created by Wejdan Alkhaldi on 13/05/1443 AH.
//

import UIKit
import Firebase
import SwiftUI
class UserProfileController: UIViewController {
    
    let db = Firestore.firestore()
    let userID = Auth.auth().currentUser?.uid
    var users = FetchUsers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //query read of FirstName and Email
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.db.collection("Users")
                    .whereField("userID", isEqualTo: self.userID as Any)
                    .getDocuments { querySnapshot, error in
                        if let error = error{
                            print("wrong read!!")
                            print(error.localizedDescription)
                        }else {
                            guard querySnapshot != nil else{return}
                            for document in querySnapshot!.documents{
                                let data = document.data()
                                print(data["displayName"] as? String ?? "")
                                print(data["email"] as? String ?? "")
                                self.nameuser.text = data["displayName"] as? String ?? ""
                                self.userEmail.text = data["email"] as? String ?? ""
                                
                            }
                        }
                    }
            }
        }
        
        
        //views
        view.backgroundColor = .white
        view.addSubview(profilePhoto)
        //
        view.addSubview(nameuser)
        //
        view.addSubview(userEmail)
        //
        view.addSubview(logout)
        //
        view.addSubview(contact)
        //
        view.addSubview(nameuser)
        //
        view.addSubview(numorder)
        //
        view.addSubview(titlepage)
        //
        view.addSubview(title2)
        //
        view.addSubview(title3)
        // constraints
        setupView()
        
        
    }
    //constraints
    func setupView() {
        NSLayoutConstraint.activate([
            profilePhoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            profilePhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160),
            profilePhoto.heightAnchor.constraint(equalToConstant: 90),
            profilePhoto.widthAnchor.constraint(equalToConstant: 100),
            //
            nameuser.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 280),
            nameuser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            nameuser.heightAnchor.constraint(equalToConstant: 50),
            nameuser.widthAnchor.constraint(equalToConstant: 200),
            //
            userEmail.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 350 ),
            userEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            userEmail.heightAnchor.constraint(equalToConstant: 50),
            userEmail.widthAnchor.constraint(equalToConstant: 200),
            //
            numorder.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 480),
            numorder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            numorder.heightAnchor.constraint(equalToConstant: 50),
            numorder.widthAnchor.constraint(equalToConstant: 200),
            //
            contact.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 550),
            contact.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130),
            contact.heightAnchor.constraint(equalToConstant: 30),
            contact.widthAnchor.constraint(equalToConstant: 160),
            //
            logout.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600),
            logout.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130),
            logout.heightAnchor.constraint(equalToConstant: 30),
            logout.widthAnchor.constraint(equalToConstant: 160),
            //
            titlepage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            titlepage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110),
            titlepage.heightAnchor.constraint(equalToConstant: 50),
            titlepage.widthAnchor.constraint(equalToConstant: 200),
            //
            title2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            title2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            title2.heightAnchor.constraint(equalToConstant: 50),
            title2.widthAnchor.constraint(equalToConstant: 200),
            //
            title3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 320),
            title3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            title3.heightAnchor.constraint(equalToConstant: 50),
            title3.widthAnchor.constraint(equalToConstant: 200),
            
            
        ])
    }
    // for twitter account display
    func openUrl(url:String){
        guard let url = URL(string: url) else {return}
        UIApplication.shared.open(url, options: [:])
        
    }
    
    
    
    
    let profilePhoto : UIImageView = {
        let profilePhoto = UIImageView()
        profilePhoto.translatesAutoresizingMaskIntoConstraints = false
        profilePhoto.image = UIImage(named : "personp")
        profilePhoto.layer.cornerRadius = profilePhoto.frame.height / 2
        profilePhoto.clipsToBounds = true
        profilePhoto.contentMode = .scaleToFill
        return profilePhoto
    } ()
    let titlepage : UILabel = {
        let titlepage = UILabel()
        titlepage.translatesAutoresizingMaskIntoConstraints = false
        titlepage.textAlignment = .center
        titlepage.text = "المعلومات الشخصية"
        titlepage.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        titlepage.font = .boldSystemFont(ofSize: 16)
        return titlepage
    } ()
    let userEmail : UILabel = {
        let userEmail = UILabel()
        userEmail.translatesAutoresizingMaskIntoConstraints = false
        userEmail.textAlignment = .center
        userEmail.textColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.6434188742)
        userEmail.font = .boldSystemFont(ofSize: 18)
        return userEmail
    }()
    let title2 : UILabel = {
        let title2 = UILabel()
        title2.translatesAutoresizingMaskIntoConstraints = false
        title2.textAlignment = .center
        title2.text = "اسم المستخدم:"
        title2.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        title2.font = .boldSystemFont(ofSize: 18)
        return title2
    } ()
    let title3 : UILabel = {
        let title3 = UILabel()
        title3.translatesAutoresizingMaskIntoConstraints = false
        title3.textAlignment = .center
        title3.text = "حساب الإيميل:"
        title3.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        title3.font = .boldSystemFont(ofSize: 18)
        return title3
    } ()
    let nameuser : UILabel = {
        let nameuser = UILabel()
        nameuser.translatesAutoresizingMaskIntoConstraints = false
        nameuser.textAlignment = .center
        nameuser.textColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.6434188742)
        nameuser.font = .boldSystemFont(ofSize: 16)
        return nameuser
    }()
    
    let numorder : UILabel = {
        let numorder = UILabel()
        numorder.translatesAutoresizingMaskIntoConstraints = false
        numorder.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        numorder.text = "عدد الطلبات ٢"
        numorder.font = .italicSystemFont(ofSize: 20)
        return numorder
    }()
    
    let logout : UIButton = {
        let logout = UIButton()
        logout.translatesAutoresizingMaskIntoConstraints = false
        logout.backgroundColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        logout.setTitle("تسجيل الخروج", for: .normal)
        logout.setTitleColor(.white, for: .normal)
        logout.layer.cornerRadius = 15
        logout.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 20)
        logout.addTarget(self, action: #selector(louOut), for: .touchDown)
        return logout
    }()
    
    let contact : UIButton = {
        let contact = UIButton()
        contact.translatesAutoresizingMaskIntoConstraints = false
        contact.backgroundColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        contact.setTitle("تواصل معنا", for: .normal)
        contact.setTitleColor(.white, for: .normal)
        contact.layer.cornerRadius = 15
        contact.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 20)
        contact.addTarget(self, action: #selector(contactus), for: .touchDown)
        return contact
    }()
    
    // buttonacttion twitter account display
    @objc func contactus(){
        openUrl(url: "https://twitter.com/shatlah__app")
        
    }

    //buttonacttion
    @objc func louOut(){
        
        let LoginViewController = LoginViewController()
        let alert = UIAlertController(title: nil, message: "هل أنت متأكد تريد تسجيل الخروج ؟", preferredStyle: .alert)
        let action = UIAlertAction(title: "تسجيل الخروج", style: .destructive) {_ in
            do {
                try Auth.auth().signOut()
                LoginViewController.modalPresentationStyle = .fullScreen
                self.present(LoginViewController, animated: true, completion: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "الغاء", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
}

