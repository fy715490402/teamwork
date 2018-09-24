package com.tw.dao;

import com.tw.domain.forum.Post;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
public class PostDao extends BasicDao<Post> {

    private static final String GET_POSTS_BY_TOPIC_ID="from Post where topic.id=? order by createTime asc";

    public Page<Post> getPostsByTopicId(Serializable id,int pageSize,int pageNo){
        return pagedQuery(GET_POSTS_BY_TOPIC_ID,pageSize,pageNo,id);
    }

}
