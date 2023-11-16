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
    func getPhotos(query:String, completion:@escaping (Result<[Photo]?, Error>)-> Void ){
        baseUrl.append(query)// which photo from sesrch keyword
        let urlObj = URL(string: baseUrl)
        var request = URLRequest(url:urlObj!)// first url is parameter name --after url is value we pass
        request.httpMethod = "GET"
        request.setValue(api_key, forHTTPHeaderField: "Authorization")
//   process request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                print(error)
                completion(.failure(error))
            }else{
                if let data = data{
                    let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
                    //json convert to photo
                    let photoResponse = try? JSONDecoder().decode(PhotoResponse.self, from: data)
                    print(json)
                    completion(.success(photoResponse?.photos))
                }
            }
        }
        task.resume()//task line 19 excute it
    }
}

//curl -H "Authorization: c19t5LBUeXItCyO5nb5bpds50rtTKwmX7xOeFa4PnEBN8jabAxpjQW6U" \
//  "https://api.pexels.com/v1/search?query=nature&per_page=1"
//
