package demo.liudong.unit3;

import demo.liudong.enums.UserStatus;
import demo.liudong.model.User;
import org.junit.jupiter.api.Test;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class StreamTest {

    ArrayList<User> list = new ArrayList(Arrays.asList(
            new User(1, "张三", "男"),
            new User(2, "王伟", "女"),
            new User(3, "张三", "男"),
            new User(4, "李四", "女"),
            new User(5, "李白", "男")
    ));

    @Test
    public void fun(){

        //流匹配
        boolean b = list.stream().allMatch((e) -> e.getStatus().equals(UserStatus.FREE));
        System.out.println(b);
        System.out.println("--------------------------------------");

        //名字收集
        List<String> collect = list.stream().map(User::getName).collect(Collectors.toList());
        System.out.println(collect);
        System.out.println("--------------------------------------");

        //自定义收集容器
        HashSet<String> collect1 = list.stream().map((e) -> e.getName()).collect(Collectors.toCollection(HashSet::new));
        System.out.println(collect1);
        System.out.println("--------------------------------------");

        //总数
        Long collect2 = list.stream().collect(Collectors.counting());
        System.out.println(collect2);
        System.out.println("---------------------------------------");

        //总和
        long sum = list.stream().collect(Collectors.summarizingInt(User::getId)).getSum();
        System.out.println(sum);
        System.out.println("---------------------------------------");

        //计算小写字符个数
        String str="abcdABCDERTYUgcjx";

        Character[] characters={'a'};

        Stream<Character> stream = Arrays.stream(characters);
        str.chars().filter(Character::isLowerCase).forEach(System.out::println);
        long count = str.chars().filter(Character::isLowerCase).count();
        long count2 = str.chars().filter(x->x>'Z').count();
        System.out.println(count);
        System.out.println(count2);


        //将string转化为包装字符数组
        Character[] charObjectArray = str.chars().mapToObj(c -> (char) c).toArray(Character[]::new);
        System.out.println(Arrays.toString(charObjectArray));




    }

    //求和
    public static int addUp(Stream<Integer> numbers){
        return numbers.reduce(0,(acc,x)->acc+x);
    }
}
