import UIKit

class CustomSubtitle: UILabel {

    init(text: String){
        super.init(frame: .zero)
        self.text = text
        self.font = UIFont.boldSystemFont(ofSize: 20)
        self.numberOfLines = 0
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
