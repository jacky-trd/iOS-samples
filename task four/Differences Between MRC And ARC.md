# MRC与ARC的区别

***

Objective-c中提供了两种内存管理机制，分别提供对内存的手动和自动管理。

* *MRC（Mannul Reference Counting）* 
* *ARC（Automatic Reference Counting）*

ARC内部机制原理也是来源于MRC，ARC是在 iOS 5/ Mac OS X 10.7 开始导入，利用 Xcode4.2 可以使用该机能。

***

在MRC中和内存管理相关的方法如下：

1. alloc 引用计数器自动设为1
2. retain 引用计数器+1 返回了经过+1以后的当前实例对象
3. release 引用计数器-1，并不一定是释放
4. retainCount 获取引用计数器的值
5. dealloc 当实例对象被销毁之前，系统自动调用。dealloc中一定要调[super dealloc]

在MRC中的内存管理原则如下：

1. 如果你想持有某个对象，就必须负责让其做一次retain操作，引用计数器+1
2. 如果你想放弃对某个对象的持有权，就要负责让其做一次release操作，引用计数器-1
3. 谁retain，谁release

***

ARC中的引用计数管理，内存的申请、使用、和释放过程都交给了系统自动实现，开发者不必关心里面的过程。但是事实上ARC的本质还是MRC的原理，只是系统帮助我们进行了管理。