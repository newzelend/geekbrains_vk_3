//
//  MorePhoto2_ViewController.swift
//  vk
//
//  Created by Grisha Pospelov on 27.06.2021.
//

import UIKit

class MorePhoto2_ViewController: UIViewController {

    @IBOutlet var FriendLargePhotoView: CarouselView!
    var userId: Int?
    var photoId: Int?
    var userPhotos = UserPhotoGalleryDataStorage.userPhotoGallery
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userId != nil && userPhotos[userId!].imageNames != nil {
            FriendLargePhotoView.imageNames = userPhotos[userId!].imageNames
            FriendLargePhotoView.visibleIndex = photoId!
        } else {
            FriendLargePhotoView.imageNames = ["defaultAvatar"]
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}
