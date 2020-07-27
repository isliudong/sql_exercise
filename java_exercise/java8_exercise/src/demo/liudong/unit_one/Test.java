package demo.liudong.unit_one;

import java.util.ArrayList;
import java.util.function.BinaryOperator;
import java.util.function.Predicate;

public class Test {
    public static void main(String[] args) {
        System.out.println();

        //简单使用lambda表达式1
        Predicate<Integer> atList5 = x -> x > 5;
        System.out.println(atList5.test(1));

        //简单使用lambda表达式2
        BinaryOperator<Long> addLongs = (x, y) -> x + y;
        System.out.println(addLongs.apply(1L, 1L));

        //流操作
        ArrayList<Integer> arrayList = new ArrayList<>();

        for (int i = 0; i < 20; i++) {
            arrayList.add(i);
        }


        //过滤
        long count = arrayList.stream().filter(e -> e % 2 == 0).count();
        arrayList.stream().filter(e -> {

            System.out.println(e);
            return e % 2 == 0;
        });
        arrayList.stream().filter(e -> {

            System.out.println(e);
            return e % 2 == 0;
        }).count();

        System.out.println(count);
        System.out.println(arrayList);
    }


}
