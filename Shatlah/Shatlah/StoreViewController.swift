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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        uiSettengs()
        getData()
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
        $0.estimatedRowHeight = 400
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
    
    func getData(){
        db.collection("Stores")
            .addSnapshotListener { (querySnapshot, error) in
                self.stores = []
                if let e = error {
                    print("There was an issue retrieving data from Firestore. \(e)")
                } else {
                    for document in querySnapshot!.documents{
                        let data = document.data()
                        self.stores.append(Store(storetName: data["storeName"] as? String ?? "NA", storeEmail: data["email"] as? String ?? "NA"))
                        print(data["storeName"] as? String ?? "NA")
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let treeCV = TreesCollectionViewController()
        treeCV.modalPresentationStyle = .fullScreen
        present(treeCV, animated: true, completion: nil)
    }
}
