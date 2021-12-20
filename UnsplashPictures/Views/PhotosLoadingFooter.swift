//
//  PhotosLoadingFooter.swift
//  UnsplashPictures
//
//  Created by Decagon on 20/12/2021.
//

import UIKit

class PhotosLoadingFooter: UICollectionReusableView {
    
    static let identifier = "PhotosLoadingFooter"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .darkGray
        activityIndicator.startAnimating()
        
        let label = UILabel()
        label.text = "Loading..."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        
        let stackView = VerticalStackView(arrangedSubviews: [activityIndicator, label], spacing: 8)
        
        addSubview(stackView)
        stackView.centerInSuperview(size: .init(width: 200, height: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
