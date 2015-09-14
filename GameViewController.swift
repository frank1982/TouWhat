

import UIKit


class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        
        let WIDTH=self.view.bounds.width
        let HEIGHT=self.view.bounds.height
        var basketStatic=UIImageView()
        basketStatic.image=UIImage(named:"Basket1")//step1:先设置图片内容...
        basketStatic.sizeToFit()//step2:再设置大小...
        basketStatic.center=CGPoint(x:WIDTH/2,y:HEIGHT/2-180)//step3:最后设置位置...
        self.view.addSubview(basketStatic)
        basketStatic.tag=1001
        
        var ball=UIImageView()
        ball.image=UIImage(named:"Ball")//step1:先设置图片内容...
        ball.sizeToFit()//step2:再设置大小...
        ball.center=CGPoint(x:WIDTH/2-80,y:HEIGHT/2+80)//step3:最后设置位置...
        self.view.addSubview(ball)

        //shoot the ball...
        shootBall(ball)
    }
    func shootBall(ball:UIImageView){
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = 3
        rotateAnimation.autoreverses = false
        rotateAnimation.repeatCount = Float(CGFloat.max)
        ball.layer.addAnimation(rotateAnimation, forKey: nil)
        
        /*另一种动画实现方式...
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        ball.center = CGPointMake(250, 250)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseOut) //设置动画相对速度
        UIView.commitAnimations()
        */
        
        
        let moveAnimation = CABasicAnimation(keyPath: "position")
        moveAnimation.fromValue=NSValue(CGPoint: ball.center)
        moveAnimation.toValue=NSValue(CGPoint: self.view.viewWithTag(1001)!.center)
        moveAnimation.removedOnCompletion=false
        moveAnimation.fillMode=kCAFillModeForwards
        moveAnimation.duration=1
        ball.layer.addAnimation(moveAnimation, forKey: nil)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
}