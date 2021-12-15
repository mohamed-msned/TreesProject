//
//  DescriptionViewController.swift
//  Shatlah
//
//  Created by mac on 15/12/2021.
//

import Foundation
import UIKit

class DescriptionViewController: UIViewController {
    
    var amount = 0
    
    lazy var treeImage: UIImageView = {
        $0.image = UIImage(systemName: "person")
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
        
    }(UIImageView())
    
    lazy var descriptionTextView: UITextView = {
        $0.text = "tesstt"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
        
    }(UITextView())
    
    lazy var numOfTreesLable: UILabel = {
        $0.text = "\(0)"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var priceLable: UILabel = {
        $0.text = "the price is 7"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var plusButton: UIButton = {
        
        $0.tintColor = .black
        $0.titleLabel?.font =  UIFont.systemFont(ofSize: 32, weight: .bold)
        $0.setTitle("+", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
       // $0.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        $0.addTarget(self, action: #selector(plusButtonClicked), for: .touchDown)
        return $0
    }(UIButton(type: .system))
    
    lazy var minusButton: UIButton = {
        
        $0.tintColor = .black
        $0.titleLabel?.font =  UIFont.systemFont(ofSize: 32, weight: .bold)
        $0.setTitle("-", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(minusButtonClicked), for: .touchDown)

      //  $0.setBackgroundImage(UIImage(systemName: "minus"), for: .normal)
        return $0
    }(UIButton(type: .system))
    
    lazy var addButton: UIButton = {
        
        $0.tintColor = .black
        $0.titleLabel?.font =  UIFont.systemFont(ofSize: 32, weight: .bold)
        $0.setTitle("Add", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(type: .system))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setUpUI()
        
    }
    
    @objc func plusButtonClicked() {
        amount += 1
        numOfTreesLable.text = "\(amount)"
    }
    
    @objc func minusButtonClicked() {
        if amount == 0 {
            print("Hi")
            numOfTreesLable.text = "\(0)"
        }else {
            amount -= 1
            numOfTreesLable.text = "\(amount)"
        }
        
    }
    
    
    
    
    
    private func setUpUI(){
        [treeImage,descriptionTextView,priceLable, addButton,numOfTreesLable,plusButton,minusButton].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            treeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 150),
            treeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            treeImage.heightAnchor.constraint(equalToConstant: 200),
            treeImage.widthAnchor.constraint(equalToConstant: 200),
            
            descriptionTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 150),
            descriptionTextView.leadingAnchor.constraint(equalTo: treeImage.trailingAnchor, constant: 15),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 350),
            descriptionTextView.widthAnchor.constraint(equalToConstant: 200),
            
            priceLable.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor,constant: 100),
            priceLable.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            
            numOfTreesLable.topAnchor.constraint(equalTo: priceLable.bottomAnchor,constant: 15),
            numOfTreesLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            plusButton.topAnchor.constraint(equalTo: numOfTreesLable.bottomAnchor,constant: 5),
            plusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 220),
            
            minusButton.topAnchor.constraint(equalTo: numOfTreesLable.bottomAnchor,constant: 5),
            minusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 180),
            
            addButton.topAnchor.constraint(equalTo: minusButton.bottomAnchor,constant: 40),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 200),
        ])
}
}
