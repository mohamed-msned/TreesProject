
import Foundation
import UIKit
import Firebase

class PaymentViewController: UIViewController {

    let db = Firestore.firestore()
    var totalAmountOftrees = 0
       var amountOfTrees = 0
       var totalPrice = 0
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let label4 = UILabel()
    let label5 = UILabel()
    let label6 = UILabel()
    let label7 = UILabel()
    let label8 = UILabel()
    let label9 = UILabel()
    let label10 = UILabel()

    let priceLable = UILabel()
    let numberOfTreesLable = UILabel()

    var amountOftrees = 0
    
    lazy var payButton: UIButton = {
        $0.backgroundColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        $0.tintColor = .white
        $0.titleLabel?.font =  UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.setTitle(" Pay", for: .normal)
        $0.addTarget(self, action: #selector(applePayBtnClicked), for: .touchDown)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(type: .system))
    
    lazy var chatButton: UIButton = {
        $0.backgroundColor =  #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        $0.tintColor = .white
        $0.titleLabel?.font =  UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.setTitle("المحادثه", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(type: .system))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
       // setUpUI()
        readTotalAmount()
        ui()
        
    }
      

    @objc func applePayBtnClicked() {
            let alert = UIAlertController(title: "Thank you", message: "Your money has been recieved", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in
                let db = DashboardTabBarController()
                db.modalPresentationStyle = .fullScreen
                self.present(db, animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
            

            let newData = ["totalAmountOftrees" : totalAmountOftrees + amountOfTrees]
    //                        let db = Firestore.firestore()
                            db.collection("Users").whereField("userID", isEqualTo: Auth.auth().currentUser?.uid as Any).getDocuments { (result, error) in
                                if error == nil{
                                    for document in result!.documents{
                                        //document.setValue(“1", forKey: “isolationDate”)
                                        self.db.collection("Users").document(document.documentID).setData(newData , merge: true)
                                    }
                                }
                            }
                        }

        func readTotalAmount() {
            db.collection("Users")
                .whereField("userID", isEqualTo: Auth.auth().currentUser!.uid)
                        .getDocuments() {

                            (querySnapshot, error) in
                            if let error = error {
                                print(error.localizedDescription)
                            }else {
                                for document in querySnapshot!.documents {
                                    let data = document.data()
                                    print(data["totalAmountOftrees"] as! Int )
                                    self.totalAmountOftrees = data["totalAmountOftrees"] as! Int
                                }
                            }
                        }
            
        }
    func ui(){
        // white view1
        let subView1 = UIView()
        subView1.backgroundColor = .white
        subView1.frame = CGRect(x: 20, y: 150, width: 350, height: 90)
        subView1.layer.cornerRadius = 20
        view.addSubview(subView1)
        
        // white view2
        let subView2 = UIView()
        subView2.backgroundColor = .white
        subView2.frame = CGRect(x: 20, y: 300, width: 350, height: 70)
        subView2.layer.cornerRadius = 20
        view.addSubview(subView2)

        //second label
        label1.frame = CGRect(x: 250, y: 100, width: 200, height: 50)
        label1.text = "عنوان التوصيل"
//        label1.font = UIFont(name: "GillSans-Italic", size: 19)
        label1.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label1.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label1)
        
        //first label
        label2.frame = CGRect(x: 260, y: 250, width: 200, height: 50)
        label2.text = "طريقه الدفع"
//        label2.font = UIFont(name: "GillSans-Italic", size: 19)
        label2.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label2.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label2)
        
        //third label
        label3.frame = CGRect(x: 310, y: 380, width: 200, height: 50)
        label3.text = "كوبون"
        label3.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label3.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label3)
        
        //forth label
        label4.frame = CGRect(x: 140, y: 410, width: 500, height: 50)
        label4.text = "لا يوجد لديك كوبون او رصيد إضافي"
        label4.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label4.textColor = .systemGray3
        view.addSubview(label4)
        
        //fitfth label
        label5.frame = CGRect(x: 250, y: 450, width: 200, height: 50)
        label5.text = "قائمة الطلبات"
        label5.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label5.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label5)
        
        // white view3
        let subView3 = UIView()
        subView3.backgroundColor = .white
        subView3.frame = CGRect(x: 20, y: 500, width: 350, height: 100)
        subView3.layer.cornerRadius = 20
        view.addSubview(subView3)
        
        //sixth label
        label6.frame = CGRect(x: 200, y: 500, width: 200, height: 50)
        label6.text = "نبته صبار حجم صغير"
        label6.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label6.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label6)
        
        //price label
        priceLable.frame = CGRect(x: 60, y: 530, width: 200, height: 50)
        priceLable.text = String(totalPrice * amountOfTrees)
        priceLable.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        priceLable.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(priceLable)

        //num label
        numberOfTreesLable.frame = CGRect(x: 60, y: 500, width: 200, height: 50)
        numberOfTreesLable.text = "العدد:\(amountOfTrees)"
        numberOfTreesLable.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        numberOfTreesLable.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(numberOfTreesLable)
        
        //
        payButton.frame = CGRect(x: 210, y: 310, width: 150, height: 45)
        payButton.layer.cornerRadius = 20
        view.addSubview(payButton)
        //
        chatButton.frame = CGRect(x: 0, y: 750, width: 390, height: 100)
        chatButton.layer.cornerRadius = 20
        view.addSubview(chatButton)
        
        //delevary label
        label7.frame = CGRect(x: 280, y: 150, width: 500, height: 50)
        label7.text = "التوصيل إلى"
        label7.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label7.textColor = .systemGray3
        view.addSubview(label7)
        
        label8.frame = CGRect(x: 210, y: 180, width: 200, height: 50)
        label8.text = "اختر موقع التوصيل"
        label8.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label8.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label8)
        
        label9.frame = CGRect(x: 50, y: 30, width: 200, height: 300)
        label9.text = "<"
        label9.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label9.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label9)
        
        label10.frame = CGRect(x: 50, y: 190, width: 200, height: 300)
        label10.text = "<"
        label10.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label10.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(label10)
    }
    
}
