package demo.liudong.model;

import demo.liudong.enums.UserStatus;

import java.util.Objects;

/**
 * @author liudong
 */
public class User {
    private Integer id;
    private String name;
    private String sex;
    private UserStatus status;

    public User(Integer id, String name, String sex) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.status=UserStatus.FREE;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public UserStatus getStatus() {
        return status;
    }

    public void setStatus(UserStatus status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        User user = (User) o;
        return Objects.equals(id, user.id) &&
                Objects.equals(name, user.name) &&
                Objects.equals(sex, user.sex) &&
                status == user.status;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, sex, status);
    }
}
