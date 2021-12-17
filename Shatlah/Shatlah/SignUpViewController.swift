




import UIKit
import Firebase
class SignUpViewController: UIViewController {
//    var checked = false
    let db = Firestore.firestore()
    
    // *************************************************
    let email = UITextField()
    //    let firstName = UITextField()
    let fullName = UITextField()
    let password = UITextField()
    //    let textField5 = UITextField()
    var stste = false
    
    let button = UIButton()
    let button2 = UIButton()
    let label = UILabel()
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let label4 = UILabel()
    let checkLabel = UILabel()

    let imageView1 = UIImageView(image: UIImage(named: "plant1"))
    let imageView2 = UIImageView(image: UIImage(named: "plant2"))
    let imageView3 = UIImageView(image: UIImage(named: "plant3"))
    
    let textField1Image = UIImage(systemName: "person.fill")
    let textField2Image = UIImage(systemName: "lock.fill")
    
    // check button
    lazy var isServiceProvider : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        $0.addTarget(self, action: #selector(isProBtnClick), for: .touchDown)
        return $0
    }(UIButton(type: .system))

    
    @objc func isProBtnClick(){
        if stste == false{
          stste = true
          isServiceProvider.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        else{
          stste = false
          isServiceProvider.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
      }
    
    func ui(){
        
        // backgroundColor
        view.backgroundColor = #colorLiteral(red: 0.8890833521, green: 0.8847882635, blue: 0.8933784408, alpha: 1)

        // white view
        let subView = UIView()
        subView.backgroundColor = .white
        subView.frame = CGRect(x: 0, y: 285, width: 390, height: 1500)
        subView.layer.cornerRadius = 30
        view.addSubview(subView)
        
     // Check button
        isServiceProvider.frame = CGRect(x: 220, y: 625, width: 20, height: 20)
        isServiceProvider.tintColor = .gray
        
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
//        label1.frame = CGRect(x: 45, y: 400, width: 200, height: 50)
        label1.text = "البريد الالكتروني"
//        label1.frame = CGRect(x: 45, y: 370, width: 200, height: 50)

        label1.frame = CGRect(x: 230, y: 370, width: 200, height: 50)
//        label1.text = "Email"
        label1.font = UIFont(name: "GillSans-Italic", size: 19)
        label1.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label1)
        
        //second label (name)
        label2.frame = CGRect(x: 300, y: 445, width: 200, height: 50)
        label2.text = "الاسم"
        label2.font = UIFont(name: "GillSans-Italic", size: 19)
        label2.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label2)
        
        //third label (password)
        label3.frame = CGRect(x: 270, y: 520, width: 200, height: 50)
        label3.text = "كلمه المرور"
        label3.font = UIFont(name: "GillSans-Italic", size: 19)
        label3.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label3)
      
        //fourth label
        label4.frame = CGRect(x: 230, y: 760, width: 200, height: 50)
        
        label4.text = "هل تملك حساب ؟"
        label4.font = UIFont(name: "GillSans-Italic", size: 19)
        label4.textColor = .gray
        view.addSubview(label4)
        
        //fourth label
        checkLabel.frame = CGRect(x: 170, y: 610, width: 200, height: 50)
        checkLabel.text = "متجر"
        checkLabel.font = UIFont(name: "GillSans-Italic", size: 21)
        checkLabel.textColor = .gray
        view.addSubview(checkLabel)
        
        
        // first textField (email)
        email.frame = CGRect(x: 35, y: 410, width: 320, height: 45)
        email.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        email.textAlignment = .right
        ImgeInTextField(textField: email, fieldImge: textField1Image!)
        email.font = UIFont(name: "GillSans-Italic", size: 15)
        email.placeholder = "ادخل البريد الالكتروني" // display when click on it
        email.layer.cornerRadius = 25
        view.addSubview(email)

        // third textField (full name)
        fullName.frame = CGRect(x: 35, y: 485, width: 320, height: 45)
        fullName.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        ImgeInTextField(textField: fullName, fieldImge: textField1Image!)
        fullName.font = UIFont(name: "GillSans-Italic", size: 15)
        fullName.placeholder = "ادخل الاسم" // display when click on it
        fullName.textAlignment = .right

        fullName.layer.cornerRadius = 25
        view.addSubview(fullName)
        
        // fourth textField (password)
        password.frame = CGRect(x: 35, y: 560, width: 320, height: 45)
        password.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        ImgeInTextField(textField: password, fieldImge: textField2Image!)
        password.font = UIFont(name: "GillSans-Italic", size: 15)
        password.placeholder = "ادخل كلمه المرور" // display when click on it
        password.textAlignment = .right
        password.layer.cornerRadius = 25
        password.isSecureTextEntry = true
        view.addSubview(password)
        
        // button sign in
        button.frame = CGRect(x: 75, y: 660, width: 230, height: 50)
        button.layer.cornerRadius = 25
        button.backgroundColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        button.setTitle("انشاء حساب", for: .normal)
        button.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 25)
        view.addSubview(button)
        button.addTarget(self, action: #selector (signUpInBtnClick), for: .touchDown)
        
        // button2 sign up
        button2.frame = CGRect(x: 40, y: 760, width: 230, height: 50)
        button2.layer.cornerRadius = 25
        button2.setTitleColor( #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1) , for: .normal)
        button2.setTitle("تسجيل الدخول", for: .normal)
        button2.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 25)
        view.addSubview(button2)
        button2.addTarget(self, action: #selector (cancelCreatingNewUser), for: .touchDown)
        
        // title label
        label.frame = CGRect(x: 170, y: 330, width: 200, height: 50)
//        label.frame = CGRect(x: 0, y: 320, width: 200, height: 50)
        label.text = "انشاء حساب"
        label.font = UIFont(name: "GillSans-Italic", size: 30)
        label.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        label.textAlignment = .center
     //   view.addSubview(label) // XX
        
        // check button
        view.addSubview(isServiceProvider)
        

    }
    
    // Def image for text field
    @objc func ImgeInTextField(textField: UITextField, fieldImge img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 500 , height: 100 ))
        leftImageView.image = img
        leftImageView.tintColor = .gray
        textField.rightView = leftImageView
        textField.rightViewMode = .always
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
        
    }
    
    
    @objc private func signUpInBtnClick(){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { result, error in
            if let error = error{
                print(error)
            }else{
                if self.stste == false {
                    let data : [String: Any] = ["fullName":self.fullName.text!,"email":self.email.text!,"userID":Auth.auth().currentUser!.uid , "displayName" : self.fullName.text!]
                    
                    self.db.collection("Users").addDocument(data: data) { error in
                        if let error = error{
                            print(error)
                        }else{
                            let tabView = DashboardTabBarController()
                            self.navigationController?.present(tabView, animated: true, completion: nil)
                        }
                    }
                }else{
                    if self.stste == false{
                        let data : [String: Any] = ["fullName":self.fullName.text!,"email":self.email.text!,"userID":Auth.auth().currentUser!.uid, "isStore" : false ]
                        self.db.collection("Users").addDocument(data: data) { error in
                            if let error = error{
                                print(error)
                            }else{
                                let tabView = DashboardTabBarController()
                                self.navigationController?.present(tabView, animated: true, completion: nil)
                            }
                        }
                    }else if self.stste == true{
                        let data : [String: Any] = ["storeName":self.fullName.text!,"email":self.email.text!,"userID":Auth.auth().currentUser!.uid,"isStore" : true]
                        self.db.collection("Stores").addDocument(data: data) { error in
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
        }
    }
    
    @objc private func cancelCreatingNewUser(){
        self.dismiss(animated: true, completion: nil)
    }
    

}
