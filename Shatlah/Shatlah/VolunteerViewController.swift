import UIKit

class VolunteerViewController: UIViewController {

    let goal = UILabel()
    let place = UILabel()
    let time = UILabel()
    let locationbut = UIButton()
    
    let goalImage = UIImageView()
    let placeImage = UIImageView()
    let timeImage = UIImageView()
    
    let goalDetails = UITextView()
    let placeDetails = UITextView()
    let timeDetails = UITextView()


    lazy var treeImage: UIImageView = {
        $0.image = UIImage(named: "volunteerPic")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 50
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9999999404, green: 0.9999999404, blue: 1, alpha: 1)
        setUpUI()
        ui()
    }
    
    private func setUpUI(){
        [treeImage].forEach{view.addSubview($0)}
        NSLayoutConstraint.activate([
            treeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40),
            treeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            treeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            treeImage.heightAnchor.constraint(equalToConstant: 200)
        ])
            }
    
    func ui(){
        
        //first label
        goal.frame = CGRect(x: 220, y: 355, width: 200, height: 50)
        goal.text = "الهدف :"
        goal.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        goal.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(goal)
        
        //second label
        place.frame = CGRect(x: 220, y: 455, width: 200, height: 50)
        place.text = "المكان :"
        place.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        place.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(place)
        
        
        
        //third label
        time.frame = CGRect(x: 220, y: 540, width: 200, height: 50)
        time.text = "التاريخ :"
        time.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        time.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(time)
        
        // goal details textView
        goalDetails.frame = CGRect(x: 45, y: 395, width: 250, height: 50)
        goalDetails.text = "العنايه بالأشجار ونشر الوعي بين متدربين المركز للمحافظة على المساحات الخضراء"
        goalDetails.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        goalDetails.textAlignment = .right
        goalDetails.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(goalDetails)
        
        // goal details textView
        placeDetails.frame = CGRect(x: 160, y: 495, width: 280, height: 50)
        placeDetails.text = "مبنى الاتحاد السعودي"
        placeDetails.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        goalDetails.textAlignment = .right
        placeDetails.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(placeDetails)
        
        //new add
        locationbut.frame = CGRect(x: 100, y: 495, width: 35, height: 35)
        locationbut.setBackgroundImage(UIImage(systemName: "mappin.and.ellipse"), for: .normal)
        locationbut.addTarget(self, action: #selector(GoToMap), for: .touchDown)
        view.addSubview(locationbut)
        
        // goal details textView
        timeDetails.frame = CGRect(x: 45, y: 580, width: 280, height: 50)
        timeDetails.text = "يوم الاحد ١٤٤٣/٥/١٤  في تمام الساعه ١ مساءا"
        timeDetails.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        timeDetails.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(timeDetails)
        
        // goal image
        goalImage.image = UIImage(systemName: "dot.circle.and.hand.point.up.left.fill")
        goalImage.frame = CGRect(x: 300, y: 370, width: 80, height: 70)
        goalImage.tintColor = .systemGray4
        view.addSubview(goalImage)
        
        // place image
        placeImage.image = UIImage(systemName: "mappin.and.ellipse")
        placeImage.frame = CGRect(x: 300, y: 460, width: 65, height: 70)
        placeImage.tintColor = .systemGray4
        view.addSubview(placeImage)
        
        // time image
        timeImage.image = UIImage(systemName: "clock")
        timeImage.frame = CGRect(x: 305, y: 555, width: 60, height: 60)
        timeImage.tintColor = .systemGray4
        view.addSubview(timeImage)
        

    }
    
    @objc func GoToMap(){
        let MappVC = MapVC()
        MappVC.modalPresentationStyle = .fullScreen
        self.present(MappVC, animated: true
                                           , completion: nil)

    }

    }
