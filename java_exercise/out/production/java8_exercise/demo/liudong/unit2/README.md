java8函数编程
---
### 常用函数接口之Java7函数接口
+ java.lang.Runnable 线程任务函数接口
+ java.util.concurrent.Callable 带返回线程任务函数接口
+ java.security.PrivilegedAction 启用权限时执行计算函数接口
+ java.util.Comparator 比较函数接口
+ java.io.FileFilter 文件过滤函数接口
+ java.beans.PropertyChangeListener 关联属性监听函数接口
### 常用函数接口之Java8新增function包
+ Predicate<T> T boolean 这张唱片已经发行了吗
+ Consumer<T> T void 输出一个值
+ Function<T,R> T R 获得 Artist 对象的名字
+ Supplier<T> None T 工厂方法
+ UnaryOperator<T> T T 逻辑非（!）
+ BinaryOperator<T> (T, T) T 求两个数的乘积（*）

Stream操作分两种，惰性求值和及早求值
---
+ 惰性求值:返回值是Stream，惰性求值的例子：

list.stream().filter(x -> {
    System.out.println(x);
    return x==1);README.md
});
该例只是刻画了stream，并没有做任何操作，所以并不会有打印的x。

+ 及早求值:返回其他或返回空的则是,及早求值的例子：

long i = list.stream().filter(x -> {
    System.out.println("1"+x.getClazz());
    return x.getClazz().equals("会计");
}).count();
有打印x