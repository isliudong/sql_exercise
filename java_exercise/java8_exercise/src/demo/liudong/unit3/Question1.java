package demo.liudong.unit3;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Stream;

/**
 * @author liudong
 */
public class Question1 {

    /*只用 reduce 和 Lambda 表达式写出实现 Stream 上的 map 操作的代码，
    如果不想返回Stream，可以返回一个 List。*/

    public static <I,O> List<O> map(Stream<I> stream , Function<I,O> mapper){

        return stream.reduce(new ArrayList<O>(),(acc,x)->{
            ArrayList<O> newAcc = new ArrayList<>(acc);
            newAcc.add(mapper.apply(x));
            return newAcc;
        },(List<O> left,List<O> right)->{
            List<O> newLeft =new ArrayList<>(left);
            newLeft.addAll(right);
            return newLeft;
        });
    }

}
