package demo.liudong.unit3;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.BiPredicate;
import java.util.stream.Collectors;
import java.util.stream.Stream;


/**
 * @author liudong
 */
public class Test {


    public static void main(String[] args) {
        List<Integer> together = Stream.of(Arrays.asList(1, 2), Arrays.asList(3, 4)).
                flatMap(num -> num.stream()).collect(Collectors.toList());
        List<Stream<Integer>> together2 = Stream.of(Arrays.asList(1, 2,3,4,5), Arrays.asList(3, 4,9)).map((num)->num.stream()).collect(Collectors.toList());


        System.out.println(together2);
        System.out.println(together);


        BiPredicate<String,String> biPredicate=(x,y)->x.equals(y);
        biPredicate.test("1","2");

        List<Object> objects1 = null;
        ArrayList<Object> objects = new ArrayList<>(objects1);

    }



}
