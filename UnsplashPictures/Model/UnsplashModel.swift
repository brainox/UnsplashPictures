//
//  UnsplashModel.swift
//  UnsplashPictures
//
//  Created by Decagon on 20/12/2021.
//

import Foundation

struct UnsplashModel: Codable {
    let id: String?
    let urls: URLs?
    let links: Link?
    let user: User?
    let altDescription: String?
}

// MARK: - Link
public struct Link: Codable {
    let download: String?
}

// MARK: - URLs
public struct URLs: Codable {
    let thumb: String?
}

// MARK: - User
public struct User: Codable {
    let name: String?
}
