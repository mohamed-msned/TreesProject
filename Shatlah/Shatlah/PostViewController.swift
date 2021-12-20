import UIKit
import Foundation
import Firebase
class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let PostButton = UIButton()
    let cancelButton = UIButton()
    let plantName = UITextField()
    let plantPrice = UITextField()
    let plantDescription = UITextView()
    let libraryImage = UIButton()
    let cameraImage = UIButton()
    let plantImage = UIImageView()
    let plantImage2 = UIImageView()
    var imagePath = "no image"
    var imagePicker: UIImagePickerController!
    let userID = Auth.auth().currentUser?.uid
    
    func ui(){
      //second label
      label1.frame = CGRect(x: 250, y: 190, width: 200, height: 50)
      label1.text = "اسم المنتج : "
  //    label1.font = UIFont(name: "GillSans-Italic", size: 19)
      label1.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label1.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
      view.addSubview(label1)
      //first label
      label2.frame = CGRect(x: 290, y: 300, width: 200, height: 50)
      label2.text = "السعر :"
  //    label2.font = UIFont(name: "GillSans-Italic", size: 19)
      label2.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label2.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
      view.addSubview(label2)
      //third label
      label3.frame = CGRect(x: 280, y: 410, width: 200, height: 50)
      label3.text = "الوصف :"
  //    label3.font = UIFont(name: "GillSans-Italic", size: 19)
      label3.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label3.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
      view.addSubview(label3)
      // textField (plant name)
      plantName.frame = CGRect(x: 35, y: 235, width: 320, height: 50)
        plantName.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
      plantName.font = UIFont(name: "GillSans-Italic", size: 18)
      plantName.placeholder = "  ادخل اسم المنتج"
      plantName.textAlignment = .right
      plantName.layer.cornerRadius = 15
      let textField1Image = UIImage(systemName: "highlighter")
      ImgeInTextField(textField: plantName, fieldImge: textField1Image!)
      view.addSubview(plantName)
      // textField2 (plant price)
      plantPrice.frame = CGRect(x: 35, y: 345, width: 320, height: 50)
        plantPrice.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
      plantPrice.font = UIFont(name: "GillSans-Italic", size: 18)
      plantPrice.placeholder = "  ادخل السعر"
      plantPrice.textAlignment = .right
      plantPrice.layer.cornerRadius = 15
      let textField1Image2 = UIImage(systemName: "highlighter")
      ImgeInTextField(textField: plantPrice, fieldImge: textField1Image2!)
      view.addSubview(plantPrice)
      // textField3 (plant description)
      plantDescription.frame = CGRect(x: 35, y: 455, width: 320, height: 200)
        plantDescription.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
      plantDescription.font = UIFont(name: "GillSans-Italic", size: 20)
      plantDescription.textAlignment = .right
      plantDescription.layer.cornerRadius = 20

      view.addSubview(plantDescription)
      PostButton.frame = CGRect(x: 220, y: 120, width: 130, height: 40)
      PostButton.layer.cornerRadius = 20
        PostButton.backgroundColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
      PostButton.setTitle("اضافه", for: .normal)
      PostButton.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 25)
      view.addSubview(PostButton)
      PostButton.addTarget(self, action: #selector (post), for: .touchDown)
      // x
      cancelButton.frame = CGRect(x: 30, y: 50, width: 50, height: 40)
      cancelButton.setTitleColor( #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1) , for: .normal)
      cancelButton.layer.cornerRadius = 20
      cancelButton.setTitle("x", for: .normal)
      cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 40, weight: .bold)
      view.addSubview(cancelButton)
      cancelButton.addTarget(self, action: #selector (cancel), for: .touchDown)
      // library image button
      libraryImage.translatesAutoresizingMaskIntoConstraints = false
      libraryImage.setBackgroundImage(UIImage(systemName: "photo"), for: .normal)
  //    libraryImage.addTarget(self, action: #selector(imageAction), for: .touchDown)
      libraryImage.frame = CGRect(x: 75, y: 120, width: 55, height: 40)
        libraryImage.tintColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
    //  view.addSubview(libraryImage)
      // cam button
      cameraImage.translatesAutoresizingMaskIntoConstraints = false
      cameraImage.setBackgroundImage(UIImage(systemName: "camera"), for: .normal)
  //    cameraImage.addTarget(self, action: #selector(camera), for: .touchDown)
      cameraImage.frame = CGRect(x: 140, y: 120, width: 55, height: 40)
        cameraImage.tintColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
      // view.addSubview(cameraImage)
      // plant image
      plantImage.translatesAutoresizingMaskIntoConstraints = false
  //    plantImage.setBackgroundImage(UIImage(systemName: "camera"), for: .normal)
      plantImage.image = UIImage(systemName: "photo")
      plantImage.frame = CGRect(x: 50, y: 450, width: 300, height: 200)
      plantImage.tintColor = .systemGray4
     // view.addSubview(plantImage)
    }
    // Def image for text field
    @objc func ImgeInTextField(textField: UITextField, fieldImge img: UIImage) {
      let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 500 , height: 100 ))
      leftImageView.image = img
      leftImageView.tintColor = .gray
      textField.rightView = leftImageView
      textField.rightViewMode = .always
    }
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.8890833521, green: 0.8847882635, blue: 0.8933784408, alpha: 1)
      super.viewDidLoad()
      imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      ui()
    }
    @objc private func post(){
      let db = Firestore.firestore() // refrence
       db.collection("newPlants").addDocument(data: ["planetName": plantName.text!,"plantDescription" : plantDescription.text!, "plantPrice" : plantPrice.text! ,"storeID": Auth.auth().currentUser?.uid]){ error in
         if error == nil{
           print("Decument has been created")
           print(["planetName": self.plantName.text!])
           print(["plantDescription": self.plantDescription.text!])
           print(["plantPrice": self.plantPrice.text!])
         } else{
           print(error?.localizedDescription)
         }
       }
     // dismiss(animated: true, completion: nil)
        let storCV = StoreCollectionView()
        self.present(storCV, animated: true, completion: nil)
     }
    @objc private func cancel(){
    }
  //  //----------------------------------------
    //   upload image to firebase
    func uploadImage(){
      let imageName = "\(UUID().uuidString).png"
      let imagefolder = Storage.storage().reference().child("images")
      if let imageData = plantImage2.image?.jpegData(compressionQuality: 0.1){ // compress image
        imagefolder.child(imageName).putData(imageData, metadata: nil){ // upload image
          (metaData , err) in
          if let error = err {
            print(error.localizedDescription)
          }else{
            print("** Image uploaded sucssefuly **")
          }
        }
      }
    }
  //  //----------------------------------------
  //
    // camera
      @objc private func camera(){
      let cameraView = UIImagePickerController()
    //  cameraView.delegate = self
      cameraView.sourceType = .camera
      present(cameraView, animated: true, completion: nil)
    }
    // images from library
    @objc private func imageAction(){
      present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
        plantImage.image = image
  //      uploadImage(image: image)
    }
      dismiss(animated: true, completion: nil)
  //    imagePicker.dismiss(animated: true, completion: nil)
    }
    // hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      self.view.endEditing(true)
    }
    @objc func xButton(){

    }
  }
