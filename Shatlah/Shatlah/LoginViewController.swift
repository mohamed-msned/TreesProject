//
//  LoginViewController.swift
//  Shatlah
//
//  Created by Amal on 15/12/2021.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {
  //  let appDellegat : AppDelegate? = nil
   // let user = Auth.auth().currentUser
//    lazy var appName : UILabel = {
//        $0.numberOfLines = 0
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.text = "Timeline App"
//
//        $0.textColor = .black
//        $0.textAlignment = .left
//        $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
//        return $0
//    }(UILabel())
//
//    lazy var logo : UIImageView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.image = UIImage(named: "87-870269_taking-deep-breaths-time-frame-clipart")
//        $0.tintColor = .white
//        return $0
//    }(UIImageView())
//
//    lazy var email : UITextField = {
//        $0.placeholder = "Email"
//        $0.text = "ccsi-iuni@hotmail.com"
//        $0.borderStyle = .roundedRect
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        return $0
//    }(UITextField())
//
//    lazy var password : UITextField = {
//        $0.placeholder = "Password"
//        $0.text = "123456"
//        $0.borderStyle = .roundedRect
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        return $0
//    }(UITextField())
//
//    lazy var signIn : UIButton = {
//        $0.setTitle("Login", for: .normal)
//        $0.tintColor = .black
//        $0.titleLabel?.font =  UIFont.systemFont(ofSize: 14, weight: .bold)
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.setBackgroundImage(UIImage(named: "btn"), for: .normal)
//        $0.addTarget(self, action: #selector(signInBtnClick), for: .touchDown)
//        return $0
//    }(UIButton(type: .system))
//
//    lazy var signUpLabel : UILabel = {
//        $0.numberOfLines = 0
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.text = "Don't have an account?"
//        $0.textColor = .black
//        $0.textAlignment = .left
//        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
//
//        return $0
//    }(UILabel())
//    lazy var signUp : UIButton = {
//        $0.setTitle("signUp", for: .normal)
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
//        $0.tintColor = .black
//        $0.addTarget(self, action: #selector(signUpBtnClick), for: .touchDown)
//        return $0
//    }(UIButton(type: .system))
//
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        print("I am LoginViewController")
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .darkGray
//        uiSettings()
//
//        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//        view.addGestureRecognizer(tap)
//        // observe the keyboard status. If will show, the function (keyboardWillShow) will be excuted.
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        // observe the keyboard status. If will Hide, the function (keyboardWillHide) will be excuted.
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//        // Do any additional setup after loading the view.
//    }
//
//    func uiSettings(){
//        [appName,logo,email,password,signIn,signUpLabel,signUp].forEach{view.addSubview($0)}
//        NSLayoutConstraint.activate([
//        appName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 150),
//        appName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//        logo.topAnchor.constraint(equalTo: appName.bottomAnchor,constant: 20),
//        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        logo.heightAnchor.constraint(equalToConstant: 230),
//        logo.widthAnchor.constraint(equalToConstant: 200),
//
//        email.topAnchor.constraint(equalTo: logo.bottomAnchor,constant: 40),
//        email.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        email.widthAnchor.constraint(equalToConstant: 300),
//
//        password.topAnchor.constraint(equalTo: email.bottomAnchor,constant: 20),
//        password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        password.widthAnchor.constraint(equalToConstant: 300),
//
//        signIn.topAnchor.constraint(equalTo: password.bottomAnchor,constant: 20),
//        signIn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        signIn.heightAnchor.constraint(equalToConstant: 50),
//        signIn.widthAnchor.constraint(equalToConstant: 300),
//
//        signUpLabel.topAnchor.constraint(equalTo: signIn.bottomAnchor,constant: 20),
//        signUpLabel.leadingAnchor.constraint(equalTo: signIn.leadingAnchor,constant: 40),
//
//        signUp.firstBaselineAnchor.constraint(equalTo: signUpLabel.firstBaselineAnchor),
//        signUp.leadingAnchor.constraint(equalTo: signUpLabel.trailingAnchor,constant: 10)
//
//        ])
//    }
    // *************************************************
    let textField1 = UITextField()
    let textField2 = UITextField()
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
        
        // first textField
        textField1.frame = CGRect(x: 35, y: 465, width: 320, height: 45)
        textField1.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        ImgeInTextField(textField: textField1, fieldImge: textField1Image!)
        textField1.font = UIFont(name: "GillSans-Italic", size: 15)
        textField1.placeholder = "| Enter your name" // display when click on it
        textField1.layer.cornerRadius = 25
        view.addSubview(textField1)
        
        // second textField
        textField2.frame = CGRect(x: 35, y: 560, width: 320, height: 45)
        textField2.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        ImgeInTextField(textField: textField2, fieldImge: textField2Image!)
        textField2.font = UIFont(name: "GillSans-Italic", size: 15)
        textField2.placeholder = "| Enter your password" // display when click on it
        textField2.layer.cornerRadius = 25
        textField2.isSecureTextEntry = true
        view.addSubview(textField2)
        
        // button sign in
        button.frame = CGRect(x: 75, y: 625, width: 230, height: 50)
        button.layer.cornerRadius = 25
        button.backgroundColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 25)
        view.addSubview(button)
        button.addTarget(self, action: #selector (signInBtnClick), for: .touchDown)
        
        // button2 sign up
        button2.frame = CGRect(x: 170, y: 760, width: 230, height: 50)
        button2.layer.cornerRadius = 25
        button2.setTitleColor( #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1) , for: .normal)
        button2.setTitle("sign up", for: .normal)
        button2.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 23)
        view.addSubview(button2)
        button2.addTarget(self, action: #selector (signUpBtnClick), for: .touchDown)
        
        // title label
        label.frame = CGRect(x: 0, y: 330, width: 200, height: 50)
        label.text = "Sign In"
        label.font = UIFont(name: "GillSans-Italic", size: 40)
        label.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        label.textAlignment = .center
        view.addSubview(label)
        
        //second label
        label2.frame = CGRect(x: 45, y: 420, width: 200, height: 50)
        label2.text = "Email"
        label2.font = UIFont(name: "GillSans-Italic", size: 19)
        label2.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label2)
        
        //first label
        label1.frame = CGRect(x: 45, y: 515, width: 200, height: 50)
        label1.text = "Password"
        label1.font = UIFont(name: "GillSans-Italic", size: 19)
        label1.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label1)
        
        //third label
        label3.frame = CGRect(x: 60, y: 760, width: 200, height: 50)
        label3.text = "Don't have an account ?"
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

    
    // next View Controller
