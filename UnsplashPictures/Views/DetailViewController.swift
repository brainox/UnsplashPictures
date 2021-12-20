//
//  DetailViewController.swift
//  UnsplashPictures
//
//  Created by Decagon on 20/12/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
//    private let swipeView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 8))
    
    let arrayOfText = ["haeag", "ahgla", "ahgalj", "llagja", "lhglakjg", "jajgaj", "haeag", "ahgla", "ahgalj", "llagja"]
    let arrayOfImages: [UIImage] = [
        UIImage(named: "DSCF6496.jpg")!,
        UIImage(named: "DSCF6520.jpg")!,
        UIImage(named: "DSCF6518.jpg")!,
        UIImage(named: "DSCF6531.jpg")!,
        UIImage(named: "DSCF6533.jpg")!,
        UIImage(named: "DSCF6597.jpg")!,
        UIImage(named: "DSCF6590.jpg")!,
        UIImage(named: "DSCF6631.jpg")!,
        UIImage(named: "DSCF6544.jpg")!,
        UIImage(named: "DSCF6593.jpg")!
    ]
    
    //dependency Injection
    var hdPhotoModel: PhotoModel!
    
    
    var position = Int()
//
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .orange
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let createdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Created by Leornado Da Vinci"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupScrollViews()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
    }
    
    func setupScrollViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(createdLabel)
        
//        scrollView.anchor(top: view.topAnchor, leading: nil, bottom: view.bottomAnchor, trailing: nil)
//        scrollView.centerXInSuperview()
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
//        imageView.anchor(top: 20, leading: 20, bottom: nil, trailing: 20)
        imageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10), size: CGSize(width: 0, height: 600))
        
        createdLabel.anchor(top: imageView.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10))
    }
}


// Gesture Handlers
extension DetailViewController {
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        switch gesture.direction {
        case .left:
            print("swipe left")
            if position < arrayOfText.count - 1 {
                position = position + 1
                createdLabel.text = arrayOfText[position]
                imageView.image = arrayOfImages[position]
                imageView.leftToRightAnimation()
            }
        case .right:
            print("swiped right")
            if position > 0 {
                position = position - 1
                createdLabel.text = arrayOfText[position]
                imageView.image = arrayOfImages[position]
                imageView.rightToLeftAnimation()
            }
        default:
            break
        }
    }
}
