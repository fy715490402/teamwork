package com.tw.dao;

import com.tw.domain.forum.Topic;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
public class TopicDao extends BasicDao<Topic> {

    private static final String GET_TOPICS_BY_BOARDID = "from Topic where board.id=?";

    /**
     * 根据版块ID查询分页信息
     * @param boardId
     * @param pageSize
     * @param pageNo
     * @return
     */
    public Page<Topic> getTopicsByBoardId(Serializable boardId,int pageSize,int pageNo){
        return pagedQuery(GET_TOPICS_BY_BOARDID,pageSize,pageNo,boardId);
    }

}
