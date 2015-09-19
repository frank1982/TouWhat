

import UIKit

class FirstViewController: UIViewController,UIScrollViewDelegate {
    
    var scrollView:UIScrollView!
    var pagControl:UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor=UIColor.whiteColor()
        self.title="投一个"
        self.navigationController?.navigationBar.titleTextAttributes=[NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSFontAttributeName: UIFont(name: "Copperplate-Light", size: 24.0)!]
        self.navigationController!.navigationBar.barTintColor=UIColor(red: CGFloat(238) / 255.0, green: CGFloat(0) / 255.0, blue: CGFloat(0) / 255.0, alpha: CGFloat(1))
        self.navigationController!.navigationBar.translucent = false//取消渐变效果...
        
        let WIDTH=self.view.frame.width
        let HEIGHT=self.view.frame.height
        
        var h=self.view.frame.origin.y
        print (h)
        
        //显示轮播...
        showScrollView()
        showVisitorNumber()
  
    }
    func showScrollView(){
        
        scrollView=UIScrollView(frame:CGRectMake(0, 0, self.view.frame.width, 150))
        scrollView.backgroundColor=UIColor.greenColor()
        self.view.addSubview(scrollView)
        
        var count=2
        var i:Int
        //add childView of scrollView...
        for(i=0;i<2;i++){
            
            var adView=UIView(frame: CGRectMake(0, 0, self.view.frame.width, 150))
            adView.backgroundColor=UIColor.blackColor()
            self.scrollView.addSubview(adView)
        }
        var scrollScopeWidth=self.view.frame.width*2
        //设置scrollView的最大范围...
        self.scrollView.contentSize=CGSizeMake(scrollScopeWidth, 0)
        self.scrollView.pagingEnabled = true
        self.scrollView.delegate = self
        
    }
    func showVisitorNumber(){
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
