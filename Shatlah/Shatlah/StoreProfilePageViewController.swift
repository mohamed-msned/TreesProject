import UIKit
import Firebase

class StoreProfilePageViewController: UIViewController {

  var stores : Store?
  let db = Firestore.firestore()
  var storeImageProfile = UIImageView(frame: CGRect(x: 50, y: 30, width: 150, height: 150))
  var storeNameLable = UILabel(frame: CGRect(x: 50, y: 40, width: 100, height: 50))
  var StoreDescriptionLabe = UILabel(frame: CGRect(x: 50, y: 150, width: 200, height: 200))
  var addPlanetTypeButton = UIButton(frame: CGRect(x: 50, y: 300, width: 60, height: 30))
  var storeAccount = UILabel(frame: CGRect(x: 50, y: 45, width: 100, height: 50))
  override func viewDidLoad() {
    storeImageProfile.image = UIImage(systemName: "person")
//      storeNameLable.text =
    storeNameLable.text = stores?.storetName
    storeAccount.text = stores?.storeEmail
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(storeImageProfile)
    view.addSubview(storeNameLable)
    view.addSubview(StoreDescriptionLabe)
    view.addSubview(addPlanetTypeButton)
    view.addSubview(storeAccount)
    // Do any additional setup after loading the view.
    DispatchQueue.global(qos: .userInitiated).async {
      DispatchQueue.main.async {
        self.db.collection("Stores").getDocuments { querySnapshot, error in
          if let error = error{
            print("wrong read!!")
            print(error.localizedDescription)
            }else {
              guard querySnapshot != nil else{return}
              for document in querySnapshot!.documents {
//                let dsplaytname = document.get("displayName") as! String
//                var email = as? String
//                var storeID = as? String
//                var isstore = as? String
//
                var s1 : Store? = nil
                s1?.storeEmail = document.get("email") as? String ?? "dddd"
                s1?.storeID = document.get("userID") as? String ?? "dddd"
                s1?.storetName = document.get("isStore") as? String ?? "dddd"
                self.stores = s1
    //            self.stores.append(Store(storetName: dsplaytname, storeEmail: email!,storeID: storeID!, isStore: isstore))
              }
    //
    //  //        print(data["username"] as? String ?? "not valid username!")
    //  //        print(data["text"] as? String ?? "not valid text!" )
    //
    //        }
    //        let data : [String: Any] = ["displayName":self.firstName.text!,"email":self.email.text!,"userID":Auth.auth().currentUser!.uid, "isStore": "state" ]
        }
      }
      }
    }
  }
}
