
import UIKit

//tabbar 可以采用tabbarcontroller或者delegate两种办法，后者需要添加tabbar实例...
class MainViewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var view1=FirstViewController()
        var view2=SecondViewController()
        var nv1=UINavigationController(rootViewController: view1)
        var nv2=UINavigationController(rootViewController: view2)
        self.addChildViewController(nv1)
        self.addChildViewController(nv2)
        nv1.tabBarItem=UITabBarItem(title: "One", image: nil, tag: 0)
        nv2.tabBarItem=UITabBarItem(title: "Two", image: nil, tag: 1)
        
    }
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        
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
