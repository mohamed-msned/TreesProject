//
//  SignUpViewController.swift
//  Shatlah
//
//  Created by Abdullah Alnutayfi on 15/12/2021.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController {
    let db = Firestore.firestore()

    // *************************************************
    let email = UITextField()
//    let firstName = UITextField()
    let fullName = UITextField()
    let password = UITextField()
//    let textField5 = UITextField()

    let button = UIButton()
    let button2 = UIButton()
    let label = UILabel()
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let imageView1 = UIImageView(image: UIImage(named: "plant1"))
    let imageView2 = UIImageView(image: UIImage(named: "plant2"))
    let imageView3 = UIImageView(image: UIImage(named: "plant3"))

    let textField1Image = UIImage(systemName: "person.fill")
    let textField2Image = UIImage(systemName: "lock.fill")
    
    func ui(){
        
        // backgroundColor
        view.backgroundColor = #colorLiteral(red: 0.8890833521, green: 0.8847882635, blue: 0.8933784408, alpha: 1)
        
        // white view
        let subView = UIView()
        subView.backgroundColor = .white
        subView.frame = CGRect(x: 0, y: 285, width: 390, height: 1500)
        subView.layer.cornerRadius = 30
        view.addSubview(subView)

        // Image 1
        imageView1.frame = CGRect(x: 30, y: 70, width: 130, height: 240)
        view.addSubview(imageView1)
        // Image 2
        imageView2.frame = CGRect(x: 130, y: 90, width: 120, height: 250)
        view.addSubview(imageView2)
        // Image 3
        imageView3.frame = CGRect(x: 250, y: 90, width: 100, height: 240)
        view.addSubview(imageView3)
        
        //first label (email)
        label1.frame = CGRect(x: 45, y: 370, width: 200, height: 50)
        label1.text = "Email"
        label1.font = UIFont(name: "GillSans-Italic", size: 19)
        label1.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label1)
        
        //second label (name)
        label2.frame = CGRect(x: 45, y: 445, width: 200, height: 50)
        label2.text = "Name"
        label2.font = UIFont(name: "GillSans-Italic", size: 19)
        label2.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label2)
        
        //third label (password)
        label3.frame = CGRect(x: 45, y: 370, width: 200, height: 50)
        label3.text = "Password"
        label3.font = UIFont(name: "GillSans-Italic", size: 19)
        label3.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label3)
        
        // first textField (email)
        email.frame = CGRect(x: 35, y: 410, width: 320, height: 45)
        email.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        ImgeInTextField(textField: email, fieldImge: textField1Image!)
        email.font = UIFont(name: "GillSans-Italic", size: 15)
        email.placeholder = "| Enter your email" // display when click on it
        email.layer.cornerRadius = 25
        view.addSubview(email)
//
//        // second textField (first name)
//        firstName.frame = CGRect(x: 35, y: 450, width: 320, height: 45)
//        firstName.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
//        ImgeInTextField(textField: firstName, fieldImge: textField2Image!)
//        firstName.font = UIFont(name: "GillSans-Italic", size: 15)
//        firstName.placeholder = "| Enter your first name" // display when click on it
//        firstName.layer.cornerRadius = 25
//        firstName.isSecureTextEntry = true
//        view.addSubview(firstName)
        
        // third textField (full name)
        fullName.frame = CGRect(x: 35, y: 485, width: 320, height: 45)
        fullName.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        ImgeInTextField(textField: fullName, fieldImge: textField1Image!)
        fullName.font = UIFont(name: "GillSans-Italic", size: 15)
        fullName.placeholder = "| Enter your full name" // display when click on it
        fullName.layer.cornerRadius = 25
        view.addSubview(fullName)
        
        // fourth textField (password)
        password.frame = CGRect(x: 35, y: 560, width: 320, height: 45)
        password.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        ImgeInTextField(textField: password, fieldImge: textField2Image!)
        password.font = UIFont(name: "GillSans-Italic", size: 15)
        password.placeholder = "| Enter your password" // display when click on it
        password.layer.cornerRadius = 25
        password.isSecureTextEntry = true
        view.addSubview(password)

