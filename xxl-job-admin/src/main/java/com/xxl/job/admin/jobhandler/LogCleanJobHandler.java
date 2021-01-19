package com.xxl.job.admin.jobhandler;

import com.xxl.job.admin.dao.XxlJobLogDao;
import com.xxl.job.core.biz.model.ReturnT;
import com.xxl.job.core.handler.IJobHandler;
import com.xxl.job.core.handler.annotation.XxlJob;
import com.xxl.job.core.log.XxlJobLogger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author liurui
 * @date 2021/1/18
 */
@Service
public class LogCleanJobHandler extends IJobHandler {

    @Resource
    private XxlJobLogDao xxlJobLogDao;


    @XxlJob(value = "cleanLogJobHandler")
    @Override
    public ReturnT<String> execute(String param) throws Exception {
        XxlJobLogger.log("clean log begin: " + System.currentTimeMillis());
        try {
            xxlJobLogDao.bizCleanLog();
            return ReturnT.SUCCESS;
        } catch (Exception e) {
            XxlJobLogger.log("clean log error: " + e);
            e.printStackTrace();
            return new ReturnT<>(ReturnT.FAIL_CODE, "clean log error: " + e.toString());
        }
    }
}
