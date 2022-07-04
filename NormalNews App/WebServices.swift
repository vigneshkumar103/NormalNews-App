//
//  WebServices.swift
//  NormalNews App
//
//  Created by Vignesh Kumar H S on 18/05/22.
//

import Foundation


class NewsWebServices: NSObject {
    
    let shared = NewsWebServices()
    func fetchNews(startDate: Date, closure: @escaping ([NewsModal]) -> Void) {
        let URLString = "https://newsapi.org/v2/everything?q=tesla&from=2022-04-18&sortBy=publishedAt&apiKey=API_KEY"
        

        let url = NSURL(string: URLString)
        let request = NSURLRequest(url: url as! URL)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, result, error in
            
            if error == nil {
                do {
                    let httpResponse: [NewsModal] = try (data as [NewsModal])
                    closure(httpResponse)

                } catch {
                    print("error")
                }
            }
        }
    }
}
