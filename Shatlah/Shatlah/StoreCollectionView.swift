import UIKit
import Firebase

class StoreCollectionView: UIViewController {
  let db = Firestore.firestore()
  var currentID = Auth.auth().currentUser?.uid
  var newTrees = [NewTreeModel]()
  var newTreesCollectionView : UICollectionView?
   override func viewDidLoad() {
    super.viewDidLoad()
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
     layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
     layout.itemSize = CGSize(width:300, height: 350)
     newTreesCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
     newTreesCollectionView!.backgroundColor = UIColor.white
     newTreesCollectionView!.dataSource = self
     newTreesCollectionView!.delegate = self
     newTreesCollectionView!.register(NewTreeCollectionViewCell.self, forCellWithReuseIdentifier: NewTreeCollectionViewCell.identifier)
    view.addSubview(newTreesCollectionView!)
    NSLayoutConstraint.activate([
    newTreesCollectionView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
    newTreesCollectionView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    newTreesCollectionView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    newTreesCollectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
     readTreeData()
     newTreesCollectionView?.reloadData()
   }
  }
  extension StoreCollectionView : UICollectionViewDelegate, UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return newTrees.count
  }
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   let cell = newTreesCollectionView!.dequeueReusableCell(withReuseIdentifier: NewTreeCollectionViewCell.identifier, for: indexPath) as! NewTreeCollectionViewCell
   //cell.backgroundColor = .systemGray6
   cell.treeNameLable.text = newTrees[indexPath.row].newtreeName
   cell.treePriceLable.text = newTrees[indexPath.row].planetPrice
   cell.treedescriptionLable.text = newTrees[indexPath.row].plantDescription
  return cell
 }
    func readTreeData(){
      db.collection("newPlants")
                .whereField("storeID", isEqualTo: Auth.auth().currentUser!.uid)
                .getDocuments() {
                  (querySnapshot, error) in
                  if let error = error {
                    print("error heeereee")
                    print(error.localizedDescription)
                  }else {
                    for document in querySnapshot!.documents {
                      let data = document.data()
                      let name = data["planetName"] as! String ?? "_"
                      let description = data["plantDescription"] as? String ?? "_"
                      let price = data["plantPrice"] as? String ?? "_"
                      let newTree = NewTreeModel(newtreeName: name, plantDescription: description, planetPrice: price)
                      print("##################")
                      print(self.newTrees)
                    self.newTrees.append(newTree)
                  }
                    self.newTreesCollectionView?.reloadData()
                    }
                  }
                }
  }
