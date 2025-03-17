//
//  ViewController.swift
//  AnimeSearch
//
//  Created by Jportdev on 12/9/20.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func APISearchBtn(_ sender: Any) {
        let session = URLSession.shared
                let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
                    // Check the response
                print(response ?? "No response")
                    
                    // Check if an error occured
                    if error != nil {
                        // HERE you can manage the error
                        print(error ?? "Error file fetching content!")
                        return
                    }
                    
                    // Serialize the data into an object
                    do {
                        let json = try JSONDecoder().decode([Post].self, from: data! )
                            //try JSONSerialization.jsonObject(with: data!, options: [])
                        print(json)
                    } catch {
                        print("Error during JSON serialization: \(error.localizedDescription)")
                    }
                    
                })
                task.resume()
    }

}

