package kr.co.dsong.ggsj.commune.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.dsong.ggsj.commune.service.FaqService;
import kr.co.dsong.ggsj.commune.service.mapper.FaqMapper;
import kr.co.dsong.ggsj.commune.vo.FaqVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FaqServiceImpl extends EgovAbstractServiceImpl implements FaqService {

    @Resource
    private FaqMapper faqMapper;

    @Override
    public Integer totalFaqCount(FaqVO vo) throws Exception {
        return faqMapper.totalFaqCount(vo);
    }

    @Override
    public List<FaqVO> selectFaqList(FaqVO vo) throws Exception {
        return faqMapper.selectFaqList(vo);
    }

    @Override
    public FaqVO selectFaq(FaqVO vo) throws Exception {
        return faqMapper.selectFaq(vo);
    }

    @Override
    public List<FaqVO> selectUsFaqList() throws Exception {
        return faqMapper.selectUsFaqList();
    }

    @Override
    public void insertFaq(FaqVO vo) throws Exception {
        faqMapper.insertFaq(vo);
    }

    @Override
    public void updateFaq(FaqVO vo) throws Exception {
        faqMapper.updateFaq(vo);
    }

    @Override
    public void deleteFaq(FaqVO vo) throws Exception {
        faqMapper.deleteFaq(vo);
    }

	@Override
	public FaqVO selectCategory(FaqVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
