//
//  UserPhotoGallery.swift
//  vk
//
//  Created by Grisha Pospelov on 07.06.2021.
//

import Foundation

struct UserPhotoGallery {
    let userId: Int
    let imageNames: [String]?
    
    init(userId: Int, imageNames: [String]? = nil) {
        self.userId = userId
        self.imageNames = imageNames
    }
}

struct UserPhotoGalleryDataStorage {
    static var userPhotoGallery: [UserPhotoGallery] = [
        UserPhotoGallery(userId: 0, imageNames: ["толстой","Эвен","лермантов","маяковский","достаевский"]),
        UserPhotoGallery(userId: 1, imageNames: ["толстой","Эвен","лермантов","маяковский","достаевский"]),
        UserPhotoGallery(userId: 2, imageNames: ["толстой","Эвен","лермантов","маяковский","достаевский"]),
        UserPhotoGallery(userId: 3, imageNames: ["толстой","Эвен","лермантов","маяковский","достаевский"]),
        UserPhotoGallery(userId: 4, imageNames: ["толстой","Эвен","лермантов","маяковский","достаевский"]),
        UserPhotoGallery(userId: 5, imageNames: ["толстой","Эвен","лермантов","маяковский","достаевский"]),
        UserPhotoGallery(userId: 6, imageNames: ["толстой","Эвен","лермантов","маяковский","достаевский"]),
        UserPhotoGallery(userId: 7, imageNames: ["толстой","Эвен","лермантов","маяковский","достаевский"]),
        UserPhotoGallery(userId: 8, imageNames:["толстой","Эвен","лермантов","маяковский","достаевский"]),
        UserPhotoGallery(userId: 9, imageNames: ["толстой","Эвен","лермантов","маяковский","достаевский"]),
        UserPhotoGallery(userId: 10, imageNames: ["толстой","Эвен","лермантов","маяковский","достаевский"]),
        UserPhotoGallery(userId: 11, imageNames: ["толстой","Эвен","лермантов","маяковский","достаевский"]),
    ]
}
