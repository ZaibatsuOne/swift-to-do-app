import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    // MARK: - UI Components
    private let getStartButton = CustomButton(title: "Get Start")
    private let headerTitle = CustomTitle(text: "Get things done with TODO", colorVariant: .black)
    private let headerSubtitle = CustomSubtitle(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed posuere gravida purus id eu condimentum est diam quam. Condimentum blandit diam.")
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getStartButton.addTarget(self, action: #selector(navigateToRegisterPage) , for: .touchUpInside)
        getScreen()
        
    }
    
    // MARK: - Setup UI
    func getScreen(){
        
        view.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        //Главное фото на встречающем экране
        let getStartImage = UIImageView()
        getStartImage.image = UIImage(named: "getStartImg")
        view.addSubview(getStartImage)
        
        let screenHeight = UIScreen.main.bounds.height
        let verticalPadding = screenHeight / 8
        
        getStartImage.snp.makeConstraints{maker in
            maker.top.equalTo(verticalPadding)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(187)
            maker.height.equalTo(170)}
        
        view.addSubview(headerTitle)
        view.addSubview(headerSubtitle)
        view.addSubview(getStartButton)
        
        headerTitle.snp.makeConstraints{maker in
            maker.bottom.equalTo(getStartImage).offset(70)
            maker.centerX.equalToSuperview()}
        
        headerSubtitle.snp.makeConstraints{maker in
            maker.top.equalTo(headerTitle).inset(35)
            maker.centerX.equalToSuperview()
            maker.left.equalToSuperview().inset(66)
            maker.right.equalToSuperview().inset(66)}
        
        getStartButton.snp.makeConstraints{maker in
            maker.bottom.equalToSuperview().inset(50)
            maker.centerX.equalToSuperview()}
    }
 
    //MARK: - Selectors
    @objc func navigateToRegisterPage(){
        print("button tap")
        let registerPageVC = RegisterController()
        navigationController?.pushViewController(registerPageVC, animated: true)
    }
}
