import UIKit
import SnapKit
class LoginPageController: UIViewController {

    //MARK: - Constants
    private let halfFullHeight = UIScreen.main.bounds.height / 8

    //MARK: - UI Components
    private let headerTitle = CustomTitle(text: "Welcome back!", colorVariant: .black)
    private let loginPageImg = UIImageView()
    private let loginButton = CustomButton(title: "Login")
    private let registerButton = UIButton()
    private let recoveryPassButton = UIButton()
    
    //Form subtitles
    private let emailSubtitle = CustomSubtitle(text: "Email")
    private let passSubtitle = CustomSubtitle(text: "Password")
    
    //Form inputs
    private let emailInput = CustomTextField(fieldType: .email)
    private let passInput = CustomTextField(fieldType: .password)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        registerButton.addTarget(self, action: #selector(goRegisterPage), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(goListPage), for: .touchUpInside)
        navigationController?.navigationBar.isHidden = true
        UISetup()
    }
    
    // MARK: - UI Setup
    func UISetup(){
        view.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        view.addSubview(headerTitle)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        view.addSubview(emailSubtitle)
        view.addSubview(passSubtitle)
        view.addSubview(emailInput)
        view.addSubview(passInput)
        view.addSubview(recoveryPassButton)
        
        headerTitle.snp.makeConstraints{maker in
            maker.top.equalTo(halfFullHeight)
            maker.centerX.equalToSuperview()}
        
        
        loginPageImg.image = UIImage(named: "LoginPageImg")
        
        view.addSubview(loginPageImg)
        
        loginPageImg.snp.makeConstraints{maker in
            maker.top.equalTo(headerTitle).inset(60)
            maker.centerX.equalToSuperview()}
        
        loginButton.snp.makeConstraints{maker in
            maker.bottom.equalToSuperview().inset(90)
            maker.centerX.equalToSuperview()}
        
        registerButton.setTitle("Don’t have an account ? Sign Up", for: .normal)
        registerButton.setTitleColor(.link, for: .normal)
        
        registerButton.snp.makeConstraints{maker in
            maker.top.equalTo(loginButton).inset(70)
            maker.centerX.equalToSuperview()}
        
        //Email field
        emailSubtitle.snp.makeConstraints{maker in
            maker.top.equalTo(loginPageImg).inset(200)
            maker.left.equalToSuperview().inset(40)}
        
        emailInput.snp.makeConstraints{maker in
            maker.top.equalTo(emailSubtitle).inset(30)
            maker.centerX.equalToSuperview()}
        
        //Pasword field
        passSubtitle.snp.makeConstraints{maker in
            maker.top.equalTo(emailInput).inset(70)
            maker.left.equalToSuperview().inset(40)}
        
        passInput.snp.makeConstraints{maker in
            maker.top.equalTo(passSubtitle).inset(30)
            maker.centerX.equalToSuperview()}
        
        recoveryPassButton.setTitle("Forgot Password ?", for: .normal)
        recoveryPassButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        recoveryPassButton.setTitleColor(.link, for: .normal)
        
        recoveryPassButton.snp.makeConstraints{maker in
            maker.top.equalTo(passInput).inset(60)
            maker.right.equalToSuperview().inset(20)}
    }
    
    //MARK: - Selectors
    @objc func goRegisterPage(){
        let registerPageVC = RegisterController()
        navigationController?.pushViewController(registerPageVC, animated: true)
    }
    @objc func goListPage(){
        let listPageVC = ListController()
        navigationController?.pushViewController(listPageVC, animated: true)
    }
}
