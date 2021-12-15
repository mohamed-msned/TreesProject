//
//  TreesCollectionViewController.swift
//  Shatlah
//
//  Created by Nora on 11/05/1443 AH.
//

import UIKit

class TreesCollectionViewController: UIViewController {

    var images = [""]
     var imagesCollectionView : UICollectionView? = nil
    
     override var prefersStatusBarHidden: Bool {
       return true
     }
    
     override func viewDidLoad() {
       super.viewDidLoad()
       let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
 //        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
           layout.itemSize = CGSize(width: 150, height: 150)
       imagesCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
       imagesCollectionView!.backgroundColor = UIColor.white
       imagesCollectionView!.dataSource = self
       imagesCollectionView!.delegate = self
       imagesCollectionView!.register(TreesCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
       view.addSubview(imagesCollectionView!)
       NSLayoutConstraint.activate([
         imagesCollectionView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         imagesCollectionView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         imagesCollectionView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         imagesCollectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
       ])
     }
   }

   extension TreesCollectionViewController : UICollectionViewDelegate, UICollectionViewDataSource{
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 51
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = imagesCollectionView!.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TreesCollectionViewCell
      cell.backgroundColor = .lightGray
      cell.imageView.image = UIImage(systemName: "star.fill")
      
    return cell
  }
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
         let vc = DescriptionViewController()
         
         vc.modalPresentationStyle = .fullScreen
         present(vc, animated: true, completion: nil)
     }
 }
