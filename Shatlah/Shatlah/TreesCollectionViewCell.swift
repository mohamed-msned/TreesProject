import UIKit
class TreesCollectionViewCell: UICollectionViewCell {
  lazy var treeImage: UIImageView = {
      $0.contentMode = .scaleAspectFit
      $0.layer.shadowColor = UIColor.lightGray.cgColor
      $0.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
      $0.layer.cornerRadius = 20
      $0.layer.shadowRadius = 25.0
      $0.layer.shadowOpacity = 0.9
      $0.clipsToBounds = true
      $0.translatesAutoresizingMaskIntoConstraints = false
      return $0
    }(UIImageView())
  lazy var treeLable: UILabel = {
    $0.textColor = .black
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UILabel())
  lazy var priceLable: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UILabel())
   override init(frame: CGRect) {
     super.init(frame: frame)
     self.contentView.addSubview(treeImage)
     treeImage.addSubview(treeLable)
     treeImage.addSubview(priceLable)
     NSLayoutConstraint.activate([
     treeImage.topAnchor
         .constraint(equalTo: self.contentView.topAnchor),
     treeImage.leftAnchor
         .constraint(equalTo: self.contentView.leftAnchor),
     treeImage.rightAnchor
         .constraint(equalTo: self.contentView.rightAnchor),
     treeImage.bottomAnchor
         .constraint(equalTo: self.contentView.bottomAnchor),
     treeLable.bottomAnchor.constraint(equalTo: treeImage.bottomAnchor),
     treeLable.leadingAnchor.constraint(equalTo: treeImage.centerXAnchor),
     priceLable.bottomAnchor.constraint(equalTo: treeImage.bottomAnchor),
     priceLable.trailingAnchor.constraint(equalTo: treeImage.centerXAnchor),
     ])
   }
   required init?(coder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
   }
 }
