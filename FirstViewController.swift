

import UIKit

class FirstViewController: UIViewController,UIScrollViewDelegate {
    
    var scrollView:UIScrollView!
    var pageController:UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor=UIColor.whiteColor()
        self.title="投一个"
        self.navigationController?.navigationBar.titleTextAttributes=[NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSFontAttributeName: UIFont(name: "Copperplate-Light", size: 24.0)!]
        self.navigationController!.navigationBar.barTintColor=UIColor(red: CGFloat(238) / 255.0, green: CGFloat(0) / 255.0, blue: CGFloat(0) / 255.0, alpha: CGFloat(1))
        self.navigationController!.navigationBar.translucent = false//取消渐变效果...

        //显示轮播...
        showScrollView()
        
        //show page controller...
        showPageController()
        
        showVisitorNumber()
  
    }
    func showScrollView(){
        
        scrollView=UIScrollView(frame:CGRectMake(0, 0, self.view.frame.width, 150))
        scrollView.tag=1001
        self.view.addSubview(scrollView)
        
        var count=2
        var i:Int
        //add childView of scrollView...
        for(i=0;i<2;i++){
     
            var startX:CGFloat=self.view.frame.width*CGFloat(i)
            var adView=UIView(frame: CGRectMake(startX, 0, self.view.frame.width, 150))
            if (i == 0)
            {adView.backgroundColor=UIColor.grayColor()}
            if (i == 1)
            {adView.backgroundColor=UIColor.yellowColor()}
            self.scrollView.addSubview(adView)
        }
        var scrollScopeWidth=self.view.frame.width*2
        //设置scrollView的最大范围...
        self.scrollView.contentSize=CGSizeMake(scrollScopeWidth, 0)
        self.scrollView.pagingEnabled = true
        //隐藏指示条...
        self.scrollView.showsHorizontalScrollIndicator=false
        self.scrollView.delegate = self
        
        //2秒翻页...
        var timer=NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "turnNextView", userInfo: nil, repeats: true)
    }
    func showPageController(){
        
        pageController=UIPageControl()
        pageController.center=CGPointMake(self.view.frame.width/2, self.scrollView.frame.origin.y+120)
        pageController.backgroundColor=UIColor.grayColor()
        pageController.numberOfPages=2
        self.view.addSubview(pageController)
    }
    func showVisitorNumber(){
        
        
    }
    //翻页...
    func turnNextView(){
        
        var pageNum:Int=self.pageController.currentPage
         print("\(pageNum)")
        if (pageNum == 1)
            {pageNum=0}
        else
            {pageNum=pageNum+1}
        print("\(pageNum)")
        var x:CGFloat = CGFloat(pageNum)*self.scrollView.frame.size.width
        self.scrollView.contentOffset = CGPointMake(x, 0)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //scrollView滚动时触发...
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        //计算当前页码...
        var scrollViewWidth=scrollView.frame.width
        var x=scrollView.contentOffset.x
        var pageNum:Int=Int((x+scrollViewWidth/2)/scrollViewWidth)
        self.pageController.currentPage=pageNum
    }
}
