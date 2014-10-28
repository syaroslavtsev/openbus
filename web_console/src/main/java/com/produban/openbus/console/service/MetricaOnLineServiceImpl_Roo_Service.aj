// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.produban.openbus.console.service;

import com.produban.openbus.console.domain.MetricaOnLine;
import com.produban.openbus.console.repository.MetricaOnLineRepository;
import com.produban.openbus.console.service.MetricaOnLineServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MetricaOnLineServiceImpl_Roo_Service {
    
    declare @type: MetricaOnLineServiceImpl: @Service;
    
    declare @type: MetricaOnLineServiceImpl: @Transactional;
    
    @Autowired
    MetricaOnLineRepository MetricaOnLineServiceImpl.metricaOnLineRepository;
    
    public long MetricaOnLineServiceImpl.countAllMetricaOnLines() {
        return metricaOnLineRepository.count();
    }
    
    public void MetricaOnLineServiceImpl.deleteMetricaOnLine(MetricaOnLine metricaOnLine) {
        metricaOnLineRepository.delete(metricaOnLine);
    }
    
    public MetricaOnLine MetricaOnLineServiceImpl.findMetricaOnLine(Long id) {
        return metricaOnLineRepository.findOne(id);
    }
    
    public List<MetricaOnLine> MetricaOnLineServiceImpl.findAllMetricaOnLines() {
        return metricaOnLineRepository.findAll();
    }
    
    public List<MetricaOnLine> MetricaOnLineServiceImpl.findMetricaOnLineEntries(int firstResult, int maxResults) {
        return metricaOnLineRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void MetricaOnLineServiceImpl.saveMetricaOnLine(MetricaOnLine metricaOnLine) {
        metricaOnLineRepository.save(metricaOnLine);
    }
    
    public MetricaOnLine MetricaOnLineServiceImpl.updateMetricaOnLine(MetricaOnLine metricaOnLine) {
        return metricaOnLineRepository.save(metricaOnLine);
    }
    
}
