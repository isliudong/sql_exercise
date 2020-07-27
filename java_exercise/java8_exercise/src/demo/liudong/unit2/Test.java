package demo.liudong.unit2;

import javax.swing.*;
import java.util.function.Predicate;

/**
 * @author liudong
 */
public class Test {
    public static void main(String[] args) {
        Runnable helloWorld = () -> System.out.println("hello world");

        JButton button = new JButton();
        button.addActionListener(event ->
                System.out.println(event.getActionCommand()));



    }

    interface IntPred {
        boolean test(Integer value);
    }

    boolean check(Predicate<Integer> predicate) {
        return false;
    }

    boolean check(IntPred predicate) {
        return false;
    }
}
