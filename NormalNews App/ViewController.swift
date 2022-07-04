//
//  ViewController.swift
//  NormalNews App
//
//  Created by Vignesh Kumar H S on 18/05/22.
//

import UIKit

class ViewController: UIViewController {

    
    var newsData = [NewsModal]()
    
    @IBOutlet weak var newsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTable.delegate = self
        newsTable.dataSource = self
        
        fetchFreshNews()
        
        
    }

    
    func fetchFreshNews() {
        
        NewsWebServices.fetchNews{
            let result = resultNews
            
            if result != nil {
                DispatchQueue.main.async {
                    newsData = result
                    newsTable.reloadData()
                }
            }
            
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
        cell.title = 
    }
    
    
}

