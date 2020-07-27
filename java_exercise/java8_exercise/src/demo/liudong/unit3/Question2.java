package demo.liudong.unit3;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Stream;

/**
 *只用 reduce 和 Lambda 表达式写出实现 Stream 上的 filter 操作的代码，如果不想返回
 * Stream，可以返回一个 List
 * @author liudong
 */
public class Question2 {

    public static <I> List<I> filter(Stream<I> stream, Predicate<I> predicate){
        List<I> initial = new ArrayList<>();

        return stream.reduce(initial, (List<I> acc,I x)->{
            if(predicate.test(x)){
            List<I> newAcc=new ArrayList<>(acc);
            newAcc.add(x);
            return newAcc;
            }else {
                return acc;
            }
        },Question2::combineLists);
    }

    private static <I> List<I> combineLists(List<I> left,List<I> right){
        List<I> newLeft=new ArrayList<>(left);
        newLeft.addAll(right);
        return newLeft;
    }

    public static void main(String[] args) {

        List<Integer> filter = filter(Stream.of(1, 2, 3), (x) -> x > 2);
        System.out.println(filter);

    }
}

