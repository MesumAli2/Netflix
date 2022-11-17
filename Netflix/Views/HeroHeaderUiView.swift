  //
//  HeroHeaderUiView.swift
//  Netflix
//
//  Created by Mesum Syed on 17/11/2022.
//

import UIKit

class HeroHeaderUiView: UIView {
    
    private let downloadbutton : UIButton = {
        let button = UIButton()
        button.setTitle("Downloads", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()

    private let playButton : UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named:  "heroimage")
        return imageView
    } ()
    
    override init(frame : CGRect){
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadbutton)
        applyConstraint()
    }
    

    private func applyConstraint(){
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant:   120)
        ]
        let downloadButtonConstraints = [
            downloadbutton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadbutton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadbutton.widthAnchor.constraint(equalToConstant: 120
                                                 )
        ]
        
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    private func addGradient(){
        let gradientlayer = CAGradientLayer()
        gradientlayer.colors = [
            UIColor.clear.cgColor, UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
                
        ]
        gradientlayer.frame = bounds
        layer.addSublayer(gradientlayer)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        heroImageView.frame = bounds
    }
      
    required init(coder : NSCoder){
        fatalError()
    }

}
