//
//  MyCell.swift
//  Shatlah
//
//  Created by Abdullah Alnutayfi on 18/12/2021.
//

import UIKit

class MyCell: UITableViewCell {

    lazy var logo : UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "pngwing.com")
        $0.tintColor = .white
        return $0
    }(UIImageView())
   
    lazy var plantsCount : UILabel = {
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "x10"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return $0
    }(UILabel())
    lazy var plant : UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
    //    $0.image = UIImage(systemName: "leaf.fill")
        $0.tintColor = .black
        return $0
    }(UIImageView())
    lazy var placeLabel : UILabel = {
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = ""
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return $0
    }(UILabel())
    lazy var nameLable : UILabel = {
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "user name"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return $0
    }(UILabel())
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(placeLabel)
        contentView.addSubview(nameLable)
        contentView.addSubview(plant)
        contentView.addSubview(plantsCount)
        placeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20).isActive = true
        placeLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true

        nameLable.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nameLable.trailingAnchor.constraint(equalTo: placeLabel.leadingAnchor,constant: -20).isActive = true
        
        plant.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        plant.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20).isActive = true
        plant.heightAnchor.constraint(equalToConstant: 20).isActive = true
        plant.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        plantsCount.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        plantsCount.leadingAnchor.constraint(equalTo: plant.trailingAnchor,constant: 5).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("")
    }
}
