//
//  TreesCollectionViewCell.swift
//  Shatlah
//
//  Created by Nora on 11/05/1443 AH.
//

import UIKit

class TreesCollectionViewCell: UICollectionViewCell {

    lazy var imageView: UIImageView = {
           $0.contentMode = .scaleAspectFit
           $0.clipsToBounds = true
           $0.translatesAutoresizingMaskIntoConstraints = false
           return $0
       }(UIImageView())
     
     override init(frame: CGRect) {
         super.init(frame: frame)
     
         self.contentView.addSubview(imageView)
         
         NSLayoutConstraint.activate([
             imageView.topAnchor
                 .constraint(equalTo: self.contentView.topAnchor),
             imageView.leftAnchor
                 .constraint(equalTo: self.contentView.leftAnchor),
             imageView.rightAnchor
                 .constraint(equalTo: self.contentView.rightAnchor),
             imageView.bottomAnchor
                 .constraint(equalTo: self.contentView.bottomAnchor),
         ])
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     

     

 }
