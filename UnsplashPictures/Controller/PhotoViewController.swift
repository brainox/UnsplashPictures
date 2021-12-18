//
//  ViewController.swift
//  UnsplashPictures
//
//  Created by Decagon on 17/12/2021.
//

import UIKit

class PhotoViewController: UIViewController {
    
    private var photosCollectionView: UICollectionView?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 10
//        layout.itemSize = CGSize(width: (view.frame.width/2) - 3, height: (view.frame.width/2)-3)
        
        photosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photosCollectionView?.backgroundColor = .white
        guard let photosCollectionView = photosCollectionView else { return }
        photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
       
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(photosCollectionView)
        photosCollectionView.frame = view.bounds
    }


}

extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath)
//        cell.contentView.backgroundColor = .brown
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: (view.frame.width/2) - 10, height: 250)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 5, bottom: 10, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoDetailCollectionViewController = PhotoDetailCollectionViewController(collectionViewLayout: UICollectionViewLayout())
        navigationController?.pushViewController(photoDetailCollectionViewController, animated: true)
    }
}

