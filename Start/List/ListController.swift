import UIKit
import SnapKit

class ListController: UIViewController {

    //MARK: - Constants
    private let fullWidth = UIScreen.main.bounds.width
    private let fullHeight = UIScreen.main.bounds.height
        
    //MARK: - UIComponents
    private let profileBackground = UIView()
    private let userName = CustomTitle(text: "Welcome Mary!", colorVariant: .white)
    private let userAvatar = UIImageView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup()
    }
    
    //MARK: - UI Setup
    private func UISetup(){
        view.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        
        view.addSubview(profileBackground)
        view.addSubview(userName)
        view.addSubview(userAvatar)
        
        profileBackground.backgroundColor = UIColor(red: 98/255, green: 210/255, blue: 195/255, alpha: 1)
        
        let thirdScreen = fullHeight / 2.5
        profileBackground.snp.makeConstraints{maker in
            maker.width.equalTo(fullWidth)
            maker.height.equalTo(thirdScreen)}
        
        
        userName.snp.makeConstraints{maker in
            maker.bottom.equalTo(profileBackground).inset(20)
            maker.centerX.equalToSuperview()}
        
        userAvatar.image = UIImage(named: "userImg")
        
        userAvatar.snp.makeConstraints{maker in
            maker.bottom.equalTo(userName).inset(40)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(150)
            maker.height.equalTo(150)}
    }
    
    
    //MARK: - Selectors

}
