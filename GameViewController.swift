

import UIKit


class GameViewController: UIViewController {
    
    //必须要在这里声明物理引擎...
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision:UICollisionBehavior!
    var itemBehavior:UIDynamicItemBehavior!
    
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
        ball.center=CGPoint(x:50,y:HEIGHT/2+80)//step3:最后设置位置...
        self.view.addSubview(ball)
        ball.tag=1003
        
        //篮球框...最后加载，显示在最外层...
        var basketStatic2=UIImageView()
        basketStatic2.image=UIImage(named:"Basket2")//step1:先设置图片内容...
        basketStatic2.sizeToFit()//step2:再设置大小...
        basketStatic2.center=CGPoint(x:WIDTH/2,y:basketStatic.frame.origin.y+(basketStatic.frame.height*(11/14)))//step3:最后设置位置...
        self.view.addSubview(basketStatic2)
        self.view.bringSubviewToFront(basketStatic2)
        basketStatic2.tag=1002
        
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
        
        /*直线移动...
        let moveAnimation = CABasicAnimation(keyPath: "position")
        moveAnimation.fromValue=NSValue(CGPoint: ball.center)
        moveAnimation.toValue=NSValue(CGPoint: self.view.viewWithTag(1001)!.center)
        moveAnimation.removedOnCompletion=false
        moveAnimation.fillMode=kCAFillModeForwards
        moveAnimation.duration=1
        ball.layer.addAnimation(moveAnimation, forKey: nil)
        */
        
        var path=CGPathCreateMutable()
        var startPoint=ball.center
        var endPoint=CGPoint(x:self.view.viewWithTag(1001)!.center.x,y:self.view.viewWithTag(1001)!.center.y+20)
        var middlePoint=CGPoint(x: (endPoint.x+startPoint.x)/2, y: (endPoint.y-80))
        CGPathMoveToPoint(path, nil, startPoint.x, startPoint.y)
        CGPathAddQuadCurveToPoint(path, nil, middlePoint.x, middlePoint.y, endPoint.x, endPoint.y)
        var newAnimation = CAKeyframeAnimation(keyPath: "position")
        newAnimation.removedOnCompletion=false
        newAnimation.path=path
        newAnimation.duration=1
        newAnimation.fillMode=kCAFillModeForwards
        newAnimation.delegate=self
        //运动先慢后快...
        newAnimation.timingFunction=CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
        ball.layer.addAnimation(newAnimation, forKey: "postion")
       
    }
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("animation stop...")
        self.view.viewWithTag(1003)!.removeFromSuperview()
        drawMoreBalls()
    }
    func drawMoreBalls(){
        
        var ballArray=[UIImageView]()
        var newBall1=UIImageView()
        newBall1.image=UIImage(named:"Ball")//step1:先设置图片内容...
        newBall1.sizeToFit()//step2:再设置大小...
        newBall1.center=CGPoint(x:self.view.viewWithTag(1001)!.center.x,y:self.view.viewWithTag(1001)!.center.y+45)
        self.view.addSubview(newBall1)
        var newBall2=UIImageView()
        newBall2.image=UIImage(named:"Ball")//step1:先设置图片内容...
        newBall2.sizeToFit()//step2:再设置大小...
        newBall2.center=CGPoint(x:self.view.viewWithTag(1001)!.center.x-5,y:self.view.viewWithTag(1001)!.center.y+45)
        self.view.addSubview(newBall2)
        
        var newBall3=UIImageView()
        newBall3.image=UIImage(named:"Ball")//step1:先设置图片内容...
        newBall3.sizeToFit()//step2:再设置大小...
        newBall3.center=CGPoint(x:self.view.viewWithTag(1001)!.center.x+5,y:self.view.viewWithTag(1001)!.center.y+45)
        self.view.addSubview(newBall3)
        ballArray.append(newBall1)
        ballArray.append(newBall2)
        ballArray.append(newBall3)
        //篮筐始终显示在最外面...
        self.view.bringSubviewToFront(self.view.viewWithTag(1002)!)
        
        collision=UICollisionBehavior()
        animator = UIDynamicAnimator(referenceView: self.view);
        gravity = UIGravityBehavior(items: [newBall1,newBall2,newBall3]);
        animator.addBehavior(gravity)
        
        collision.addItem(newBall1)
        collision.addItem(newBall2)
        collision.addItem(newBall3)
        
        
        //设置物理边界...
        let WIDTH=self.view.frame.width
        let HEIGHT=self.view.frame.height
        
        var p1=CGPointMake(0, HEIGHT-100)
        var p2=CGPointMake(WIDTH, HEIGHT-100)
        var line1=CGPathCreateMutable()
        CGPathMoveToPoint(line1, nil, p1.x, p1.y)
        CGPathAddLineToPoint(line1, nil, p2.x, p2.y)
        collision.addBoundaryWithIdentifier("line1", fromPoint: p1, toPoint: p2)
        var p3=CGPointMake(0, 0)
        var p4=CGPointMake(0, HEIGHT-100)
        var line2=CGPathCreateMutable()
        CGPathMoveToPoint(line2, nil, p3.x, p3.y)
        CGPathAddLineToPoint(line2, nil, p4.x, p4.y)
        collision.addBoundaryWithIdentifier("line2", fromPoint: p3, toPoint: p4)
        var p5=CGPointMake(WIDTH, 0)
        var p6=CGPointMake(WIDTH, HEIGHT-100)
        var line3=CGPathCreateMutable()
        CGPathMoveToPoint(line3, nil, p5.x, p5.y)
        CGPathAddLineToPoint(line3, nil, p6.x, p6.y)
        collision.addBoundaryWithIdentifier("line3", fromPoint: p5, toPoint: p6)
        
        /*按照外观进行碰撞...
        collision.translatesReferenceBoundsIntoBoundary=true
        */
        animator.addBehavior(collision)
        
        //设置反弹系数
        itemBehavior=UIDynamicItemBehavior(items: [newBall1,newBall2,newBall3])
        itemBehavior.elasticity=0.8
        animator.addBehavior(itemBehavior)
        
        //碰撞检测...
        var endFlag=[false,false,false]
        collision.action={
            
            for(var i=0;i<3;i++){
                
                var speed=self.itemBehavior.linearVelocityForItem(ballArray[i])
                if speed.x==0 && speed.y==0 && ballArray[i].center.y>=(HEIGHT-150){
                    
                    
                    endFlag[i]=true
                }
                if endFlag[0]==true && endFlag[1]==true && endFlag[2]==true{
                    
                    print("all stop...")
                    var firstViewController=FirstViewController()
                    /*设置被弹出的模式...
                    firstViewController.modalTransitionStyle=UIModalTransitionStyle.FlipHorizontal
                    self.presentViewController(firstViewController, animated: true, completion: nil)
                    */
                    
                    //翻页效果...
                    UIView.beginAnimations("Curl", context: nil)
                    UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
                    UIView.setAnimationDuration(0.8)
                    UIView.setAnimationTransition(UIViewAnimationTransition.CurlUp, forView: self.view, cache: true)
                    
                    var viewList:[UIView]=self.view.subviews
                    var view:UIView
                    for view in viewList {
                        
                        view.removeFromSuperview()
                    }
                    self.view.insertSubview(firstViewController.view, atIndex: 0)
                    UIView.commitAnimations()
                }
                
            }
        }
        //获取速度...
        //itemBehavior.linearVelocityForItem(<#T##item: UIDynamicItem##UIDynamicItem#>)
        
        //newBall1.addObserver(self, forKeyPath: "center", options: NSKeyValueObservingOptions.New, context: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
}