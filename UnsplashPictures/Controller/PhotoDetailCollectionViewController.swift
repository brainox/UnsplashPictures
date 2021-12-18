//
//  PhotosCollectionView.swift
//  UnsplashPictures
//
//  Created by Decagon on 18/12/2021.
//

import UIKit

class PhotoDetailCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let photosCellID = "photosCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PhotoDetailCollectionViewCell.self, forCellWithReuseIdentifier: photosCellID)
        collectionView.backgroundColor = .systemPink
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photosCellID, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 30)
    }
    
}
