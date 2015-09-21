
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
        
        /*也可以放这里设置...
        nv1.tabBarItem=UITabBarItem(title: "One", image: nil, tag: 0)
        nv2.tabBarItem=UITabBarItem(title: "Two", image: nil, tag: 1)
        nv3.tabBarItem=UITabBarItem(title: "three", image: nil, tag: 2)
        nv4.tabBarItem=UITabBarItem(title: "Four", image: nil, tag: 3)
        */
       
    }
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        
        print("tab bar item clicked...")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
