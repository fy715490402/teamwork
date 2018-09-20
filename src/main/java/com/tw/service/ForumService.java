package com.tw.service;

import com.tw.dao.BoardDao;
import com.tw.dao.Page;
import com.tw.dao.PostDao;
import com.tw.dao.TopicDao;
import com.tw.domain.forum.Board;
import com.tw.domain.forum.Post;
import com.tw.domain.forum.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

@Service
public class ForumService extends BasicService {

    @Autowired
    private BoardDao boardDao;

    @Autowired
    private TopicDao topicDao;

    @Autowired
    private PostDao postDao;


    public BoardDao getBoardDao() {
        return boardDao;
    }

    public void setBoardDao(BoardDao boardDao) {
        this.boardDao = boardDao;
    }

    public TopicDao getTopicDao() {
        return topicDao;
    }

    public void setTopicDao(TopicDao topicDao) {
        this.topicDao = topicDao;
    }

    public PostDao getPostDao() {
        return postDao;
    }

    public void setPostDao(PostDao postDao) {
        this.postDao = postDao;
    }

    /*
        论坛版块操作
     */

    /**
     * 添加论坛版块
     * @param board
     * @return
     */
    public Serializable addBoard(Board board){
        return boardDao.save(board);
    }

    /**
     * 获取论坛所有版块
     * @return
     */
    public List<Board> getAllBoards(){
        return boardDao.loadAll();
    }

    /**
     * 根据ID获取board
     * @param id
     * @return
     */
    public Board getBoardById(Serializable id){
        return boardDao.get(id);
    }

    /**
     * 论坛主题操作
     */
    public Page<Topic> getTopicsByBoardId(Serializable boardId,int pageSize,int pageNo){
        return topicDao.getTopicsByBoardId(boardId,pageSize,pageNo);
    }

    public Serializable addTopic(Topic topic){
        return topicDao.save(topic);
    }

    public Topic getTopicById(Serializable id){
        return topicDao.get(id);
    }
    /**
     * 论坛帖子操作
     */

    public Serializable addPost(Post post){
        return postDao.save(post);
    }

}
