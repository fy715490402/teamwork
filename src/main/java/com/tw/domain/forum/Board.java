package com.tw.domain.forum;

import com.tw.domain.User;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 论坛版块
 */
@Entity
@Table(name = "forum_board")
public class Board implements Serializable {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid",strategy = "uuid2")
    private String id;

    @Column
    private String title;   //版块标题

    @Column
    private String description; //版块描述信息

    @Column
    private String imageUrl;    //Logo图片路径

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime = new Date();

    @ManyToMany
    @JoinTable(name = "user_board",
            joinColumns = {@JoinColumn(name = "board_id",referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id",referencedColumnName = "id")})
    private Set<User> manages = new HashSet<>(); //版块管理员

    @OneToMany(mappedBy = "board")
    @OrderBy("createTime DESC ")
    private Set<Topic> topics;

    public Set<Topic> getTopics() {
        return topics;
    }

    public void setTopics(Set<Topic> topics) {
        this.topics = topics;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Set<User> getManages() {
        return manages;
    }

    public void setManages(Set<User> manages) {
        this.manages = manages;
    }
}
