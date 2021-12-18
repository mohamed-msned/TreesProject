

import UIKit

class NewTreeCollectionViewCell: UICollectionViewCell {
  static let identifier = "custemcell"
  lazy var backgImage : UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    // $0.backgroundColor = .lightGray
    $0.image = UIImage(named: "p2")
    $0.layer.cornerRadius = 20
    return $0
  }(UIImageView())
  lazy var treedescriptionLable: UILabel = {
    //    $0.text = "hello"
    //    $0.textColor = .blue
    $0.numberOfLines = 0
    $0.textAlignment = .right
    $0.layer.cornerRadius = 20
    // $0.backgroundColor = .red
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UILabel())
  lazy var treeNameLable: UILabel = {
    //    $0.text = "hello"
    //    $0.textColor = .blue
    // $0.backgroundColor = .lightGray
    $0.textAlignment = .right
    $0.layer.cornerRadius = 20
    $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UILabel())
  lazy var treePriceLable: UILabel = {
    // $0.backgroundColor = .yellow
    $0.textAlignment = .center
    $0.layer.cornerRadius = 20
    $0.backgroundColor = .white
    $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UILabel())
  lazy var sr: UILabel = {
    $0.text = "SR"
    $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UILabel())
  override init(frame: CGRect) {
    super.init(frame: frame)
    //self.contentView.backgroundColor = .red
    //self.contentView.addSubview(treedescriptionLable)
    //self.contentView.addSubview(treeNameLable)
    //self.contentView.addSubview(treePriceLable)
    contentView.addSubview(backgImage)
    contentView.addSubview(treedescriptionLable)
    contentView.addSubview(treeNameLable)
    contentView.addSubview(treePriceLable)
    contentView.addSubview(sr)
    NSLayoutConstraint.activate([
      backgImage.topAnchor.constraint(equalTo: contentView.topAnchor),
      backgImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      backgImage.heightAnchor.constraint(equalToConstant: 150),
      backgImage.widthAnchor.constraint(equalToConstant: 150),
      backgImage.bottomAnchor.constraint(equalTo: treeNameLable.topAnchor),
      treeNameLable.topAnchor.constraint(equalTo: backgImage.bottomAnchor,constant: 20),
      treeNameLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 40),
      treeNameLable.widthAnchor.constraint(equalToConstant:150),
      treeNameLable.bottomAnchor.constraint(equalTo: treedescriptionLable.topAnchor),
      treedescriptionLable.topAnchor.constraint(equalTo: treeNameLable.bottomAnchor,constant: 20),
      treedescriptionLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 40),
      // treedescriptionLable.widthAnchor.constraint(equalToConstant: 200),
      treedescriptionLable.widthAnchor.constraint(equalToConstant: 350),
      treePriceLable.topAnchor.constraint(equalTo: treedescriptionLable.bottomAnchor,constant: 20),
      treePriceLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 40),
      //treePriceLable.widthAnchor.constraint(equalToConstant:150),
      sr.leadingAnchor.constraint(equalTo: treePriceLable.trailingAnchor,constant: -60),
      sr.centerYAnchor.constraint(equalTo: treePriceLable.centerYAnchor)
    ])
  }
  // }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
