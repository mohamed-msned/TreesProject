

import UIKit
import Firebase
class TreesCollectionViewController: UIViewController {
var p = 0
    var storeID = ""
  let db = Firestore.firestore()
  var trees = [NewTreeModel]()
  var treeCollectionView : UICollectionView? = nil
   override var prefersStatusBarHidden: Bool {
    return true
   }
   override func viewDidLoad() {
    super.viewDidLoad()
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
     layout.sectionInset = UIEdgeInsets(top: 20, left: 30, bottom: 10, right: 30)
     layout.itemSize = CGSize(width: 160, height: 160)
     treeCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
     treeCollectionView!.backgroundColor = UIColor.white
     treeCollectionView!.dataSource = self
     treeCollectionView!.delegate = self
     treeCollectionView!.register(TreesCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    view.addSubview(treeCollectionView!)
    NSLayoutConstraint.activate([
    treeCollectionView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
    treeCollectionView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    treeCollectionView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    treeCollectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
     loadData()
       print("@@@@@", p)
       print(storeID)
   }
  }
  extension TreesCollectionViewController : UICollectionViewDelegate, UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return trees.count
 }
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  let cell = treeCollectionView!.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TreesCollectionViewCell
   cell.treeImage.image = UIImage(named: "shatlah")
   cell.treeLable.text = trees[indexPath.item].newtreeName
   cell.priceLable.text = trees[indexPath.item].planetPrice
//
  return cell
 }
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     let vc = DescriptionViewController()
       
       vc.price = p
     vc.modalPresentationStyle = .fullScreen
     present(vc, animated: true, completion: nil)
   }
    func loadData() {
      db.collection("newPlants")
            .whereField("storeID", isEqualTo: storeID)
              .getDocuments() {
               (querySnapshot, error) in
               if let error = error {
                print("error heeereee")
                print(error.localizedDescription)
               }else {
                for document in querySnapshot!.documents {
                 let data = document.data()
                 let name = data["planetName"] as? String ?? "_"
                 let price = data["plantPrice"] as? String ?? "_"
                    print("######",price)
                    self.p = Int(price) ?? 0
                 let newTree = NewTreeModel(newtreeName: "الإسم:\(name)", plantDescription: "", planetPrice: "السعر:\(price)")
                 print("###################")
                 print(self.trees)
                self.trees.append(newTree)
               }
                self.treeCollectionView?.reloadData()
                }
               }
              }
    }
