

import UIKit
import Foundation

class ThirdViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var _constant=Constant()
    var badInfo=[Dictionary<String,String>()]
    var tableView=UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title="黑名单"
        self.navigationController?.navigationBar.titleTextAttributes=[NSFontAttributeName: UIFont(name: _constant._textFont, size: 18.0)!]
        self.view.backgroundColor=UIColor.whiteColor()
        self.navigationController!.navigationBar.translucent = false//取消渐变效果...
        
        
        tableView=UITableView(frame:self.view.frame)
        tableView.delegate=self
        tableView.dataSource=self
        self.view.addSubview(tableView)
        //create a reusable cell...
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        tableView.separatorStyle = .None
        
        badInfo[0]=["name":"同城汇融","company":"滨州日日生金投资有限公司","danger":"无法提现"]
        badInfo.append(["name":"魔环理财","company":"上海魔环金融信息服务有限公司","danger":"无法提现"])
        badInfo.append(["name":"魔环理财","company":"上海魔环金融信息服务有限公司","danger":"无法提现"])
        badInfo.append(["name":"魔环理财","company":"上海魔环金融信息服务有限公司","danger":"无法提现"])
        badInfo.append(["name":"魔环理财","company":"上海魔环金融信息服务有限公司","danger":"无法提现"])
        badInfo.append(["name":"魔环理财","company":"上海魔环金融信息服务有限公司","danger":"无法提现"])
        badInfo.append(["name":"魔环理财","company":"上海魔环金融信息服务有限公司","danger":"无法提现"])
        badInfo.append(["name":"魔环理财","company":"上海魔环金融信息服务有限公司","danger":"无法提现"])
        badInfo.append(["name":"魔环理财","company":"上海魔环金融信息服务有限公司","danger":"无法提现"])
        badInfo.append(["name":"魔环理财","company":"上海魔环金融信息服务有限公司","danger":"无法提现"])
        badInfo.append(["name":"魔环理财","company":"上海魔环金融信息服务有限公司","danger":"无法提现"])
        badInfo.append(["name":"魔环理财","company":"上海魔环金融信息服务有限公司","danger":"无法提现"])
        badInfo.append(["name":"魔环理财","company":"上海魔环金融信息服务有限公司","danger":"无法提现"])
        badInfo.append(["name":"魔环理财","company":"上海魔环金融信息服务有限公司","danger":"无法提现"])
        badInfo.append(["name":"魔环理财","company":"上海魔环金融信息服务有限公司","danger":"无法提现"])

        
        //下拉刷新控件初始化...
        var refreshControl: UIRefreshControl!
        refreshControl=UIRefreshControl()
        tableView.addSubview(refreshControl)
        refreshControl.attributedTitle=NSAttributedString(string: "下拉刷新")
        refreshControl.addTarget(self, action: "refresh", forControlEvents: .ValueChanged)
        
        
        // 加载更多按扭的背景视图
        var tableFooterView:UIView = UIView()
        tableFooterView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 44)
        tableFooterView.backgroundColor = UIColor.greenColor()
        self.tableView.tableFooterView = tableFooterView
        // 加载更多的按扭
        let loadMoreBtn = UIButton()
        loadMoreBtn.frame = CGRectMake(0, 0, self.view.bounds.width, 44)
        loadMoreBtn.setTitle("上拉加载", forState: .Normal)
        loadMoreBtn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        loadMoreBtn.addTarget(self, action: "loadMore", forControlEvents: .TouchUpInside)
        tableFooterView.addSubview(loadMoreBtn)
        

    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return badInfo.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID:String="cellIdentifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID,forIndexPath:indexPath) as UITableViewCell
        cell.textLabel!.text=badInfo[indexPath.row]["name"]
        
       
        return cell
    }
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
