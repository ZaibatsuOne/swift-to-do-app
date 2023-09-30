import UIKit

class CustomTitle: UILabel {
    
    init(text: String){
        super.init(frame: .zero)
        self.text = text
        self.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
