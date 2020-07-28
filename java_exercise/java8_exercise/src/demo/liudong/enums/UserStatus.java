package demo.liudong.enums;

/**
 * @author liudong
 */

public enum UserStatus {
    /*休闲态*/
    FREE("i am free"),
    /*繁忙态*/
    BUSY("i am busy");
    private final String info;

    UserStatus(String info){
        this.info=info;
    }

    UserStatus() {
        this.info="i am free";
    }
}
