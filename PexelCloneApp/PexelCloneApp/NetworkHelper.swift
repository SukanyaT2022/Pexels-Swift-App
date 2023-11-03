//
//  NetworkHelper.swift
//  PexelCloneApp
//
//  Created by Tiparpron Sukanya on 11/1/23.
//

import Foundation
class NetworkHelper{
    var api_key = "c19t5LBUeXItCyO5nb5bpds50rtTKwmX7xOeFa4PnEBN8jabAxpjQW6U"
    var baseUrl = "https://api.pexels.com/v1/search?query="
    func getPhotos(query:String ){
        baseUrl.append(query)// which photo from sesrch keyword
        let urlObj = URL(string: baseUrl)
        var request = URLRequest(url:urlObj!)// first url is parameter name --after url is value we pass
        request.httpMethod = "GET"
        request.setValue(api_key, forHTTPHeaderField: "Authorization")
        
    //we continue next week create task
    }
}

//curl -H "Authorization: c19t5LBUeXItCyO5nb5bpds50rtTKwmX7xOeFa4PnEBN8jabAxpjQW6U" \
//  "https://api.pexels.com/v1/search?query=nature&per_page=1"
//
