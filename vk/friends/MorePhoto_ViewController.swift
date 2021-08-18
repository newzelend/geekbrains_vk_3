//
//  MorePhoto_ViewController.swift
//  vk
//
//  Created by Grisha Pospelov on 07.06.2021.
//

import UIKit

private let reuseIdentifier = "MorePhoto_CollectionViewController"

class MorePhoto_CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var users = UserDataStorage.users
    var userPhotos = UserPhotoGalleryDataStorage.userPhotoGallery
    var userId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = users[userId ?? 0].name + " " + users[userId ?? 0].lastname
    }

    //MARK: - UICollectionViewDelegateFlowLayout

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            if userId != nil {
                if userPhotos[userId!].imageNames != nil {
                    return CGSize(width: 118.0, height: 118.0)
                }
            }
            
           return CGSize(width: 300.0, height: 300.0)
        }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if userId != nil {
            if userPhotos[userId!].imageNames != nil {
                return userPhotos[userId!].imageNames!.count
            }
        }
        
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MorePhoto_CollectionViewCell", for: indexPath) as! MorePhoto_CollectionViewCell
        
        if userId != nil {
            if userPhotos[userId!].imageNames != nil {
                cell.friendPhotoView.image = UIImage(named: userPhotos[userId!].imageNames![indexPath.row])
            } else {
                cell.friendPhotoView.image = UIImage(named: users[userId ?? 0].imageName ?? "defaultAvatar")
            }
        } else {
            cell.friendPhotoView.image = UIImage(named: users[userId ?? 0].imageName ?? "defaultAvatar")
        }
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let MorePhoto2_ViewController = segue.destination as? MorePhoto2_ViewController,
              let indexCell = collectionView.indexPathsForSelectedItems?[0].row

        else { return }
        
        MorePhoto2_ViewController.userId = userId!
        MorePhoto2_ViewController.photoId = indexCell
        
    }
}
