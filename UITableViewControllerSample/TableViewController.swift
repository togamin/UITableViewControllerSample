//
//  TableViewController.swift
//  UITableViewControllerSample
//
//  Created by Togami Yuki on 2018/11/19.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    //配列を作成
    var animal = ["ペンギン","パンダ","コアラ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //セクションの数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //Sectioのタイトル
    override func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        
        var sectionTitle = ["動物","togamin.com"]
        
        return sectionTitle[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animal.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        //cellへの処理を書く
        cell.textLabel?.text = animal[indexPath.row]

        return cell
    }
    
    //テーブルのセルを横にずらし、「ボタン1」と「ボタン2」を表示
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let swipeBtn1 = UITableViewRowAction(style: .default, title: "ボタン1") { action, index in
            print("ボタン1",index)
            //処理を記述
        }
        swipeBtn1.backgroundColor = .blue
        let swipeBtn2 = UITableViewRowAction(style: .default, title: "ボタン2") { action, index in
            print("ボタン2",index)
            //処理を記述
        }
        swipeBtn2.backgroundColor = .red
        return [swipeBtn1,swipeBtn2]
    }
    
    //セルがタップされた時に動作する処理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "next",sender: nil)
    }
    
    //画面遷移時に呼び出される
    override func prepare(for segue:UIStoryboardSegue,sender:Any?){
        print("画面遷移中")
        if let indexPath = self.tableView.indexPathForSelectedRow{
            //遷移先のViewControllerを格納
            let controller = segue.destination as! NextViewController
            //遷移先の変数に代入
            controller.animal = animal[indexPath.row]
        }
    }
}
