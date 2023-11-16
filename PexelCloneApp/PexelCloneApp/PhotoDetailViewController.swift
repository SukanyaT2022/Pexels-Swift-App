//
//  PhotoDetailViewController.swift
//  PexelCloneApp
//
//  Created by Tiparpron Sukanya on 11/16/23.
//

import Foundation
import UIKit
class  PhotoDetailViewController:
    UIViewController{
    var photoObject : Photo?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photographerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      displayData()
    }
    func displayData(){
        titleLabel.text = photoObject?.alt
        photographerLabel.text = photoObject?.photographer
        if let imagePath = photoObject?.src?.small{
            downloadImage(path:imagePath)
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
        }
    }
}

