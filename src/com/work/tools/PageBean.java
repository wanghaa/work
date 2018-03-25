package com.work.tools;

import java.util.List;

public class PageBean {


    private int pageSize = 10;
    private int start = 0;
    private int page = 1;
    private int totalPage = 0;
    private int totalCount = 0;
    private List data;

    public PageBean() {}

    public PageBean(int page) {
        this.page = page;
    }

    /////////////////

    public void setPage(int page) {
        if (page > 0) {
            start = (page - 1) * pageSize;
            this.page = page;
        }
    }

    public int getPage() {
        return page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public PageBean setPageSize(int pageSize) {
        this.pageSize = pageSize;
        return this;
    }

    /**
     * @return the start
     */
    public int getStart() {
        return start;
    }

    protected void setStart() {}

    /**
     * @return the totalCount
     */
    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        totalPage = (int) Math.ceil((totalCount + pageSize - 1) / pageSize);
        start = (page - 1) * pageSize;
    }

    protected void setTotalPage() {

    }

    public int getTotalPage() {
        return totalPage;
    }


    ///////////////
    public int getLastPage() {
        if (hasLastPage()) {
            return page - 1;
        }
        return page;
    }

    public int getNextPage() {
        if (hasNextPage()) {
            return page + 1;
        }
        return page;
    }


    public boolean hasNextPage() {
        return page < totalPage;
    }


    public boolean hasLastPage() {
        return page > 1;
    }
}
