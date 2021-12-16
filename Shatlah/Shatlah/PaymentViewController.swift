//
//  PaymentViewController.swift
//  Shatlah
//
//  Created by mac on 16/12/2021.
//

import Foundation
import UIKit

class PaymentViewController: UIViewController {
    
    lazy var treeImage: UIImageView = {
        $0.image = UIImage(systemName: "person")
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
        
    }(UIImageView())
    
    lazy var priceLable: UILabel = {
        $0.text = "the price is 7"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var numberOfTreesLable: UILabel = {
        $0.text = "number of trees 1"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var payButton: UIButton = {
        $0.backgroundColor = .orange
        $0.tintColor = .black
        $0.titleLabel?.font =  UIFont.systemFont(ofSize: 32, weight: .bold)
        $0.setTitle("Pay", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(type: .system))
    
    lazy var cardNumTextfield: UITextField = {
        $0.placeholder = "Card number"
        $0.backgroundColor = .white
        $0.borderStyle = .roundedRect
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    lazy var cvvLable: UILabel = {
        $0.text = "cvv"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var cvvTextField: UITextField = {
        $0.placeholder = "enter cvv"
        $0.borderStyle = .roundedRect
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setUpUI()
        
    }
    
    private func setUpUI(){
        [treeImage, priceLable,numberOfTreesLable, payButton, cardNumTextfield,cvvLable,cvvTextField].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            treeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 150),
            treeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            treeImage.heightAnchor.constraint(equalToConstant: 200),
            treeImage.widthAnchor.constraint(equalToConstant: 200),
            
            
            numberOfTreesLable.topAnchor.constraint(equalTo: treeImage.bottomAnchor,constant: 50),
            numberOfTreesLable.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            
            priceLable.topAnchor.constraint(equalTo: numberOfTreesLable.bottomAnchor,constant: 10),
            priceLable.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            
            payButton.topAnchor.constraint(equalTo: priceLable.bottomAnchor,constant: 200),
            payButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            payButton.widthAnchor.constraint(equalToConstant: 200),
            
            cardNumTextfield.topAnchor.constraint(equalTo: priceLable.bottomAnchor,constant: 100),
            cardNumTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            
            cvvLable.topAnchor.constraint(equalTo: cardNumTextfield.bottomAnchor,constant: 15),
            cvvLable.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            
            cvvTextField.topAnchor.constraint(equalTo: cardNumTextfield.bottomAnchor,constant: 15),
            cvvTextField.leadingAnchor.constraint(equalTo: cvvLable.trailingAnchor,constant: 10)
        ])
}
    

}
