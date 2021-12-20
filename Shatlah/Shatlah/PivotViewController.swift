//
//  PivotViewController.swift
//  Shatlah
//
//  Created by mac on 19/12/2021.
//

import UIKit


class PivotViewController: UIViewController {
    let numberCountLable = UILabel()
    let goalText = UILabel()

    let storeButton = UIButton()
    let voluntaryButton = UIButton()
    
    let myView = UIView()
    let imageView1 = UIImageView(image: UIImage(named: "p2"))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutview()
        view.backgroundColor = .systemGray5
    }

    func layoutview(){

        //  green view
        let subView = UIView()
        subView.backgroundColor = #colorLiteral(red: 0.6572800083, green: 0.7696707369, blue: 0.6701526452, alpha: 1)
        subView.frame = CGRect(x: -110, y: 0, width: 400, height: 400)
        subView.layer.cornerRadius = 190
        view.addSubview(subView)
        
        // white view
        let subView2 = UIView()
        subView2.backgroundColor = .white
        subView2.frame = CGRect(x: 0, y: 310, width: 390, height: 1500)
        subView2.layer.cornerRadius = 70
        view.addSubview(subView2)
        
        // Image 1
        imageView1.frame = CGRect(x: 30, y: 85, width: 210, height: 290)
        view.addSubview(imageView1)

        // store button
        storeButton.frame = CGRect(x: 70, y: 460, width: 250, height: 70)
        storeButton.layer.cornerRadius = 30
        storeButton.backgroundColor = #colorLiteral(red: 0.3244385379, green: 0.4098693385, blue: 0.3512268958, alpha: 1)

        storeButton.setTitle("المتجر", for: .normal)
        storeButton.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 30)
        view.addSubview(storeButton)
        storeButton.addTarget(self, action: #selector (GoToStorTableVC), for: .touchDown)

        // store button
        voluntaryButton.frame = CGRect(x: 70, y: 550, width: 250, height: 70)
        voluntaryButton.layer.cornerRadius = 30
        voluntaryButton.backgroundColor = #colorLiteral(red: 0.3244385379, green: 0.4098693385, blue: 0.3512268958, alpha: 1)
        voluntaryButton.setTitle("تطوع", for: .normal)
        voluntaryButton.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 30)
        view.addSubview(voluntaryButton)
        voluntaryButton.addTarget(self, action: #selector (GoToVolVC), for: .touchDown)
       
    }
    @objc func GoToVolVC(){
        let vc = VolunteerViewController()
        let navController = UINavigationController(rootViewController: vc)
       // navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
}
    
    @objc func GoToStorTableVC(){
        let vc = DashboardTabBarController()
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
}
}
