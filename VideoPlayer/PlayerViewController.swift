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
    
    var footerView: UIView!
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpHeaderView()
        
        setUpSearchBar()
        
        //setUpAVPlayer()
        
        setUpFooterView()
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
        
        searchController.searchBar.sizeToFit()
        
        self.headerView.addSubview(searchController.searchBar)
        
    }
    
    func setUpFooterView() {
        
        footerView = UIView()
        
        let stackView = setStackView()
        
        footerView.addSubview(stackView)
        
        headerView.addSubview(footerView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: footerView.leadingAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: footerView.topAnchor).isActive = true
        
        stackView.widthAnchor.constraint(equalTo: footerView.widthAnchor).isActive = true
        
        stackView.heightAnchor.constraint(equalTo: footerView.heightAnchor).isActive = true

        stackView.backgroundColor = .red
        
        footerView.translatesAutoresizingMaskIntoConstraints = false
            
        footerView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        
        footerView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        
        footerView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -20).isActive = true
        
        footerView.widthAnchor.constraint(equalToConstant: headerView.frame.width).isActive = true
        
        footerView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        footerView.backgroundColor = .black
        
    }
    
    func setStackView() -> UIStackView {
        
        let stackView = UIStackView()
        
        let playButton = UIButton()
        
        playButton.backgroundColor = .black
        
        playButton.setTitle("Play", for: .normal)
        
        let MuteButton = UIButton()
        
        MuteButton.backgroundColor = .black
        
        MuteButton.setTitle("Mute", for: .normal)
        
        let flexiableView = UIView()
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        playButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        MuteButton.translatesAutoresizingMaskIntoConstraints = false
        
        MuteButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        stackView.axis = .horizontal
        
        stackView.addArrangedSubview(playButton)
        
        stackView.addArrangedSubview(flexiableView)
        
        stackView.addArrangedSubview(MuteButton)
        
        stackView.backgroundColor = .black

        return stackView
    }
    
}

