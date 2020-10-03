//
//  TrailerViewController.swift
//  Flix
//
//  Created by Summer Hasama on 10/1/20.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController, WKUIDelegate{
    

    @IBOutlet weak var trailerWebView: WKWebView!
    

    var videos = [[String: Any]]()
    var movie: [String: Any]!
    
    override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            trailerWebView = WKWebView(frame: .zero, configuration: webConfiguration)
            trailerWebView.uiDelegate = self
            view = trailerWebView
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL = "https://api.themoviedb.org/3/movie/"
        let idPath = movie["id"] as! Int
        let afterURL = "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let myURL = URL(string: baseURL + String(idPath) + afterURL)!
        let request = URLRequest(url: myURL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            self.videos = dataDictionary["results"] as! [[String: Any]]
            
            
            print(self.videos)

            
            let myBaseURL = "https://www.youtube.com/watch?v="
            let first = self.videos[0]
            let videoKey = first["key"] as! String
            print(videoKey)
            let myVideoURL = URL(string: myBaseURL + videoKey)
            let myRequest = URLRequest(url: myVideoURL!)
            self.trailerWebView.load(myRequest)
           
           }
        }
        task.resume()
        
        
        
        
    }}
    
