

import UIKit
import Foundation

class FirstViewController: UIViewController,UIScrollViewDelegate,UITabBarDelegate {
    
    var scrollView:UIScrollView!
    var pageController:UIPageControl!
    var _constant=Constant()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor=UIColor.whiteColor()
        
        //设置tabbarItem...
        self.navigationController?.tabBarItem.title="最佳产品"
        self.navigationController?.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : _constant._redColor,NSFontAttributeName: UIFont(name: _constant._textFont, size: 10.0)!], forState: UIControlState.Selected)
        self.navigationController?.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont(name: _constant._textFont, size: 10.0)!], forState: UIControlState.Normal)
        
        //显示标题...
        showHead()

        //显示轮播...
        showScrollView()
        
        //show page controller...
        showPageController()
        
        showBestProduct()

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
    
    func showBestProduct(){
        
        //固定数据...
        var bestProductInfo:Dictionary<String,AnyObject> = Dictionary()
        bestProductInfo["productName"]="草根钱包"
        bestProductInfo["benifit"]="7%"
        bestProductInfo["saveTimeType"]="活期"

        
        
        var ContentH=self.view.frame.height-self.scrollView.frame.height
        var ContentW=self.view.frame.width
        var flag1=UIImageView()
        flag1.image=UIImage(named:"flag1")
        flag1.sizeToFit()
        flag1.frame.origin=CGPoint(x:25,y:self.scrollView.frame.height+25)
       
        self.view.addSubview(flag1)
        
        //测量label尺寸，使得与顶部对齐
        var str=NSString(string: String(bestProductInfo["productName"]!))
        var size = str.sizeWithAttributes([NSFontAttributeName: UIFont(name: _constant._textFont, size: 24.0)!])
        var productNameLabel=UILabel(frame:CGRectMake(flag1.frame.origin.x+25, flag1.frame.origin.y+2, size.width, size.height))
        productNameLabel.text=str as String
        productNameLabel.font=UIFont(name: _constant._textFont, size: 24)
        productNameLabel.textAlignment = .Left
        self.view.addSubview(productNameLabel)
  
        //收益率...
        var str1=NSString(string: "test")
        var size1 = str1.sizeWithAttributes([NSFontAttributeName: UIFont(name: _constant._digitalFont, size: 20.0)!])
        var size2 = str1.sizeWithAttributes([NSFontAttributeName: UIFont(name: _constant._textFont, size: 10.0)!])
        var benifitLabel=UILabel(frame:CGRectMake(productNameLabel.frame.origin.x, productNameLabel.frame.origin.y+20+productNameLabel.frame.height, size1.width, size1.height))
        benifitLabel.text=String(bestProductInfo["benifit"]!)
        benifitLabel.textAlignment = .Left
        benifitLabel.font=UIFont(name: _constant._digitalFont, size: 20)
        benifitLabel.sizeToFit()
        //benifitLabel.backgroundColor=UIColor.grayColor()
        self.view.addSubview(benifitLabel)
        var benifitLabelStatic=UILabel(frame:CGRectMake(benifitLabel.frame.origin.x+benifitLabel.frame.width+3, benifitLabel.frame.origin.y+benifitLabel.frame.height-size2.height-4, size2.width, size2.height))
        benifitLabelStatic.text="年化收益率"
        benifitLabelStatic.textAlignment = .Left
        benifitLabelStatic.font=UIFont(name: _constant._textFont, size: 10)
        benifitLabelStatic.sizeToFit()
        //benifitLabelStatic.backgroundColor=UIColor.grayColor()
        self.view.addSubview(benifitLabelStatic)
        
        //活定期...
        //另一种水平对齐方法...
        //bestProductInfo["saveTimeType"]
        var label=UILabel()
        label.text=String(bestProductInfo["saveTimeType"]!)
        label.frame=label.textRectForBounds(label.frame, limitedToNumberOfLines: 0)
        label.font=UIFont(name: _constant._textFont, size: 20)
        label.sizeToFit()
        label.frame.origin=CGPoint(x:ContentW/2+25,y:benifitLabelStatic.frame.origin.y+2+benifitLabelStatic.frame.height-label.frame.height)
        self.view.addSubview(label)
        
        var label2=UILabel()
        label2.text="存取灵活"
        label2.frame=label2.textRectForBounds(label2.frame, limitedToNumberOfLines: 0)
        label2.font=UIFont(name: _constant._textFont, size: 12)
        label2.sizeToFit()
        label2.frame.origin=CGPoint(x:label.frame.origin.x+label.frame.width+3,y:label.frame.origin.y+label.frame.height-label2.frame.height-1)
        self.view.addSubview(label2)
        
        var line=UIView(frame:CGRectMake(25, label.frame.origin.y+label.frame.height+5, ContentW-50, 0.5))
        line.backgroundColor=_constant._redColor
        self.view.addSubview(line)
        
        //计算剩下的距离...
        var leftHeight:CGFloat=self.view.frame.height-line.frame.origin.y
        print("\(leftHeight)")
        
        //显示tags...
        var tagLabels=["本息保障","C轮融资","1元起投","次日到账","新手专享","日限100万"]
        createTags(CGPoint(x:25,y:line.frame.origin.y),height: leftHeight/4,num: 8,contentStr: tagLabels)
        
        
        var tipsView=UIView(frame: CGRectMake(25,line.frame.origin.y+leftHeight/4+20,5,leftHeight/4-20))
        tipsView.backgroundColor=_constant._redColor
        self.view.addSubview(tipsView)
        
        /*
        var wordsLabel=UILabel(frame:CGRectMake(productNameLabel.frame.origin.x, line.frame.origin.y+leftHeight/4+20, self.view.frame.width-25-productNameLabel.frame.origin.x, leftHeight/4))
        
        //调整行间距...
        var words="小编认为相当靠谱的活期理财产品，投资人背景雄厚，平台增速很快，目前仍无提现逾期等不良问题，有望成为行业比较靠前的平台，另外顺便说下，草根的APP设计很精良，看出来比较用心"
        print("001")
        var attributedString=NSMutableAttributedString(string: words)
        var paragraphStyle=NSMutableParagraphStyle()
        paragraphStyle.lineSpacing=5
        print("002")
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, words.characters.count))
        print("003")
        wordsLabel.attributedText=attributedString
        //wordsLabel.sizeToFit()
        wordsLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        wordsLabel.numberOfLines=0
        wordsLabel.font=UIFont(name: _constant._textFont, size: 14)
        wordsLabel.backgroundColor=UIColor.grayColor()
        print("004")
        self.view.addSubview(wordsLabel)
        */
        
       
        var wordsLabel=UILabel()
        
        //调整行间距...
        var words="小编认为相当靠谱的活期理财产品，投资人背景雄厚，平台增速很快，目前仍无提现逾期等不良问题，有望成为行业比较靠前的平台，另外顺便说下，草根的APP设计很精良，看出来比较用心"
        print("001")
        var attributedString=NSMutableAttributedString(string: words)
        var paragraphStyle=NSMutableParagraphStyle()
        paragraphStyle.lineSpacing=10
        print("002")
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, words.characters.count))
        print("003")
        wordsLabel.attributedText=attributedString
        wordsLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        wordsLabel.numberOfLines=0
        wordsLabel.font=UIFont(name: _constant._textFont, size: 14)
        //wordsLabel.backgroundColor=UIColor.grayColor()
        wordsLabel.frame=wordsLabel.textRectForBounds(CGRectMake(productNameLabel.frame.origin.x, line.frame.origin.y+leftHeight/4+20, self.view.frame.width-25-productNameLabel.frame.origin.x, leftHeight/4), limitedToNumberOfLines: 0)
        wordsLabel.sizeToFit()
        wordsLabel.frame.origin=CGPoint(x: productNameLabel.frame.origin.x, y: line.frame.origin.y+leftHeight/4+20)
        print("004")
        self.view.addSubview(wordsLabel)

    }

    func createTags(startPoint:CGPoint,height:CGFloat,num:Int,contentStr:[String]){
        
        var tagNum=contentStr.count
        for(var i=0;i<tagNum;i++){

            var unitWidth=(self.view.frame.width-50)/4
            var unitHeight=height/2-10
            var x=unitWidth*CGFloat(i%4)+25
            var y=unitHeight*CGFloat(Int(i/4))+startPoint.y+15
            var label=UILabel(frame: CGRectMake(x, y, unitWidth-10, unitHeight-3))
            label.text=contentStr[i]
            label.font=UIFont(name: _constant._textFont, size: 12)
            label.textColor=_constant._redColor
            label.textAlignment = .Center
            label.layer.borderColor=_constant._redColor.CGColor
            label.layer.borderWidth=0.3
            label.layer.cornerRadius=5
            self.view.addSubview(label)
            
        }
   
    }
}

