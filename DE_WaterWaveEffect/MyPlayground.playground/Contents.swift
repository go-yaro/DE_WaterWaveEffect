import UIKit

class WWEView : UIView {

    init(origin: CGPoint, size: CGFloat) {
        super.init(frame: CGRect(origin: origin, size: CGSize(width: size, height: size)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        UIColor(red: 22/255.0, green: 163/255.0, blue: 130/255.0, alpha: 1).setFill()
        UIRectFill(rect)

        let pulsingCount = 5
        let animationDuration = 3.0
        let animationLayer = CALayer()

        for i in 0..<pulsingCount {
            let pulsingLayer = CALayer()
            pulsingLayer.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: rect.size)
            pulsingLayer.borderColor = UIColor.white.cgColor
            pulsingLayer.borderWidth = 1
            pulsingLayer.cornerRadius = rect.size.width / 2

            let animationGroup = CAAnimationGroup()
            animationGroup.fillMode = kCAFillModeBackwards
            animationGroup.beginTime = CACurrentMediaTime() + Double(i) * Double(animationDuration) / Double(pulsingCount)
            animationGroup.duration = animationDuration
            animationGroup.repeatCount = 100
            animationGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)

            let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
            scaleAnimation.fromValue = 0
            scaleAnimation.toValue = 2.2

            let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
            opacityAnimation.values = [1, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1, 0]
            opacityAnimation.keyTimes = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1]

            animationGroup.animations = [scaleAnimation, opacityAnimation]
            pulsingLayer.add(animationGroup, forKey: "pulsing")
            animationLayer.addSublayer(pulsingLayer)
        }
        self.layer.addSublayer(animationLayer)
    }

}


let view = WWEView(origin: CGPoint(x: 0, y: 0), size: 200)
