//
//  TitleCollectionViewCell.swift
//  Netflix
//
//  Created by Mesum Syed on 19/11/2022.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    static let identifier = "TitleCollectionViewCell"
    private let posterImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        posterImageView.frame = contentView.bounds
    }
    
    
    public func configure(with model: String){
        //print(model)
        
       
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
            return
        }
        
        
        posterImageView.sd_setImage(with: url, completed:  nil )
    }

}


