//
//  ViewController.swift
//  SidemenuTest
//
//  Created by Yuki Shinohara on 2020/07/08.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//
import UIKit
import SideMenu

class ViewController: UIViewController {
    
    var menu: SideMenuNavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        menu = SideMenuNavigationController(rootViewController: ListViewController()) //メニューを配置
        menu?.leftSide = true //左側に
        menu?.setNavigationBarHidden(true, animated: false) //ナビゲーションバーを隠す
        
        SideMenuManager.default.leftMenuNavigationController = menu //スワイプするメニューの設定(ないとスワイプできん)
        SideMenuManager.default.addPanGestureToPresent(toView: self.view) //開いてなくてもスワイプしたら開く設定
        
    }
    
    @IBAction func didTapButton(){
        present(menu!, animated: true)
    }
}

class ListViewController: UITableViewController {
    let array = ["first", "second", "third", "first", "second", "third", "first", "second", "third"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .blue
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .blue
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //do something
    }
}
