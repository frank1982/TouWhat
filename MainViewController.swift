
import UIKit

//tabbar 可以采用tabbarcontroller或者delegate两种办法，后者需要添加tabbar实例...
class MainViewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var view1=FirstViewController()
        var view2=SecondViewController()
        var view3=ThirdViewController()
        var view4=FourthViewController()
        var nv1=UINavigationController(rootViewController: view1)
        var nv2=UINavigationController(rootViewController: view2)
        var nv3=UINavigationController(rootViewController: view3)
        var nv4=UINavigationController(rootViewController: view4)

        self.addChildViewController(nv1)
        self.addChildViewController(nv2)
        self.addChildViewController(nv3)
        self.addChildViewController(nv4)
        
        //设置tabbarItem...
        var _constant=Constant()

        nv1.tabBarItem.tag=0
        
        //设置一个tabbaritem上的imageView...
        var tab1ImageView=UIImageView()
        tab1ImageView.tag=101
        tab1ImageView.image=UIImage(named: "diamond")
        tab1ImageView.sizeToFit()
        tab1ImageView.frame.origin=CGPoint(x:self.view.frame.width*1/8-tab1ImageView.frame.width/2,y:5)
        nv1.tabBarController?.tabBar.addSubview(tab1ImageView)
        nv1.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont(name: _constant._textFont, size: 10.0)!], forState: UIControlState.Normal)
        
        
        nv3.tabBarItem.title="黑名单"
        nv3.tabBarItem.tag=2
        
        //设置一个tabbaritem上的imageView...
        var tab3ImageView=UIImageView()
        tab3ImageView.tag=103
        tab3ImageView.image=UIImage(named: "alert")
        tab3ImageView.sizeToFit()
        tab3ImageView.frame.origin=CGPoint(x:self.view.frame.width*5/8-tab3ImageView.frame.width/2,y:5)
        nv3.tabBarController?.tabBar.addSubview(tab3ImageView)
        nv3.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont(name: _constant._textFont, size: 10.0)!], forState: UIControlState.Normal)
        
        /*也可以放这里设置...
        nv1.tabBarItem=UITabBarItem(title: "One", image: nil, tag: 0)
        nv2.tabBarItem=UITabBarItem(title: "Two", image: nil, tag: 1)
        nv3.tabBarItem=UITabBarItem(title: "three", image: nil, tag: 2)
        nv4.tabBarItem=UITabBarItem(title: "Four", image: nil, tag: 3)
        */
       
    }
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
       
        //先缩小再放大...
        switch item.tag{
        case 2:
            self.view.viewWithTag(103)!.layer.setAffineTransform(CGAffineTransformMakeScale(0.5,0.5))
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.3)
            self.view.viewWithTag(103)!.layer.setAffineTransform(CGAffineTransformMakeScale(1,1))
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseIn) //设置动画相对速度
            UIView.commitAnimations()
        case 0:
            self.view.viewWithTag(101)!.layer.setAffineTransform(CGAffineTransformMakeScale(0.5,0.5))
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.1)
            self.view.viewWithTag(101)!.layer.setAffineTransform(CGAffineTransformMakeScale(1,1))
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseIn) //设置动画相对速度
            UIView.commitAnimations()
   
        default: break
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 }
