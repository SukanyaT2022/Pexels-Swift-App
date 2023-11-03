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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photoListTableView.delegate = self
       photoListTableView.dataSource = self
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
        cell?.PhotoNameLabel.text = photoData?.alt// alt is key from model and id to show the pic that user click
        cell?.photoIDLabel.text = "\(photoData?.photographer_id ?? 0)"
        
        return cell!
    }
}
