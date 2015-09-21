

import UIKit

//轮播首页放的是股票信息....

class AdView1: UIView {
    
    var stockInfoDict:Dictionary<String,AnyObject> = Dictionary()
    var _constant=Constant()
    
    override init(frame:CGRect){
        
        super.init(frame:frame)
        
        let w=self.frame.width
        let h=self.frame.height
        
        //获得固定数据，用于测试
        stockInfoDict["titleA"] = "上证指数"
        stockInfoDict["stockValueAChange"] = "up"
        stockInfoDict["stockValueA"] = 3097.92
        stockInfoDict["stockValueAOfRate"] = 3.58
        stockInfoDict["stockValueAOfUpdateDate"] = "12/16"
        stockInfoDict["titleB"] = "道琼斯指数"
        stockInfoDict["stockValueBChange"] = "up"
        stockInfoDict["stockValueB"] = 16384.74
        stockInfoDict["stockValueBOfRate"] = 1.17
        stockInfoDict["stockValueBOfUpdateDate"] = "12/16"
        
        if(String(stockInfoDict["stockValueAChange"]!) == "up"){
            
            //设置上证指数...
            var labelTitleA=UILabel()
            labelTitleA.text=stockInfoDict["titleA"] as! String
            labelTitleA.sizeToFit()
            labelTitleA.font=UIFont(name: _constant._textFont, size: 16)
            labelTitleA.frame.origin=CGPoint(x:25,y:25)
            labelTitleA.textColor=_constant._redColor
            self.addSubview(labelTitleA)
         
            var labelStockValueA=UILabel()
            labelStockValueA.text=String(stockInfoDict["stockValueA"]!)
            labelStockValueA.font=UIFont(name: _constant._digitalFont, size: 30)
            labelStockValueA.sizeToFit()
            labelStockValueA.frame.origin=CGPoint(x:25,y:labelTitleA.frame.origin.y+labelTitleA.frame.height+15)
            labelStockValueA.textColor=_constant._redColor
            self.addSubview(labelStockValueA)
            
            var labelStockValueAOfUpdateDate=UILabel()
            labelStockValueAOfUpdateDate.text=String(stockInfoDict["stockValueAOfUpdateDate"]!)
            labelStockValueAOfUpdateDate.sizeToFit()
            labelStockValueAOfUpdateDate.font=UIFont(name: _constant._digitalFont, size: 16)
            labelStockValueAOfUpdateDate.frame.origin=CGPoint(x:labelStockValueA.frame.origin.x+labelStockValueA.frame.width-labelStockValueAOfUpdateDate.frame.width,y:25)
            labelStockValueAOfUpdateDate.textAlignment = .Right
            labelStockValueAOfUpdateDate.textColor=_constant._redColor
            self.addSubview(labelStockValueAOfUpdateDate)
            
            var FLAG:String="+"
            var labelStockValueAOfRate=UILabel()
            labelStockValueAOfRate.text=FLAG+String(stockInfoDict["stockValueAOfRate"]!)+"%"
            labelStockValueAOfRate.sizeToFit()
            labelStockValueAOfRate.font=UIFont(name: _constant._digitalFont, size: 16)
            labelStockValueAOfRate.frame.origin=CGPoint(x:25,y:labelStockValueA.frame.origin.y+labelStockValueA.frame.height+10)
            labelStockValueAOfRate.textColor=_constant._redColor
            self.addSubview(labelStockValueAOfRate)
        }
        
        
        if(String(stockInfoDict["stockValueBChange"]!) == "up"){
            
            //设置道琼斯指数...
            var labelTitleB=UILabel()
            labelTitleB.text=stockInfoDict["titleB"] as! String
            labelTitleB.sizeToFit()
            labelTitleB.font=UIFont(name: _constant._textFont, size: 16)
            labelTitleB.frame.origin=CGPoint(x:self.frame.width/2+25,y:25)
            labelTitleB.textColor=_constant._redColor
            self.addSubview(labelTitleB)
            
            var labelStockValueB=UILabel()
            labelStockValueB.text=String(stockInfoDict["stockValueB"]!)
            labelStockValueB.font=UIFont(name: _constant._digitalFont, size: 30)
            labelStockValueB.sizeToFit()
            labelStockValueB.frame.origin=CGPoint(x:self.frame.width/2+25,y:labelTitleB.frame.origin.y+labelTitleB.frame.height+15)
            labelStockValueB.textColor=_constant._redColor
            self.addSubview(labelStockValueB)
            
            var labelStockValueBOfUpdateDate=UILabel()
            labelStockValueBOfUpdateDate.text=String(stockInfoDict["stockValueAOfUpdateDate"]!)
            labelStockValueBOfUpdateDate.sizeToFit()
            labelStockValueBOfUpdateDate.font=UIFont(name: _constant._digitalFont, size: 16)
            labelStockValueBOfUpdateDate.frame.origin=CGPoint(x:labelStockValueB.frame.origin.x+labelStockValueB.frame.width-labelStockValueBOfUpdateDate.frame.width,y:25)
            labelStockValueBOfUpdateDate.textAlignment = .Right
            labelStockValueBOfUpdateDate.textColor=_constant._redColor
            self.addSubview(labelStockValueBOfUpdateDate)
            
            var FLAG:String="+"
            var labelStockValueBOfRate=UILabel()
            labelStockValueBOfRate.text=FLAG+String(stockInfoDict["stockValueAOfRate"]!)+"%"
            labelStockValueBOfRate.sizeToFit()
            labelStockValueBOfRate.font=UIFont(name: _constant._digitalFont, size: 16)
            labelStockValueBOfRate.frame.origin=CGPoint(x:self.frame.width/2+25,y:labelStockValueB.frame.origin.y+labelStockValueB.frame.height+10)
            labelStockValueBOfRate.textColor=_constant._redColor
            self.addSubview(labelStockValueBOfRate)
        }
        self.backgroundColor=_constant._greyColor
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

  }
