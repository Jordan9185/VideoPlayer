//
//  AVPlayerViewController.swift
//  VideoPlayer
//
//  Created by JordanLin on 2017/9/6.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    var headerView: UIView!
    
    var searchController: UISearchController!
    
    //let darkBlueGreyTwoColor = UIColor(red: 8, green: 21, blue: 35, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpHeaderView()
        
        setUpSearchBar()
        
        //setUpAVPlayer()
        
    }

    func setUpHeaderView() {
        
        headerView = UIView()
        
        headerView.backgroundColor = .black
        
        self.view.backgroundColor = .black
        
        self.view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        headerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        
        headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        headerView.heightAnchor.constraint(equalTo:self.view.heightAnchor).isActive = true
        
    }
    
    func setUpSearchBar() {
        
        searchController = UISearchController(searchResultsController: nil)
        
        //searchController.searchBar.delegate = self
        
        searchController.dimsBackgroundDuringPresentation = false
        
        searchController.searchBar.searchBarStyle = .prominent
        
        //searchController.searchBar.
        
        searchController.searchBar.sizeToFit()
        
        self.headerView.addSubview(searchController.searchBar)
        
    }
    
    func setUpAVPlayer() {
        
        let player = AVPlayer(url: URL(string:"http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")!)
        
        let playerController = AVPlayerViewController()
        
        let playerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        
        playerController.player = player
        
        self.addChildViewController(playerController)
        
        self.headerView.addSubview(playerView)
        
        playerView.addSubview(playerController.view)
        
        playerController.view.frame = self.view.frame
        
        player.play()
        
    }
    
}
