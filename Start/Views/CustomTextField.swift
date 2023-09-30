import UIKit
import SnapKit
class CustomTextField: UITextField {
    
    enum CustomTextFieldType{
        case fullName
        case email
        case password
        case submitPassword
    }
    
    private let authFieldType: CustomTextFieldType
    
    private let fullWidth = UIScreen.main.bounds.width - 40
    private let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        
        self.snp.makeConstraints{maker in
            maker.width.equalTo(fullWidth)
            maker.height.equalTo(50)
        }
        
        
        switch fieldType{
        case .fullName:
            self.placeholder = "Mary Elliot"
        case .email:
            self.placeholder = "mary.elliot@mail.com"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = "********"
            self.isSecureTextEntry = true
        case .submitPassword:
            self.placeholder = "********"
            self.isSecureTextEntry = true

        }
    }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
