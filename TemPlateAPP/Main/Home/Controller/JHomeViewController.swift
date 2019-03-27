//
//  JHomeViewController.swift
//  TemPlateAPP
//
//  Created by lorne on 2019/3/20.
//  Copyright © 2019 ice. All rights reserved.
//

import UIKit



class HeadNavView: UIView {
    
    var btnArray : [UIButton] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        var keys : [String] = ["推荐","发现","关注","消息"]
        for index in 0 ..< (Int)(keys.count){
            let itemBtn : UIButton = UIButton(type: .roundedRect)
            itemBtn.setTitle(keys[index], for: .normal)
            itemBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            itemBtn.setTitleColor(UIColor.gray, for: .normal)
            itemBtn.frame = CGRect(x: (55*index), y: 10, width:55, height: (Int(self.frame.size.height - 30)))
            itemBtn.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
            self.addSubview(itemBtn)
            if index == 0{
                itemBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
                itemBtn.setTitleColor(UIColor.black, for: .normal)
            }
            btnArray.append(itemBtn)
        }
    }
    
    @objc func btnClick(btn : UIButton) ->Void{
        for itemBtn in btnArray{
            if itemBtn == btn{
                itemBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
                itemBtn.setTitleColor(UIColor.black, for: .normal)
            }else{
                itemBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                itemBtn.setTitleColor(UIColor.gray, for: .normal)
            }
        }
    }
}



class ListCell: UITableViewCell {
    
    
    
    
}




class JHomeViewController: BaseViewController , UITableViewDelegate , UITableViewDataSource{
    
    var headNavView : HeadNavView!
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor  = UIColor.white
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    
    func setupUI() -> Void {
        headNavView = HeadNavView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 64))
        self.navigationItem.titleView = headNavView
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self;
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(frame: CGRect.zero)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
