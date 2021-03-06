import UIKit
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

class StoreProfilePageViewController: UIViewController {
    let db = Firestore.firestore()
    let imagePicker = UIImagePickerController()
    let storage = Storage.storage()
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(#colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1))
        view.layer.cornerRadius = 13
        view.layer.cornerCurve = .continuous
        view.clipsToBounds = true
        return view
    }()

    lazy var addBtn : UIButton = {
        let add = UIButton()
        $0.setTitle("اضافه", for: .normal)
        $0.backgroundColor = .white
        $0.tintColor = #colorLiteral(red: 0.2691704333, green: 0.3360689282, blue: 0.2908776999, alpha: 1)
        $0.layer.cornerRadius = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(addPlanet), for: .touchDown)
        return $0
    }(UIButton(type: .system))

    let profileImage: UIImageView = {
        let pI = UIImageView()
        pI.contentMode = .scaleAspectFit
        pI.clipsToBounds = true
        pI.layer.cornerRadius = 80
        pI.layer.borderColor = UIColor.white.cgColor
        pI.layer.borderWidth = 1
        pI.image = UIImage(systemName: "house.fill")
        return pI
    }()

    let userNameLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 29, weight: .bold)
        name.textColor = .white
        name.textAlignment = .center

        return name
    }()


    let userEmailLabel: UILabel = {
        let email = UILabel()
        email.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        email.textAlignment = .center
        email.textColor = .white
        return email
    }()

    let signOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("تسجيل الخروج", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(louOut), for: .touchDown)
        button.tintColor = #colorLiteral(red: 0.2691704333, green: 0.3360689282, blue: 0.2908776999, alpha: 1)
        return button
    }()


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
    
    //---------
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Store Profile"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        readImageFromFirestore()
        setUpLabels()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchCurrentUsers()
    }
    func setUpLabels() {

        containerView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(containerView)

        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive                                = true
        containerView.widthAnchor.constraint(equalToConstant: 325).isActive                                         = true
        containerView.heightAnchor.constraint(equalToConstant: 375).isActive                                        = true

        profileImage.tintColor  = .white
        profileImage.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        profileImage.addGestureRecognizer(tapRecognizer)

        containerView.addSubview(profileImage)

        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 160).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true

        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(userNameLabel)
        userNameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20).isActive = true
        userNameLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true



        containerView.addSubview(signOutButton)


        userEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(userEmailLabel)
        userEmailLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        userEmailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 3).isActive = true

        containerView.addSubview(addBtn)
        addBtn.topAnchor.constraint(equalTo:userEmailLabel.bottomAnchor, constant: 20).isActive = true
        addBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        containerView.addSubview(signOutButton)

        signOutButton.topAnchor.constraint(equalTo: addBtn.bottomAnchor, constant: 20).isActive = true
        signOutButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        signOutButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        signOutButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
    }

    @objc func signOutButtonTapped() {
        guard let currentUser = Auth.auth().currentUser else {return}
        do{
            try Auth.auth().signOut()
        }catch{print("Error")}
    }

    func setupImagePicker() {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }

    @objc func imageTapped() {
        print("Image tapped")
        setupImagePicker()
    }

    func saveImageToFirestore(url: String, userId: String) {

        db.collection("Stores").document(userId).setData([
            "userImageURL": url,
        ], merge: true) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    @objc func addPlanet(){
        let postvc = PostViewController()
        present(postvc, animated: true, completion: nil)}
    private func readImageFromFirestore(){
        guard let currentUser = Auth.auth().currentUser else {return}

        db.collection("Stores").whereField("userID", isEqualTo: currentUser.uid)
            .addSnapshotListener { (querySnapshot, error) in
                if let e = error {
                    print("There was an issue retrieving data from Firestore. \(e)")
                } else {

                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()

                            if let imageURL = data["userImageURL"] as? String
                            {

                                let httpsReference = self.storage.reference(forURL: imageURL)


                                httpsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                                    if let error = error {
                                        print("ERROR GETTING DATA \(error.localizedDescription)")
                                    } else {
                                        DispatchQueue.main.async {
                                            self.profileImage.image = UIImage(data: data!)
                                        }

                                    }
                                }

                            } else {

                                print("error converting data")
                                DispatchQueue.main.async {
                                    self.profileImage.image = UIImage(systemName: "house.fill")
                                }

                            }


                        }
                    }
                }
            }
    }

    private func fetchCurrentUsers() {
        guard let currentUser = FirebaseAuth.Auth.auth().currentUser else {return}
        db.collection("Stores").whereField("userID", isEqualTo: currentUser.uid)
            .addSnapshotListener { (querySnapshot, error) in
                if let e = error {
                    print("There was an issue retrieving data from Firestore. \(e)")
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        print(snapshotDocuments)
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let userName = data["storeName"] as? String,
                               let userEmail = data["email"] as? String
                            {
                                DispatchQueue.main.async {
                                    self.userNameLabel.text = userName
                                    self.userEmailLabel.text = userEmail
                                }


                            }
                        }
                    }
                }

            }
    }

}

extension StoreProfilePageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{



    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {


        guard let userPickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
        guard let d: Data = userPickedImage.jpegData(compressionQuality: 0.5) else { return }
        guard let currentUser = Auth.auth().currentUser else {return}



        let metadata = StorageMetadata()
        metadata.contentType = "image/png"

        let ref = storage.reference().child("StoreProfileImages/\(currentUser.email!)/\(currentUser.uid).jpg")

        ref.putData(d, metadata: metadata) { (metadata, error) in
            if error == nil {
                ref.downloadURL(completion: { (url, error) in
                    self.saveImageToFirestore(url: "\(url!)", userId: currentUser.uid)

                })
            }else{
                print("error \(String(describing: error))")
            }
        }

        picker.dismiss(animated: true, completion: nil)
    }



}


