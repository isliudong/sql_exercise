package demo.liudong.unit3;

import java.util.Arrays;
import java.util.stream.Stream;

/**
 * @author liudong
 */
public class Question1 {

    /*只用 reduce 和 Lambda 表达式写出实现 Stream 上的 map 操作的代码，
    如果不想返回Stream，可以返回一个 List。*/

    public static int addUp(Stream<Integer> numbers){
        return numbers.reduce(0,(acc,x)->acc+x);
    }

    public static void main(String[] args) {
        int sum = addUp(Stream.of(1, 2, 3));
        System.out.println(sum);
    }
}
