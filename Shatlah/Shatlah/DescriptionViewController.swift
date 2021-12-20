
import Foundation
import UIKit

class DescriptionViewController: UIViewController {
    
    var amount = 0
    var price = 7
    
    lazy var treeImage: UIImageView = {
//        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "plant4")
//        $0.layer.cornerRadius = 25
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 50
        $0.clipsToBounds = true

        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
        
    }(UIImageView())
    
    lazy var nameTextView: UILabel = {
        $0.text = "اسم النبته"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var numOfTreesLable: UILabel = {
        $0.text = "\(0)"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var priceLable: UILabel = {
        $0.text = "the price is \(price)SR"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var plusButton: UIButton = {
        
        $0.tintColor = .darkGray
        $0.titleLabel?.font =  UIFont.systemFont(ofSize: 21, weight: .bold)
        $0.setTitle("▲", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
       // $0.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        $0.addTarget(self, action: #selector(plusButtonClicked), for: .touchDown)
        return $0
    }(UIButton(type: .system))
    
    lazy var minusButton: UIButton = {
        
        $0.tintColor = .systemGray4
        $0.titleLabel?.font =  UIFont.systemFont(ofSize: 21, weight: .bold)
        $0.setTitle("▼", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(minusButtonClicked), for: .touchDown)

      //  $0.setBackgroundImage(UIImage(systemName: "minus"), for: .normal)
        return $0
    }(UIButton(type: .system))
    
    lazy var addButton: UIButton = {
        $0.layer.cornerRadius = 25
        $0.backgroundColor = #colorLiteral(red: 0.4474006243, green: 0.5661959407, blue: 0.4921362544, alpha: 1)
        $0.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 25)
        
        $0.tintColor = #colorLiteral(red: 0.1631472032, green: 0.1677726545, blue: 0.1770464965, alpha: 1)
        $0.titleLabel?.font =  UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.setTitle("إضافه", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(addButtonClicked), for: .touchDown)
        return $0
    }(UIButton(type: .system))
    
    lazy var likeButton: UIButton = {
        $0.layer.cornerRadius = 25
        $0.backgroundColor = #colorLiteral(red: 0.9137255549, green: 0.9137254953, blue: 0.9137255549, alpha: 1)
        $0.tintColor = .darkGray
        $0.titleLabel?.font =  UIFont.systemFont(ofSize: 30, weight: .medium)
        $0.setTitle("♡", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(addLikeClicked), for: .touchDown)
        return $0
    }(UIButton(type: .system))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
    
        @objc func addButtonClicked() {
            let vc = PaymentViewController()
                    vc.amountOfTrees = amount
                    vc.totalPrice = price
            let navController = UINavigationController(rootViewController: vc)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true, completion: nil)
          }
    
    @objc func addLikeClicked() {

      }
    
    private func setUpUI(){
        [treeImage,nameTextView,priceLable, addButton,likeButton,numOfTreesLable,plusButton,minusButton].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            
            treeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            treeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            treeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            treeImage.heightAnchor.constraint(equalToConstant: 200),
            
            nameTextView.topAnchor.constraint(equalTo: treeImage.bottomAnchor,constant: 20),
            nameTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            minusButton.topAnchor.constraint(equalTo: treeImage.bottomAnchor,constant: 40),
            minusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 70),
            
            numOfTreesLable.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor,constant: 100),
            numOfTreesLable.centerYAnchor.constraint(equalTo: minusButton.centerYAnchor),
            
            nameTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -70),
            plusButton.centerYAnchor.constraint(equalTo: numOfTreesLable.centerYAnchor),
        
            priceLable.topAnchor.constraint(equalTo: numOfTreesLable.bottomAnchor,constant: 20),
            priceLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            nameTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            addButton.topAnchor.constraint(equalTo: priceLable.bottomAnchor,constant: 18),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 110),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            
            likeButton.topAnchor.constraint(equalTo: priceLable.bottomAnchor,constant: 18),
            likeButton.centerXAnchor.constraint(equalTo:priceLable.centerXAnchor),
            likeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            likeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -310),
            likeButton.heightAnchor.constraint(equalToConstant: 50),

        ])
}
}
