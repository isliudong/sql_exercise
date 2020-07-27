package demo.liudong.unit2;

/**
 * question description:
 * ThreadLocal Lambda 表达式。Java 有一个 ThreadLocal 类，作为容器保存了当前线程里
 * 局部变量的值。Java 8 为该类新加了一个工厂方法，接受一个 Lambda 表达式，并产生
 * 一个新的 ThreadLocal 对象，而不用使用继承，语法上更加简洁。
 * @author liudong
 */
public class Question2 {

    public static final ThreadLocal<Integer> THREAD_ID =ThreadLocal.withInitial(()->2);

    public static void main(String[] args) {

        System.out.println(THREAD_ID.get());
    }
}
