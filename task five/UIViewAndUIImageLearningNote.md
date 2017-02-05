## UIView常用属性

***

1. @property(nonatomic) CGRect frame
   * 描述当前视图在其父视图中的位置和大小
2. @property(nonatomic) CGRect bounds
   * 描述当前视图的自身坐标系位置和大小
3. @property(nonatomic) CGPoint Center
   * 描述当前视图的中心点在其父视图中的位置
4. @property(nonatomic) CGAffineTransform transform
   * 形变属性（平移、缩放、旋转）
   * 默认值为CGAffineTransformIdentity
5. @property(nonatomic, getter = isMultipleTouchEnabled) BOOL multipleTouchEnabled
   * 是否支持多点触摸
   * 默认值为NO
6. @property(nonatomic) BOOL clipsToBounds
   * 超出控件边框范围的内容是否被剪裁掉
7. @property(nonatomic, copy) UIColor *backgroundColor
   * 背景色
   * 默认值为nil
8. @property(nonatomic) CGFloat alpha
   * 透明度
   * 默认值为1.0
9. @property(nonatomic, getter = isOpacity) BOOL opacity
   * 是否不透明
   * 默认值为YES
10. @property(nonatomic, getter = isHidden) BOOL hidden
   * 是否隐藏


11. @property(nonatomic) UIViewContentMode contentMode
    * 内容模式
    * 默认值为UIViewContentModeScaleToFill
      ​


## UIView常用方法

***

1. -(UIView *) hitTest: (CGPoint) point withEvent: (UIEvent *) event
   * 获取到事件中点击的视图，用来判断当前点击
2. -(BOOL) pointInside: (CGPoint) point withEvent: (UIEvent *) event
   * 判断是否是当前视图触发的事件
3. -(CGPoint) convertPoint: (CGPoint) point toView: (UIView *) view
   * 将一个坐标点转换成指定view的坐标 
4. -(CGPoint) convertPoint: (CGPoint) point fromView: (UIView *) view
   * 将一个坐标点转换成当前view的坐标
5. -(CGRect) convertRect: (CGRect) rect toView: (UIView *) view
   * 将一个CGRect转换成指定view的CGRect
6. -(CGRect) convertRect: (CGRect) rect fromView: (UIView *) view
   * 讲一个CGRect转换成当前view的CGRect
7. -(CGSize) sizeThatFits: (CGSize) size
   * 获取适合内容的CGSize 
8. -(void) sizeToFit
   * 自动设置适合内容的CGSize
9. -(void) removeFromSuperview
   * 从父视图中移除当前视图 
10. -(void) insertSubview: (UIView *) view atIndex: (NSInteger) index
* 在index层插入一个视图
11. -(void) exchangeSubviewAtIndex: (NSInteger) index1 withSubviewAtIndex: (NSInteger) index2
* 交换两个视图的图层
12. -(void) addSubview: (UIView *) view
* 加入一个视图在最上一层
13. -(void) insertSubview: (UIView *) view belowSubview: (UIView *) siblingSubview
* 在siblingSubview视图下面插入一个视图
14. -(void) insertSubview: (UIView *) view aboveSubview: (UIView *) siblingSubview
* 在siblingSubview视图上面插入一个视图
15. -(void) bringSubviewToFront: (UIView *) view
* 将一个视图放到最上一层 
16. -(void) sendSubviewToBack: (UIView *) view
* 将一个视图推送到最下层
17. -(void) didAddSubview: (UIView *) subview
* 添加子视图后调用
18. -(void) willRemoveSubview: (UIView *) subview
* 将要移除子视图时调用
19. -(void) willMoveToSuperview: (UIView *) newSuperview
* 父视图将要发生更改时调用
20. -(void) didMoveToSuperview
* 父视图更改后调用
21. -(void) willMoveToWindow: (UIWindow *) newWindow
* 视图或其超视图将要展示到窗口调用
22. -(void) didMoveToWindow
* 视图或其超视图展示到窗口调用 
23. -(BOOL) isDescendantOfView: (UIView *) view
* 判断当前视图是否是指定视图或者其子视图
24. -(UIView *) viewWithTag: (NSInteger) tag
* 获取当前视图内指定tag值的视图
25. -(void) layoutSubviews
* 当视图上的图层发生改变时调用
26. -(void) layoutMarginsDidChange
* 发生自动布局时调用
27. -(void) drawRect: (CGRect) rect
* 绘制图层layer时调用 
28. -(void) setNeedsDisplay
* 重绘图层
29. -(void) setNeedsDisplayInRect: (CGRect) rect
* 重绘图层指定范围
30. +(void) beginAnimations: (NSString *) animationID context: (void *) context
* 开启动画块 animationID动画标示 context参数
31. +(void) commitAnimations
* 提交动画块动画开始执行
32. +(void) setAnimationDelegate: (id) delegate
* 设置动画代理 
33. +(void) setAnimationWillStartSelector: (SEL) selector
* 当动画开始时发送一个消息给动画代理
34. +(void) setAnimationDidStopSelector: (SEL) selector
* 当动画结束时发送一个消息给动画代理
35. +(void) setAnimationDuration: (NSTimeInterval) duration
* 设置动画时长默认0.2s
36. +(void) setAnimationDelay: (NSTimeInterval) delay
* 设置动画执行延迟时长默认0s 
37. +(void) setAnimationStartDate: (NSDate *) startDate
* 设置动画开始时间NSDate
38. +(void) setAnimationRepeatCount: (float) repeatCount
* 设置动画重复次数
39. +(void) setAnimationRepeatAutoreverses: (BOOL) repeatAutoreverses
* 设置动画是否做一次反向的执行




## UIImageView三种填充属性的不同

***

1. ScaleToFill
   * 图像拉伸，不保持长宽比例，填充整个UIImageView
2. Aspect Fit
   * 图像保持长宽比例，不填充整个UIImageView，但是图像会按比例放大或缩小从而全部显示在UIImageView里
3. Aspect Fill
   * 图像保持长宽比例，填充整个UIIamgeView，由于图像是按比例放大或者缩小，因此图像可能会不完全显示，有一部分在UIImageView外面被截断
