

import UIKit

//轮播首页放的是股票信息....

class AdView2: UIView {
    
    var p2pInfoDict:Dictionary<String,AnyObject> = Dictionary()
    var _constant=Constant()
    
    override init(frame:CGRect){
        
        super.init(frame:frame)
        
        let w=self.frame.width
        let h=self.frame.height
        
        //获得固定数据，用于测试
        p2pInfoDict["titleA"] = "余额宝"
        p2pInfoDict["p2pValueA"] = 3.87
        p2pInfoDict["p2pValueAOfUpdateDate"] = "12/16"
        p2pInfoDict["titleB"] = "微众银行"
        p2pInfoDict["p2pValueB"] = 4.67
        p2pInfoDict["p2pValueBOfUpdateDate"] = "12/16"

            //设置alipay指数...
            var labelTitleA=UILabel()
            labelTitleA.text=p2pInfoDict["titleA"] as! String
            labelTitleA.sizeToFit()
            labelTitleA.font=UIFont(name: _constant._textFont, size: 16)
            labelTitleA.frame.origin=CGPoint(x:25,y:25)
            self.addSubview(labelTitleA)
            
            var labelStockValueA=UILabel()
            labelStockValueA.text=String(p2pInfoDict["p2pValueA"]!)
            labelStockValueA.font=UIFont(name: _constant._digitalFont, size: 30)
            labelStockValueA.sizeToFit()
            labelStockValueA.frame.origin=CGPoint(x:25,y:labelTitleA.frame.origin.y+labelTitleA.frame.height+15)
            self.addSubview(labelStockValueA)
            
            var labelStockValueAOfUpdateDate=UILabel()
            labelStockValueAOfUpdateDate.text=String(p2pInfoDict["p2pValueAOfUpdateDate"]!)
            labelStockValueAOfUpdateDate.sizeToFit()
            labelStockValueAOfUpdateDate.font=UIFont(name: _constant._digitalFont, size: 16)
            labelStockValueAOfUpdateDate.frame.origin=CGPoint(x:w/2-labelStockValueAOfUpdateDate.frame.width-25,y:25)
            labelStockValueAOfUpdateDate.textAlignment = .Right
            self.addSubview(labelStockValueAOfUpdateDate)
 
            var labelStockValueAOfRate=UILabel()
            labelStockValueAOfRate.text="七日年化收益率"
            labelStockValueAOfRate.sizeToFit()
            labelStockValueAOfRate.font=UIFont(name: _constant._digitalFont, size: 16)
            labelStockValueAOfRate.frame.origin=CGPoint(x:25,y:labelStockValueA.frame.origin.y+labelStockValueA.frame.height+10)
            self.addSubview(labelStockValueAOfRate)
        
        var labelTitleB=UILabel()
        labelTitleB.text=p2pInfoDict["titleB"] as! String
        labelTitleB.sizeToFit()
        labelTitleB.font=UIFont(name: _constant._textFont, size: 16)
        labelTitleB.frame.origin=CGPoint(x:25+self.frame.width/2,y:25)
        self.addSubview(labelTitleB)
        
        var labelStockValueB=UILabel()
        labelStockValueB.text=String(p2pInfoDict["p2pValueB"]!)
        labelStockValueB.font=UIFont(name: _constant._digitalFont, size: 30)
        labelStockValueB.sizeToFit()
        labelStockValueB.frame.origin=CGPoint(x:25+self.frame.width/2,y:labelTitleB.frame.origin.y+labelTitleB.frame.height+15)
        self.addSubview(labelStockValueB)
        
        var labelStockValueBOfUpdateDate=UILabel()
        labelStockValueBOfUpdateDate.text=String(p2pInfoDict["p2pValueBOfUpdateDate"]!)
        labelStockValueBOfUpdateDate.sizeToFit()
        labelStockValueBOfUpdateDate.font=UIFont(name: _constant._digitalFont, size: 16)
        labelStockValueBOfUpdateDate.frame.origin=CGPoint(x:w-labelStockValueBOfUpdateDate.frame.width-25,y:25)
        labelStockValueBOfUpdateDate.textAlignment = .Right
        self.addSubview(labelStockValueBOfUpdateDate)
        
        var labelStockValueBOfRate=UILabel()
        labelStockValueBOfRate.text="七日年化收益率"
        labelStockValueBOfRate.sizeToFit()
        labelStockValueBOfRate.font=UIFont(name: _constant._digitalFont, size: 16)
        labelStockValueBOfRate.frame.origin=CGPoint(x:25+self.frame.width/2,y:labelStockValueB.frame.origin.y+labelStockValueB.frame.height+10)
        self.addSubview(labelStockValueBOfRate)
        self.backgroundColor=_constant._greyColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
