package kr.co.sitebuilder.commune.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.sitebuilder.commune.service.NoticeService;
import kr.co.sitebuilder.commune.service.mapper.NoticeMapper;
import kr.co.sitebuilder.commune.vo.NoticeVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class NoticeServiceImpl extends EgovAbstractServiceImpl implements NoticeService {

    @Resource
    private NoticeMapper noticeMapper;

    @Override
    public List<NoticeVO> selectNoticeList() throws Exception {
        return noticeMapper.selectNoticeList();
    }

    @Override
    public List<NoticeVO> selectUsNoticeList(Integer companyId) throws Exception {
        return noticeMapper.selectUsNoticeList(companyId);
    }

    @Override
    public List<NoticeVO> hospitalNoticeList(Integer userId) throws Exception {
        return noticeMapper.hospitalNoticeList(userId);
    }

    @Override
    public List<NoticeVO> companyNoticeList(Integer userId) throws Exception {
        return noticeMapper.companyNoticeList(userId);
    }

    @Override
    public NoticeVO selectNotice(NoticeVO vo) throws Exception {
        return noticeMapper.selectNotice(vo);
    }

    @Override
    public List<NoticeVO> selectNoticeWith(NoticeVO vo) throws Exception {

        List<NoticeVO> resultNotice = new ArrayList<>();

        NoticeVO selVo = noticeMapper.selectNotice(vo);
        NoticeVO befVo = noticeMapper.nextNotice(vo);
        NoticeVO nxtVo = noticeMapper.beforeNotice(vo);

        resultNotice.add(selVo);
        resultNotice.add(befVo);
        resultNotice.add(nxtVo);

        return resultNotice;
    }

    @Override
    public void insertNotice(NoticeVO vo) throws Exception {
        noticeMapper.insertNotice(vo);
    }

    @Override
    public void updateNotice(NoticeVO vo) throws Exception {
        noticeMapper.updateNotice(vo);
    }

    @Override
    public void deleteNotice(NoticeVO vo) throws Exception {
    	noticeMapper.deleteNotice(vo);
    }
}
