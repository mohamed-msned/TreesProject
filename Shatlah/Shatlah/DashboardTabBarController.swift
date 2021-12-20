//
//  DashboardTabBarController.swift
//  Shatlah
//
//  Created by Abdullah Alnutayfi on 15/12/2021.
//

import UIKit

class DashboardTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .darkGray
       // posts.getPosts()
        let item1 = StoreViewController()
        let item2 = UserProfileController()
        let item3 = StatisticsViewController()

        
        let icon1 = UITabBarItem(title: "متاجر", image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart"))
            item1.tabBarItem = icon1
        
        let icon2 = UITabBarItem(title: "الحساب", image: UIImage(systemName: "person.fill"), selectedImage: UIImage(systemName: "person.fill"))
            item2.tabBarItem = icon2
        
        
        let icon3 = UITabBarItem(title: "الإحصائيات", image: UIImage(systemName: "chart.xyaxis.line"), selectedImage: UIImage(systemName: "chart.xyaxis.line"))
           item3.tabBarItem = icon3
        
//        let icon4 = UITabBarItem(title: "Grids", image: UIImage(systemName: "rectangle.grid.2x2"), selectedImage: UIImage(systemName: "rectangle.grid.2x2.fill"))
//      //  item4.tabBarItem = icon4
      
       
        let controllers = [item1,item3,item2]
        self.viewControllers = controllers
        
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true
    }
}
