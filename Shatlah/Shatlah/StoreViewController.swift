// StoreViewController.swift
// ShatlahApp
//
// Created by Taraf Bin suhaim on 11/05/1443 AH.
//
import UIKit
import Firebase

class StoreViewController: UIViewController, UISearchBarDelegate {
    
    private let db = Firestore.firestore()
       private var stores : [Store] = []
       let userStore = Auth.auth().currentUser
       var userStoreName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        uiSettengs()
    }

  lazy var searchBar:UISearchBar = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.searchBarStyle = UISearchBar.Style.default
    $0.placeholder = "Search..."
    $0.sizeToFit()
    $0.isTranslucent = false
    $0.delegate = self
    $0.backgroundImage = UIImage()
    return $0
  }(UISearchBar())
  lazy var tableView : UITableView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.register(StoreCell.self, forCellReuseIdentifier: StoreCell.id)
    $0.rowHeight = UITableView.automaticDimension
    $0.estimatedRowHeight = 200
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.delegate = self
    $0.dataSource = self
    $0.layer.cornerRadius = 10
    return $0
   }(UITableView())
    
  func uiSettengs(){
    [searchBar,tableView].forEach{view.addSubview($0)}
    NSLayoutConstraint.activate([
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),

         tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
   }
    
    func readStore(){
            
            let name = db.collection("Stores").whereField( "userID", isEqualTo: userStore as Any).addSnapshotListener{(querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        self.userStoreName = data["userID"] as! String
                        print("Name," , self.userStoreName)
                    }
                }
            }
        }
}
extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return stores.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: StoreCell.id, for: indexPath) as! StoreCell
        cell.stroeName.text = stores[indexPath.row].storetName
        cell.storeEmail.text = stores[indexPath.row].storeEmail
        return cell
  }
}
