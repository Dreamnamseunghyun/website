package kr.co.sitebuilder.commune.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.sitebuilder.commune.service.QnaService;
import kr.co.sitebuilder.commune.service.mapper.QnaMapper;
import kr.co.sitebuilder.commune.vo.QnaVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class QnaServiceImpl extends EgovAbstractServiceImpl implements QnaService {

    @Resource
    private QnaMapper qnaMapper;

    @Override
    public List<QnaVO> selectQnaList() throws Exception {
        return qnaMapper.selectQnaList();
    }

    @Override
    public List<QnaVO> selectUsQnaList(Integer userId) throws Exception {
        return qnaMapper.selectUsQnaList(userId);
    }

    @Override
    public QnaVO selectQna(QnaVO vo) throws Exception {
        return qnaMapper.selectQna(vo);
    }

    @Override
    public void insertQna(QnaVO vo) throws Exception {
        qnaMapper.insertQna(vo);
    }

    @Override
    public void updateQna(QnaVO vo) throws Exception {
        qnaMapper.updateQna(vo);
    }

    @Override
    public void deleteQna(QnaVO vo) throws Exception {
        qnaMapper.deleteQna(vo);
    }

    @Override
    public void insertUsQna(QnaVO vo) throws Exception {
        qnaMapper.insertUsQna(vo);
    }
}
