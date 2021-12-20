//
//  PhotoModel.swift
//  UnsplashPictures
//
//  Created by Decagon on 19/12/2021.
//

import UIKit

protocol PhotoModel {
    func numberOfPhotos() -> Int
    func photoName(at index: Int) -> String?
    mutating func photoSize(at index: Int) -> CGSize?
    func photo(at index: Int) -> UIImage?
}

struct PhotoCollection: PhotoModel {
    var creatorName: [String]?
    let photoNames: [String]
    var photoSizes: [String: CGSize] = [:]
    init(photos: [String]) {
        photoNames = photos
    }
    func numberOfPhotos() -> Int {
        return photoNames.count
    }
    
    func photoName(at index: Int) -> String? {
        guard index < photoNames.count else {
            return nil
        }
        return photoNames[index]
    }
    
    mutating func photoSize(at index: Int) -> CGSize? {
        guard let name = photoName(at: index), name != "" else {
            return nil
        }
        if let size = photoSizes[name] {
            return size
        } else {
            photoSizes[name] = photo(at: index)?.size
            return photoSizes[name]
        }
    }
    

    func photo(at index: Int) -> UIImage? {
        guard let name = photoName(at: index), name != "" else {
            return nil
        }
        return UIImage(named: name)
    }
}