//    @objc func isAction(){
//        let vc = UserInfoScreen()
//        let navController = UINavigationController(rootViewController: vc)
//        navController.modalPresentationStyle = .fullScreen
//        present(navController, animated: true, completion: nil)
//        vc.myLabel.text = "\(textField1.text ?? " ")'s Photo"
//    }
    
    // *************************************************

    override func viewDidLoad() {
        super.viewDidLoad()
        ui()
// ******************
//        view.backgroundColor = .darkGray
//        uiSettings()
//        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//        view.addGestureRecognizer(tap)
//        // observe the keyboard status. If will show, the function (keyboardWillShow) will be excuted.
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        // observe the keyboard status. If will Hide, the function (keyboardWillHide) will be excuted.
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//        // Do any additional setup after loading the view.
    }
   
//    func uiSettings(){
//        [appName,logo,email,password,signIn,signUpLabel,signUp].forEach{view.addSubview($0)}
//        NSLayoutConstraint.activate([
//        appName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 150),
//        appName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//        logo.topAnchor.constraint(equalTo: appName.bottomAnchor,constant: 20),
//        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        logo.heightAnchor.constraint(equalToConstant: 230),
//        logo.widthAnchor.constraint(equalToConstant: 200),
//
//        email.topAnchor.constraint(equalTo: logo.bottomAnchor,constant: 40),
//        email.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        email.widthAnchor.constraint(equalToConstant: 300),
//
//        password.topAnchor.constraint(equalTo: email.bottomAnchor,constant: 20),
//        password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        password.widthAnchor.constraint(equalToConstant: 300),
//
//        signIn.topAnchor.constraint(equalTo: password.bottomAnchor,constant: 20),
//        signIn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        signIn.heightAnchor.constraint(equalToConstant: 50),
//        signIn.widthAnchor.constraint(equalToConstant: 300),
//
//        signUpLabel.topAnchor.constraint(equalTo: signIn.bottomAnchor,constant: 20),
//        signUpLabel.leadingAnchor.constraint(equalTo: signIn.leadingAnchor,constant: 40),
//
//        signUp.firstBaselineAnchor.constraint(equalTo: signUpLabel.firstBaselineAnchor),
//        signUp.leadingAnchor.constraint(equalTo: signUpLabel.trailingAnchor,constant: 10)
//
//        ])
//    }
    
    @objc func signInBtnClick(){
        Auth.auth().signIn(withEmail: textField1.text!, password: textField2.text!) { result, error in
            if let error = error{
                print(error)
            }else{
                let dashBoard = DashboardTabBarController()
                dashBoard.modalPresentationStyle = .fullScreen
                self.present(dashBoard, animated: true, completion: nil)
               // self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func signUpBtnClick(){
        let signUpVC = SignUpViewController()
        signUpVC.modalPresentationStyle = .fullScreen
        self.present(signUpVC, animated: true , completion: nil)
    }
    
//    // Move lofin view 300 points upward
//    @objc func keyboardWillShow(sender: NSNotification) {
//         self.view.frame.origin.y = -300
//    }
//
//    // Move login view to original position
//    @objc func keyboardWillHide(sender: NSNotification) {
//         self.view.frame.origin.y = 0
//    }
//
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
}
