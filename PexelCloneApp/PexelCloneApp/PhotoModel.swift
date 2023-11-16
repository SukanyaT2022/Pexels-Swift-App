//
//  PhotoModel.swift
//  PexelCloneApp
//
//  Created by Tiparpron Sukanya on 11/1/23.
//this model comfrom --https://www.pexels.com/api/documentation/?language=ruby

import Foundation
struct PhotoResponse:Codable{
    var total_results: Int?
    var page: Int?
    var per_page: Int?
    var next_page: String?
    var photos: [Photo]?
}
struct Photo:Codable{
    var id: Int?
    var width: Int?
    var height: Int?
    var url: String?
    var photographer: String?
    var photographer_url: String?
    var photographer_id: Int?
    var avg_color: String?
    var src: Source?
    var liked:Bool?
    var alt: String?
}
struct Source:Codable{
    var original: String?
    var large2x: String?
    var large: String?
    var medium: String?
    var small: String?
    var portrait: String?
    var landscape: String?
    var tiny: String?
   
}

//{
//  "total_results": 10000,
//  "page": 1,
//  "per_page": 1,
//  "photos": [
//    {
//      "id": 3573351,
//      "width": 3066,
//      "height": 3968,
//      "url": "https://www.pexels.com/photo/trees-during-day-3573351/",
//      "photographer": "Lukas Rodriguez",
//      "photographer_url": "https://www.pexels.com/@lukas-rodriguez-1845331",
//      "photographer_id": 1845331,
//      "avg_color": "#374824",
//      "src": {
//        "original": "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png",
//        "large2x": "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
//        "large": "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=650&w=940",
//        "medium": "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=350",
//        "small": "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=130",
//        "portrait": "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
//        "landscape": "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
//        "tiny": "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
//      },
//      "liked": false,
//      "alt": "Brown Rocks During Golden Hour"
//    }
//  ],
//  "next_page": "https://api.pexels.com/v1/search/?page=2&per_page=1&query=nature"
//}
