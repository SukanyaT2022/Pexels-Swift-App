//
//  PhotoListViewController.swift
//  PexelCloneApp
//
//  Created by Tiparpron Sukanya on 11/2/23.
//second screen view controller

import Foundation
import UIKit
class PhotoListViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var photoListTableView: UITableView!
    
    @IBOutlet weak var photoSegment: UISegmentedControl!
    
    var photoList : [Photo]?//[Photo comefrom model]
    var searchQuery = ""
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
}

extension PhotoListViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoList?.count ?? 0
        //?? 0 incase photot not there take 0 as defaul
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //we create cell below use id
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as? PhotoTableViewCell
        let photoData = photoList?[indexPath.row]// each row ex row 0
        //line 53 and 54 set data-text- to label
        cell?.PhotoNameLabel.text = photoData?.alt// alt is key from model and id to show the pic that user click
        cell?.photoIDLabel.text = "\(photoData?.photographer_id ?? 0)"
        cell?.photoData = photoData
        
        return cell!
    }
    //tell which image is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? PhotoTableViewCell
        self.performSegue(withIdentifier: "connectDetail", sender: cell?.photoData)// cell?.photoData from line 55
        //connectDetail this is id connect page from fifth lab
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as? PhotoDetailViewController
        detailViewController?.photoObject = sender as? Photo
    }
}
