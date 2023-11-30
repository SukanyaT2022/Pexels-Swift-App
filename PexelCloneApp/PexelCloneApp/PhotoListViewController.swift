//
//  PhotoListViewController.swift
//  PexelCloneApp
//
//  Created by Tiparpron Sukanya on 11/2/23.
//second screen view controller

import Foundation
import UIKit
import CoreData // library interact with database
class PhotoListViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var photoListTableView: UITableView!
    
    @IBOutlet weak var photoSegment: UISegmentedControl!
    
    var photoList : [Photo]?//[Photo comefrom model]
    var searchQuery = ""
    var showFavourite = false
    var favouritePhotoList: [PhotoEntity]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photoListTableView.delegate = self
       photoListTableView.dataSource = self
        self.getPhoto()
    }
    //call api here
    func getPhoto(){
        NetworkHelper().getPhotos(query: searchQuery) { result in
            switch result{
            case .success(let data):
                self.photoList = data
                DispatchQueue.main.async {
                    self.photoListTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    //fetch data from database
    func fetchPhoto(){
        let fetchRequest = PhotoEntity.fetchRequest()
        let photoList = try? (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext.fetch(fetchRequest)
        favouritePhotoList = photoList
    }
    @IBAction func photoSegmantAction(_ sender: UISegmentedControl) {
        //when segment 0 display show all when segment 1 show favourite
        if sender.selectedSegmentIndex == 0{
            showFavourite = false // show everything  why we use false
            self.photoListTableView.reloadData()
        }else{
         showFavourite = true // if true show only favourite datat
            fetchPhoto()
            self.photoListTableView.reloadData()
        }
    }
    
    
}



extension PhotoListViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if showFavourite == true{
            return favouritePhotoList?.count ?? 0
        }else{
            return photoList?.count ?? 0
        }
        //?? 0 incase photot not there take 0 as defaul
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //we create cell below use id
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as? PhotoTableViewCell
        if showFavourite == true{
         let photoData = favouritePhotoList?[indexPath.row]
            cell?.PhotoNameLabel.text = photoData?.name
            cell?.photoIDLabel.text = photoData?.photoId
            cell?.favourite = photoData
        }else{
            //else onky we show all data
            let photoData = photoList?[indexPath.row]// each row ex row 0
            //line 53 and 54 set data-text- to label
            cell?.PhotoNameLabel.text = photoData?.alt// alt is key from model and id to show the pic that user click
            cell?.photoIDLabel.text = "\(photoData?.photographer_id ?? 0)"
            cell?.photoData = photoData
        }
        
       
        
        return cell!
    }
    //tell which image is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? PhotoTableViewCell
       
        if showFavourite == true{
            self.performSegue(withIdentifier: "connectDetail", sender: cell?.favourite)// cell?.photoData from line 55
            //connectDetail this is id connect page from fifth lab
        }else{
            self.performSegue(withIdentifier: "connectDetail", sender: cell?.photoData)// cell?.photoData from line 55
            //connectDetail this is id connect page from fifth lab
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as? PhotoDetailViewController
        
        if showFavourite == true{
            detailViewController?.favouritePhotoObj = sender as? PhotoEntity
        }else{
            detailViewController?.photoObject = sender as? Photo
        }
    }
}