//        // fifth textField ( password confirm)
//        textField5.frame = CGRect(x: 35, y: 600, width: 320, height: 45)
//        textField5.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
//        ImgeInTextField(textField: textField5, fieldImge: textField2Image!)
//        textField5.font = UIFont(name: "GillSans-Italic", size: 15)
//        textField5.placeholder = "| Enter your password confirm" // display when click on it
//        textField5.layer.cornerRadius = 25
//        textField5.isSecureTextEntry = true
//        view.addSubview(textField5)
        
        // button sign in
        button.frame = CGRect(x: 75, y: 660, width: 230, height: 50)
        button.layer.cornerRadius = 25
        button.backgroundColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 25)
        view.addSubview(button)
        button.addTarget(self, action: #selector (signUpInBtnClick), for: .touchDown)
        
        // button2 sign up
        button2.frame = CGRect(x: 150, y: 760, width: 230, height: 50)
        button2.layer.cornerRadius = 25
        button2.setTitleColor( #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1) , for: .normal)
        button2.setTitle("sign in", for: .normal)
        button2.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 25)
        view.addSubview(button2)
        button2.addTarget(self, action: #selector (cancelCreatingNewUser), for: .touchDown)
        
        // title label
        label.frame = CGRect(x: 0, y: 320, width: 200, height: 50)
        label.text = "Sign Up"
        label.font = UIFont(name: "GillSans-Italic", size: 40)
        label.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        label.textAlignment = .center
        view.addSubview(label)
        
        //third label
        label3.frame = CGRect(x: 80, y: 760, width: 200, height: 50)
        label3.text = "Have an account ?"
        label3.font = UIFont(name: "GillSans-Italic", size: 19)
        label3.textColor = .gray
        view.addSubview(label3)
    }
    
    // Def image for text field
    @objc func ImgeInTextField(textField: UITextField, fieldImge img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 500 , height: 100 ))
        leftImageView.image = img
        leftImageView.tintColor = .gray
        textField.leftView = leftImageView
        textField.leftViewMode = .always
    }
    
    // hide the status
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ui()
      //  view.backgroundColor = .darkGray
        title = "Creating a new account"
     //   setUpUI()
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//        view.addGestureRecognizer(tap)
//
//        // observe the keyboard status. If will show, the function (keyboardWillShow) will be excuted.
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        // observe the keyboard status. If will Hide, the function (keyboardWillHide) will be excuted.
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//        // Do any additional setup after loading the view.
//
//        // Do any additional setup after loading the view.
    }
    
//    private func setUpUI(){
//        [profilePic,email,firstName,lastName,password,passwordConfirm,signUp,cancelBtn].forEach{view.addSubview($0)}
//
//        NSLayoutConstraint.activate([
//            profilePic.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
//            profilePic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            profilePic.heightAnchor.constraint(equalToConstant: 200),
//            profilePic.widthAnchor.constraint(equalToConstant: 200),
//
//            email.topAnchor.constraint(equalTo: profilePic.bottomAnchor,constant: 20),
//            email.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            email.widthAnchor.constraint(equalToConstant: 300),
//
//            firstName.topAnchor.constraint(equalTo: email.bottomAnchor,constant: 20),
//            firstName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            firstName.widthAnchor.constraint(equalToConstant: 300),
//
//            lastName.topAnchor.constraint(equalTo: firstName.bottomAnchor,constant: 20),
//            lastName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            lastName.widthAnchor.constraint(equalToConstant: 300),
//
//            password.topAnchor.constraint(equalTo: lastName.bottomAnchor,constant: 20),
//            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            password.widthAnchor.constraint(equalToConstant: 300),
//
//            passwordConfirm.topAnchor.constraint(equalTo: password.bottomAnchor,constant: 20),
//            passwordConfirm.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            passwordConfirm.widthAnchor.constraint(equalToConstant: 300),
//
//            signUp.topAnchor.constraint(equalTo: passwordConfirm.bottomAnchor,constant: 20),
//            signUp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            signUp.widthAnchor.constraint(equalToConstant: 300),
//            signUp.heightAnchor.constraint(equalToConstant: 50),
//
//            cancelBtn.topAnchor.constraint(equalTo: signUp.bottomAnchor,constant: 20),
//            cancelBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            cancelBtn.widthAnchor.constraint(equalToConstant: 300),
//            cancelBtn.heightAnchor.constraint(equalToConstant: 50)
//
//
//
//
//        ])
//    }
    

    
    @objc private func signUpInBtnClick(){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { result, error in
            if let error = error{
                print(error)
            }else{
               
                let data : [String: Any] = ["fullName":self.fullName.text!,"email":self.email.text!,"userID":Auth.auth().currentUser!.uid , "displayName" : self.fullName.text!] // displayName
                
                self.db.collection("Users").addDocument(data: data) { error in
                    if let error = error{
                        print(error)
                    }else{
                        let tabView = DashboardTabBarController()
                        self.navigationController?.present(tabView, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @objc private func selectImageBtnClick(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .photoLibrary
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    @objc private func cancelCreatingNewUser(){
        self.dismiss(animated: true, completion: nil)
    }
    
    // Move lofin view 300 points upward
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -300
    }

    // Move login view to original position
    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func convertImage(image : UIImage) -> Data{
        return image.jpegData(compressionQuality: 0.1) ?? Data()
    }
}

extension SignUpViewController:UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else {
            print("No image found")
            return
        }
        print("###########")
     //   profilePic.setBackgroundImage(image, for: .normal)
     //   self.proImage = image
       
    }
}
