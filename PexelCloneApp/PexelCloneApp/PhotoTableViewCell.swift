//
//  PhotoTableViewCell.swift
//  PexelCloneApp
//
//  Created by Tiparpron Sukanya on 11/3/23.
// this is cell on page have segment

import Foundation
import UIKit
class PhotoTableViewCell: UITableViewCell{
    var photoData : Photo?
    var favourite : PhotoEntity?
    @IBOutlet weak var PhotoNameLabel: UILabel!
    @IBOutlet weak var photoIDLabel: UILabel!
}

