package org.mybatis.jpetstore.domain;

import java.io.Serializable;

public class MyLog  implements Serializable {
    private static final long serialVersionUID = -8414218622726294404L;

    private String username;
    private String behavior;
    private String time;


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBehavior() {
        return behavior;
    }

    public void setBehavior(String behavior) {
        this.behavior = behavior;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

}
