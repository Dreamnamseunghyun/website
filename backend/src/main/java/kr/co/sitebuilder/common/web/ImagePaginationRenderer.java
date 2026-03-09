package kr.co.sitebuilder.common.web;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class ImagePaginationRenderer extends AbstractPaginationRenderer {

    public ImagePaginationRenderer() {
        firstPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\"><image src=\"../img/us/common/pagination_arrow_prev02.png\" border=0/></a>&#160;";
        previousPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\"><image src=\"../img/us/common/pagination_arrow_prev01.png\" border=0/></a>&#160;";
        currentPageLabel = "<strong>{0}</strong>&#160;";
        otherPageLabel = "<a href=\"#\"  onclick=\"{0}({1}); return false;\">{2}</a>&#160;";
        nextPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\"><image src=\"../img/us/common/pagination_arrow_next01.png\" border=0/></a>&#160;";
        lastPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\"><image src=\"../img/us/common/pagination_arrow_next02.png\" border=0/></a>&#160;";
    }
}
