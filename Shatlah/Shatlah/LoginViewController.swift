



import UIKit
import Firebase

class LoginViewController: UIViewController {
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
        textField1.placeholder = "ادخل البريد الالكتروني" // display when click on it
        textField1.textAlignment = .right
        textField1.layer.cornerRadius = 25
        view.addSubview(textField1)
        
        // second textField
        textField2.frame = CGRect(x: 35, y: 560, width: 320, height: 45)
        textField2.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        ImgeInTextField(textField: textField2, fieldImge: textField2Image!)
        textField2.font = UIFont(name: "GillSans-Italic", size: 15)
        textField2.placeholder = "ادخل كلمه المرور" // display when click on it
        textField2.textAlignment = .right
        textField2.layer.cornerRadius = 25
        textField2.isSecureTextEntry = true
        view.addSubview(textField2)

        // button sign in
        button.frame = CGRect(x: 90, y: 625, width: 230, height: 50)
        button.layer.cornerRadius = 25
        button.backgroundColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        button.setTitle("تسجيل الدخول", for: .normal)
//        button.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 10)
        view.addSubview(button)
        button.addTarget(self, action: #selector (signInBtnClick), for: .touchDown)
        
        // button2 sign up
        button2.frame = CGRect(x: 50, y: 760, width: 230, height: 50)
        button2.layer.cornerRadius = 25
        button2.setTitleColor( #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1) , for: .normal)
        button2.setTitle("انشاء حساب", for: .normal)
        button2.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 23)
        view.addSubview(button2)
        button2.addTarget(self, action: #selector (signUpBtnClick), for: .touchDown)
        
        // title label
        label.frame = CGRect(x: 170, y: 340, width: 200, height: 50)
        label.text = "تسجيل الدخول"
        label.font = UIFont(name: "GillSans-Italic", size: 30)
        label.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        label.textAlignment = .center
        view.addSubview(label)
        
        //second label
        label2.frame = CGRect(x: 230, y: 420, width: 200, height: 50)
        label2.text = "البريد الالكتروني"
        label2.font = UIFont(name: "GillSans-Italic", size: 19)
        label2.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label2)
        
        //first label
        label1.frame = CGRect(x: 270, y: 515, width: 200, height: 50)
        label1.text = "كلمة المرور"
        label1.font = UIFont(name: "GillSans-Italic", size: 19)
        label1.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label1)
        
        //third label
        label3.frame = CGRect(x: 230, y: 760, width: 200, height: 50)
        label3.text = "لا تملك حساب ؟"
        label3.font = UIFont(name: "GillSans-Italic", size: 19)
        label3.textColor = .gray
        view.addSubview(label3)
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

    // *************************************************

    override func viewDidLoad() {
        super.viewDidLoad()
        ui()
    }

    @objc func signInBtnClick(){
        Auth.auth().signIn(withEmail: textField1.text!, password: textField2.text!) { result, error in
            if let error = error{
                print(error)
            }else{
                let dashBoard = DashboardTabBarController()
                dashBoard.modalPresentationStyle = .fullScreen
                self.present(dashBoard, animated: true, completion: nil)
            }
        }
    }
    
    @objc func signUpBtnClick(){
        let signUpVC = SignUpViewController()
        signUpVC.modalPresentationStyle = .fullScreen
        self.present(signUpVC, animated: true , completion: nil)
    }
}
