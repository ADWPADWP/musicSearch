//
//  ViewController.swift
//  Musicsearch
//
//  Created by Park Vladislav on 09.01.2023.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    var music = Song()
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: music.previewUrl)
        let urlrequest = URLRequest(url: url!)
        webview.load(urlrequest)
    }

}

