import UIKit
import Firebase

class StoreViewController: UIViewController {
    
     let db = Firestore.firestore()
     let searchBar = UISearchController()
     var stores : [Store] = []
     var filteredResults: [Store] = []
     let tableView  = UITableView(frame: .zero, style: .insetGrouped)
     var imagesArr = [UIImage]()
     let storage = Storage.storage()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Store"
        uiSettengs()
        getData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func uiSettengs(){
    
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(StoreCell.self, forCellReuseIdentifier: StoreCell.id)
        tableView.rowHeight                                                     = UITableView.automaticDimension
        tableView.estimatedRowHeight = 400
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        
        searchBar.loadViewIfNeeded()
        searchBar.searchResultsUpdater = self
        searchBar.obscuresBackgroundDuringPresentation = false
        searchBar.searchBar.returnKeyType = .done
        searchBar.searchBar.sizeToFit()
        searchBar.searchBar.placeholder = "Search..."
        searchBar.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        
        navigationItem.searchController = searchBar
        navigationItem.hidesSearchBarWhenScrolling = true
        searchBar.searchBar.delegate = self
    }
    
    func getData(){
        db.collection("Stores")
            .addSnapshotListener { (querySnapshot, error) in
               
                if let e = error {
                    print("There was an issue retrieving data from Firestore. \(e)")
                } else {
                    self.stores = []
                    for document in querySnapshot!.documents{
                        let data = document.data()
                        self.stores.append(Store(storetName: data["storeName"] as? String ?? "NA", storeEmail: data["email"] as? String ?? "NA", userImageURL: data["userImageURL"] as? String ?? "NA"))
                        
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
            }
    }

    func readImageFromFirestore(with url: String, completion: @escaping (UIImage) -> ()){
        if  url != "NA"
        {
            let httpsReference = self.storage.reference(forURL: url)
            httpsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                    print("ERROR GETTING DATA \(error.localizedDescription)")
                } else {
                    completion(UIImage(data: data!) ?? UIImage())
                }
            }
            
        }
    }

}

extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.isActive && !searchBar.searchBar.text!.isEmpty {
            return filteredResults.count
        }else{
            return stores.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoreCell.id, for: indexPath) as! StoreCell
        
        if searchBar.isActive && !searchBar.searchBar.text!.isEmpty {
            cell.stroeName.text = filteredResults[indexPath.row].storetName
            cell.storeEmail.text = filteredResults[indexPath.row].storeEmail
            
            return cell
        }else{
          
            cell.stroeName.text = stores[indexPath.row].storetName
            cell.storeEmail.text = stores[indexPath.row].storeEmail
            cell.storeImage.image = UIImage(systemName: "house.fill")?.withTintColor(.black).withRenderingMode(.alwaysOriginal)
            
            readImageFromFirestore(with: stores[indexPath.row].userImageURL ?? "NA") { image in
                DispatchQueue.main.async {
                    cell.storeImage.image = image
                }
            }
            return cell
        }
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

extension StoreViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        if !searchController.isActive {
            return
        }
        let searchBar = searchBar.searchBar
        if let userEnteredSearchText = searchBar.text {
            findResultsBasedOnSearch(with: userEnteredSearchText)
        }
    }
    
    func findResultsBasedOnSearch(with text: String)  {
        filteredResults.removeAll()
        if !text.isEmpty {
            filteredResults = stores.filter{ item in
                item.storetName.lowercased().contains(text.lowercased())
            }
            tableView.reloadData()
        }else{
            tableView.reloadData()
        }
    }
}
