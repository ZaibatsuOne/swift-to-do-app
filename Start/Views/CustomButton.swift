//
//  CustomButton.swift
//  Start
//
//  Created by User on 30.09.2023.
//

import UIKit
import SnapKit

class CustomButton: UIButton {

    
    let fullWidth = UIScreen.main.bounds.width - 40
    
    init(title: String){
        
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor(red: 98/255, green: 210/255, blue: 195/255, alpha: 1)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        self.setTitleColor(.black, for: .normal)
        
        
        self.snp.makeConstraints{maker in
            maker.width.equalTo(fullWidth)
            maker.height.equalTo(50)}
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
