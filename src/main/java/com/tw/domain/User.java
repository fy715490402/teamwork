package com.tw.domain;

import com.tw.domain.forum.Board;
import com.tw.domain.forum.Post;
import com.tw.domain.forum.Topic;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 成员
 */
@Entity
@Table(name = "team_user")
public class User implements Serializable {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid",strategy = "uuid2")
    private String id;

    @Column(unique = true)
    private String username;

    @Column
    private String realname;

    @Column
    private String password;

    @Column
    private String email;

    @Column
    private String phoneNumber;

    @Column
    private String headUrl;

    @Column
    @Type(type = "byte")
    private boolean enabled = true; //默认值为true

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;

    //多对一
    @ManyToOne
    @JoinColumn(name = "department_id")
    private Department department;

    @OneToMany(cascade = CascadeType.ALL,mappedBy = "user")
    private Set<LoginLog> loginLogs = new HashSet<>();

    @ManyToMany(mappedBy = "manages")
   /* @JoinTable(name = "user_board",
                joinColumns = {@JoinColumn(name = "user_id",referencedColumnName = "id")},
                inverseJoinColumns = {@JoinColumn(name = "board_id",referencedColumnName = "id")})*/
    private Set<Board> boards = new HashSet<>(); //用户管理的论坛版块

    @OneToMany(cascade = CascadeType.ALL,mappedBy = "user")
    private Set<Topic> topics;

    @OneToMany(cascade = CascadeType.ALL,mappedBy = "user")
    private Set<Post> posts;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getHeadUrl() {
        return headUrl;
    }

    public void setHeadUrl(String headUrl) {
        this.headUrl = headUrl;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
