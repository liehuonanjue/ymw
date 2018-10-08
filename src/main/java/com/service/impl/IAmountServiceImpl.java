package com.service.impl;

import com.dao.IAmountMapper;
import com.service.IAmountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IAmountServiceImpl implements IAmountService {
    @Autowired
    public IAmountMapper iAmountMapper;

    @Override
    public int userCount() throws Exception {
        return iAmountMapper.userCount();
    }

    @Override
    public int commodityCount() throws Exception {
        return iAmountMapper.commodityCount();
    }

    @Override
    public int unreceiptedCount() throws Exception {
        return iAmountMapper.unreceiptedCount();
    }

    @Override
    public int signForCount() throws Exception {
        return iAmountMapper.signForCount();
    }

    @Override
    public double grossCount() throws Exception {
        return iAmountMapper.grossCount();
    }
}
