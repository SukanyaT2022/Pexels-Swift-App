//
//  PhotoDetailViewController.swift
//  PexelCloneApp
//
//  Created by Tiparpron Sukanya on 11/16/23.
//

import Foundation
import UIKit
import CoreData
class  PhotoDetailViewController:
    UIViewController{
    var photoObject : Photo?
    var favouritePhotoObj : PhotoEntity?
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photographerLabel: UILabel!
    
    @IBOutlet weak var favouriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      displayData()
    }
    func displayData(){
        if let photoObject = photoObject{
            titleLabel.text = photoObject.alt
            photographerLabel.text = photoObject.photographer
            if let imagePath = photoObject.src?.small{
                downloadImage(path:imagePath)
            }
        }
        if let favouritePhotoObj = favouritePhotoObj{
            titleLabel.text = favouritePhotoObj.name
            photographerLabel.text = favouritePhotoObj.photographerName
            if let imagePath = favouritePhotoObj.imagePath{
                downloadImage(path:imagePath)
            }
//            favouriteButton.isHidden = true
            favouriteButton.setTitle("delete", for: .normal)
            //change color when show delete button
            favouriteButton.backgroundColor = UIColor.red
        }
        
    }
    //it downloadimage on the last screen
    func downloadImage(path: String){
        if let url = URL(string: path){
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data{
                    let image = UIImage(data:data)
                    DispatchQueue.main.async {
                        self.photoImageView.image = image
                    }
                }
            }
            task.resume()
        }
    }
    //this button should save fav photos in the database
    @IBAction func favouriteButtonAction(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            //delete favourite
            if let favouritePhotoObj = favouritePhotoObj{
                context.delete(favouritePhotoObj)
                self.navigationController?.popViewController(animated: true)
                return
            }
            //crte entity and save data
            let description = NSEntityDescription.entity(forEntityName: "PhotoEntity", in: context)
            let photoEntity = NSManagedObject(entity: description!, insertInto: context) as? PhotoEntity
            photoEntity?.photoId = String(photoObject?.photographer_id ?? 0)
            //PhotoObject line 13
            photoEntity?.name = photoObject?.alt
            photoEntity?.photographerName = photoObject?.photographer
            photoEntity?.imagePath = photoObject?.src?.small
            //line below save all data in database
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            //line below after hit favourite button it have to go back to all page
            self.navigationController?.popViewController(animated: true)
        }
    }
}

