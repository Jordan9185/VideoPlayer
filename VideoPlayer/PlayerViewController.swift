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
    
    var playVideoView: UIView!
    
    var footerView: UIView!
    
    var searchController: UISearchController!
    
    var player: AVPlayer!
    
    var isVideoPlaying: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpHeaderView()
        
        setUpPlayVideoView()
        
        setUpSearchBar()
        
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
        
        searchController.searchBar.delegate = self
        
        searchController.dimsBackgroundDuringPresentation = false
        
        searchController.searchBar.searchBarStyle = .prominent
        
        searchController.searchBar.sizeToFit()
        
        self.headerView.addSubview(searchController.searchBar)
        
    }
    
    func setUpPlayVideoView() {
        
        playVideoView = UIView()
        
        headerView.addSubview(playVideoView)
        
        playVideoView.translatesAutoresizingMaskIntoConstraints = false
        
        playVideoView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        
        playVideoView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        
        playVideoView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0).isActive = true
        
        playVideoView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
        
        playVideoView.widthAnchor.constraint(equalToConstant: headerView.frame.width).isActive = true
        
        playVideoView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
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
        
        playButton.addTarget(self, action: #selector(videoPlay), for: .touchUpInside)
        
        let MuteButton = UIButton()
        
        MuteButton.backgroundColor = .black
        
        MuteButton.setTitle("Mute", for: .normal)
        
        MuteButton.addTarget(self, action: #selector(videoMute), for: .touchUpInside)
        
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
    
    func videoPlay(_ sender: UIButton) {
        
        guard let player = player else {
            
            return
            
        }
        
        if isVideoPlaying {
            
            player.pause()
            
            isVideoPlaying = false
            
            sender.setTitle("Pause", for: .normal)
            
        } else {
            
            player.play()
            
            isVideoPlaying = true
            
            sender.setTitle("Play", for: .normal)
            
        }
        
    }
    
    func videoMute(_ sender:UIButton) {
        
        guard let player = player else {
            
            return
        }
        
        if player.isMuted {
            
            player.isMuted = false
            
            sender.setTitle("Mute", for: .normal)
            
        } else {
            
            player.isMuted = true
            
            sender.setTitle("Unmute", for: .normal)
            
        }

    }
    
}

extension PlayerViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let urlString = "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"
        
        guard
            
            let url = URL(string: urlString)
            
            else {
    
            print("url is nil")
            
            return
        }
        
        setUpAVPlayer(with: url)
        
    }
    
    func setUpAVPlayer(with url: URL) {
        
        let playerController = AVPlayerViewController()
        
        player = AVPlayer(url: url)
        
        playerController.player = player
        
        playerController.showsPlaybackControls = false
        
        player.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions(), context: nil)
        
        self.playVideoView.addSubview(playerController.view)
        
        playerController.view.frame = self.view.frame
        
        player.play()
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "status" {
            
            isVideoPlaying = true
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        player.removeObserver(self, forKeyPath: "status")

    }
    
}
