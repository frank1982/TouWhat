

import UIKit

class FirstViewController: UIViewController,UIScrollViewDelegate {
    
    var scrollView:UIScrollView!
    var pageController:UIPageControl!
    var _constant=Constant()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor=UIColor.whiteColor()
        showHead()

        //显示轮播...
        showScrollView()
        
        //show page controller...
        showPageController()

  
    }
    func showHead(){
        
       
        //self.title="投什么"
        var titleView=UIImageView()
        titleView.image=UIImage(named: "head")
        titleView.sizeToFit()
        titleView.frame.origin=CGPoint(x:10,y:0)
        self.navigationController?.navigationBar.addSubview(titleView)
        /*标题字体样式...
        self.navigationController?.navigationBar.titleTextAttributes=[NSForegroundColorAttributeName : _constant._redColor,
            NSFontAttributeName: UIFont(name: "Copperplate-Light", size: 24.0)!]
        */
        //需要下面这句否则没有头部...
        self.navigationController!.navigationBar.translucent = false//取消渐变效果...
        
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
            //var adView=UIView(frame: CGRectMake(startX, 0, self.view.frame.width, 140))
            if (i == 0){
                var adView=AdView1(frame: CGRectMake(startX, 0, self.view.frame.width, 140))
                self.scrollView.addSubview(adView)
            }else{
                
                var adView=AdView2(frame: CGRectMake(startX, 0, self.view.frame.width, 140))
                self.scrollView.addSubview(adView)
            }

        }
        var scrollScopeWidth=self.view.frame.width*2
        //设置scrollView的最大范围...
        self.scrollView.contentSize=CGSizeMake(scrollScopeWidth, 0)
        self.scrollView.pagingEnabled = true
        //隐藏指示条...
        self.scrollView.showsHorizontalScrollIndicator=false
        self.scrollView.delegate = self
        
        //2秒翻页...
        var timer=NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "turnNextView", userInfo: nil, repeats: true)
    }
    func showPageController(){
        
        pageController=UIPageControl()
        pageController.center=CGPointMake(self.view.frame.width/2, self.scrollView.frame.origin.y+120)
        pageController.numberOfPages=2
     
        self.view.addSubview(pageController)
    }
    func showVisitorNumber(){
        
        
    }
    //翻页...
    func turnNextView(){
        
        var pageNum:Int=self.pageController.currentPage
        if (pageNum == 1)
            {pageNum=0}
        else
            {pageNum=pageNum+1}
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
