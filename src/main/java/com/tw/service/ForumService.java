package com.tw.service;

import com.tw.dao.BoardDao;
import com.tw.domain.forum.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

@Service
public class ForumService extends BasicService {

    @Autowired
    private BoardDao boardDao;

    public BoardDao getBoardDao() {
        return boardDao;
    }

    public void setBoardDao(BoardDao boardDao) {
        this.boardDao = boardDao;
    }

    public Serializable addBoard(Board board){
        return boardDao.save(board);
    }

    public List<Board> getAllBoards(){
        return boardDao.loadAll();
    }
}
