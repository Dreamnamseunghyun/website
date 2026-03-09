package kr.co.sitebuilder.codemanage.web;

import kr.co.sitebuilder.codemanage.service.ItemCodeService;
import kr.co.sitebuilder.codemanage.vo.ItemCodeVO;
import kr.co.sitebuilder.common.ResponseCode;
import kr.co.sitebuilder.common.vo.BaseResponseVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@Slf4j
public class ItemCodeController {

    @Resource
    private ItemCodeService itemCodeService;

    @RequestMapping(value = "/{userType}/item-code", method = RequestMethod.GET, produces = "text/html")
    public String itemCodeView(@PathVariable String userType) {
        log.info("");

        return userType + "/codemanage/item_code";
    }

    @RequestMapping(value = "/{userType}/item-code", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ItemCodeVO>> selectItemCodeList(@PathVariable String userType, HttpServletResponse response) throws Exception {
        log.info("");

        if (userType.equals("cm")) {
            response.setStatus(HttpStatus.FORBIDDEN.value());
            return new BaseResponseVO<>(null, ResponseCode.FAIL);
        }
        return new BaseResponseVO<>(itemCodeService.selectItemCodeList());
    }

    @RequestMapping(value = "/pm/item-code", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ItemCodeVO>> saveItemCodeList(@RequestBody List<ItemCodeVO> vo) throws Exception {
        log.info("");

        //vo.setItemType(itemType);
        //vo.setId(id);
        itemCodeService.saveItemCodeList(vo);

        return new BaseResponseVO<>(vo);
    }
}
