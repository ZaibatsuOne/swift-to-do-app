import UIKit

class CustomTitle: UILabel {
    
    enum Color{
        case black
        case white
    }
    
    init(text: String, colorVariant: Color){
        super.init(frame: .zero)
        self.text = text
        self.font = UIFont.boldSystemFont(ofSize: 24)
        
        if colorVariant == .black{
            self.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
        else{
            self.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
