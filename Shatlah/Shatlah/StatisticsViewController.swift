//
//  StatisticsViewController.swift
//  Shatlah
//
//  Created by Abdullah Alnutayfi on 17/12/2021.
//
import UIKit
import Firebase
class StatisticsViewController: UIViewController {
var count = 0
var firstOne = ""
    var names : [String] = []
    var pl : [Int] = []
    var users2 : [MyUser] = []
    var users : [MyUser] = []
    let db = Firestore.firestore()
    lazy var logo : UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "chart.bar.xaxis")
        $0.tintColor = .orange
        return $0
    }(UIImageView())
    
    lazy var viewtitle : UILabel = {
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "المراكز"
        $0.textColor = .red
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        
        return $0
    }(UILabel())
    lazy var tableView : UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(MyCell.self, forCellReuseIdentifier: "cell")
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 600
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.dataSource = self
        $0.layer.cornerRadius = 10
     //   $0.refreshControl = refreshControl
        return $0
    }(UITableView())
    
    lazy var first : UILabel = {
        $0.backgroundColor = .black
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "1"
        $0.textAlignment = .center

        $0.textColor = .white
       // $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 50, weight: .bold)

        return $0
    }(UILabel())
    
    lazy var firstPlaceName : UILabel = {
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "أمل"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return $0
    }(UILabel())
    
    lazy var second : UILabel = {
        $0.backgroundColor = .darkGray
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "2"
        $0.textAlignment = .center
        $0.textColor = .white
    //    $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        
        return $0
    }(UILabel())
    
    lazy var secondPlaceName : UILabel = {
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "نورا"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return $0
    }(UILabel())
    
    
    
    lazy var third : UILabel = {
        
        $0.backgroundColor = .lightGray
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "3"
        $0.textAlignment = .center

        $0.textColor = .black
       // $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 50, weight: .bold)

        return $0
    }(UILabel())
    
    lazy var thirdPlaceName : UILabel = {
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "عبدالله"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return $0
    }(UILabel())
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
       // print(self.users)
        view.addSubview(first)
        view.addSubview(second)
        view.addSubview(third)
        view.addSubview(tableView)
        view.addSubview(firstPlaceName)
        view.addSubview(secondPlaceName)
        view.addSubview(thirdPlaceName)
        view.addSubview(logo)
        view.addSubview(viewtitle)
        firstPlaceName.text = firstOne
    //    view.addSubview(newLable)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            logo.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            logo.widthAnchor.constraint(equalToConstant: 100),
            logo.heightAnchor.constraint(equalToConstant: 100),

            viewtitle.trailingAnchor.constraint(equalTo: logo.leadingAnchor,constant: -7),
            viewtitle.centerYAnchor.constraint(equalTo: logo.centerYAnchor),
            
            firstPlaceName.topAnchor.constraint(equalTo: logo.bottomAnchor,constant: 50),
            firstPlaceName.centerXAnchor.constraint(equalTo: first.centerXAnchor),
            
            first.topAnchor.constraint(equalTo: firstPlaceName.bottomAnchor,constant: 10),
            first.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            first.heightAnchor.constraint(equalToConstant: 50),
            first.widthAnchor.constraint(equalToConstant: 100),
            
         
            secondPlaceName.trailingAnchor.constraint(equalTo: first.leadingAnchor,constant: -30),
            secondPlaceName.centerYAnchor.constraint(equalTo: first.centerYAnchor),
            
            second.topAnchor.constraint(equalTo: first.bottomAnchor),
            second.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            second.heightAnchor.constraint(equalToConstant: 50),
            second.widthAnchor.constraint(equalToConstant: 150),
            
            thirdPlaceName.leadingAnchor.constraint(equalTo: first.trailingAnchor,constant: 20),
            thirdPlaceName.centerYAnchor.constraint(equalTo: first.centerYAnchor),
            
            third.topAnchor.constraint(equalTo: first.bottomAnchor),
            third.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            third.heightAnchor.constraint(equalToConstant: 50),
            third.widthAnchor.constraint(equalToConstant: 150),
            
            tableView.topAnchor.constraint(equalTo: third.bottomAnchor,constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            
        ])
      
    }
    
    func getData(){
        db.collection("Users")//.order(by: "totalAmountOftrees")
            .getDocuments { querySnapshot, error in
                if let error = error{
                    print("Error",error.localizedDescription)
                }else{
                    guard querySnapshot != nil else{return}
                    for doc in querySnapshot!.documents{
                        let data = doc.data()
                        let userName = data["fullName"] as? String ?? ""
                        let plantNumber = data["totalAmountOftrees"] as? Int ?? 0
                        self.users.append(MyUser(fullName: userName, totalAmountOftrees: plantNumber))
                        self.tableView.reloadData()
                    }
                    self.users2.append(contentsOf: self.users)
                }
            }
    }
  

}

extension StatisticsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
        cell.nameLable.text = "عبدالله"
        count+=1
        cell.placeLabel.text = ".\(count)"
        firstPlaceName.text = users.sorted(by:{$0.totalAmountOftrees > $1.totalAmountOftrees})[0].fullName
        secondPlaceName.text = users.sorted(by:{$0.totalAmountOftrees > $1.totalAmountOftrees})[1].fullName
        thirdPlaceName.text = users.sorted(by:{$0.totalAmountOftrees > $1.totalAmountOftrees})[2].fullName
        cell.nameLable.text = users.sorted(by:{$0.totalAmountOftrees > $1.totalAmountOftrees})[indexPath.row].fullName
        cell.plantsCount.text = String(users.sorted(by:{$0.totalAmountOftrees > $1.totalAmountOftrees})[indexPath.row].totalAmountOftrees)
    
        cell.plant.image = UIImage(systemName: "leaf.fill")
        return cell
    }
    
    func getUsers(){
        
    }
}

struct MyUser {
    var fullName : String
    var totalAmountOftrees : Int
}
