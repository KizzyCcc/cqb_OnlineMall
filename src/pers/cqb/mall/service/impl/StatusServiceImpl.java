package pers.cqb.mall.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.cqb.mall.entity.StatusEntity;
import pers.cqb.mall.service.StatusService;

@Service("statusService")
@Transactional
public class StatusServiceImpl extends BaseServiceImpl<StatusEntity> implements StatusService {
}
