import UIKit
import SnapKit
class RegisterController: UIViewController {
    
    //MARK: - Constants
    let halfFullHeight = UIScreen.main.bounds.height / 8
    
    //MARK: - UI Components
    private let headerTitle = CustomTitle(text: "Welcome Onboard!", colorVariant: .black)
    private let headerSubtitle = CustomSubtitle(text: "Lets help you in completing your tasks")
    private let registerButton = CustomButton(title: "Register")
    let signInButton = UIButton()

    
    //Form subtitles
    private let fullNameSubtitle = CustomSubtitle(text: "Full name")
    private let emailSubtitle = CustomSubtitle(text: "Email")
    private let passSubtitle = CustomSubtitle(text: "Password")
    private let subPassSubtitle = CustomSubtitle(text: "Confirm Password")
    
    //Form inputs
    private let fullNameInput = CustomTextField(fieldType: .fullName)
    private let emailInput = CustomTextField(fieldType: .email)
    private let passInput = CustomTextField(fieldType: .password)
    private let subPassInput = CustomTextField(fieldType: .submitPassword)
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        navigationController?.navigationBar.isHidden = true
        getScreen()
    }
    
    
    //MARK: - Setup UI
    func getScreen(){
        
        view.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        view.addSubview(headerTitle)
        view.addSubview(headerSubtitle)
        view.addSubview(registerButton)
        
        //Form Subtitles
        view.addSubview(fullNameSubtitle)
        view.addSubview(emailSubtitle)
        view.addSubview(passSubtitle)
        view.addSubview(subPassSubtitle)
        
        //Form Inputs
        view.addSubview(fullNameInput)
        view.addSubview(emailInput)
        view.addSubview(passInput)
        view.addSubview(subPassInput)

        //Full name field
        fullNameSubtitle.snp.makeConstraints{maker in
            maker.top.equalTo(headerSubtitle).inset(70)
            maker.left.equalToSuperview().inset(40)
        }
        fullNameInput.snp.makeConstraints{maker in
            maker.top.equalTo(fullNameSubtitle).inset(30)
            maker.centerX.equalToSuperview()
        }

        //Email field
        emailSubtitle.snp.makeConstraints{maker in
            maker.top.equalTo(fullNameInput).inset(70)
            maker.left.equalToSuperview().inset(40)
        }
        emailInput.snp.makeConstraints{maker in
            maker.top.equalTo(emailSubtitle).inset(30)
            maker.centerX.equalToSuperview()
        }
        
        //Password field
        passSubtitle.snp.makeConstraints{maker in
            maker.top.equalTo(emailInput).inset(70)
            maker.left.equalToSuperview().inset(40)
        }
        passInput.snp.makeConstraints{maker in
            maker.top.equalTo(passSubtitle).inset(30)
            maker.centerX.equalToSuperview()
        }
        
        //Submit password field
        subPassSubtitle.snp.makeConstraints{maker in
            maker.top.equalTo(passInput).inset(70)
            maker.left.equalToSuperview().inset(40)
        }
        subPassInput.snp.makeConstraints{maker in
            maker.top.equalTo(subPassSubtitle).inset(30)
            maker.centerX.equalToSuperview()
        }
        
        headerTitle.snp.makeConstraints{maker in
            maker.top.equalTo(halfFullHeight)
            maker.centerX.equalToSuperview()}
        
        headerSubtitle.snp.makeConstraints{maker in
            maker.top.equalTo(headerTitle).inset(24)
            maker.centerX.equalToSuperview()}
    
        registerButton.snp.makeConstraints{maker in
            maker.bottom.equalToSuperview().inset(90)
            maker.centerX.equalToSuperview()}
        
        signInButton.setTitle("Alredy have account ? Sign in", for: .normal)
        signInButton.setTitleColor(.link, for: .normal)
        
        view.addSubview(signInButton)
        
        signInButton.snp.makeConstraints{maker in
            maker.top.equalTo(registerButton).inset(70)
            maker.centerX.equalToSuperview()}
    }
    
    //MARK: - Selectors
    @objc func signIn(){
        let loginPageVC = LoginPageController()
        navigationController?.pushViewController(loginPageVC, animated: true)
    }
}
