//
//  ApiService.swift
//  NetOps Status
//
//  Created by Ricardo Lozano on 10/21/16.
//  Copyright © 2016 Social Reality Inc. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(completion: @escaping  ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/home_num_likes.json", completion: completion)
    }
    
    func fetchTrendingFeed(completion: @escaping  ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/trending.json", completion: completion)
    }
    
    func fetchSubscriptionFeed(completion: @escaping  ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/subscriptions.json", completion: completion)
    }
    func fetchEventsFeed(completion: @escaping  ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "http://lozanet.com/test/events.json", completion: completion)
    }
    
    func fetchFeedForUrlString(urlString: String, completion: @escaping  ([Video]) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            do {
                if let unwrappedData = data, let jsonDictionaries = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String: Any]] {
                    
                    DispatchQueue.main.async {
                        completion(jsonDictionaries.map({return Video(dictionary: $0)}))
                    }
                }
            } catch let jsonError {
                print(jsonError)
            }
            }.resume()
    }
}
