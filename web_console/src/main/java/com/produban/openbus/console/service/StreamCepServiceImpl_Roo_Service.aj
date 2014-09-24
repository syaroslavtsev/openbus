// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.produban.openbus.console.service;

import com.produban.openbus.console.domain.StreamCep;
import com.produban.openbus.console.repository.StreamCepRepository;
import com.produban.openbus.console.service.StreamCepServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect StreamCepServiceImpl_Roo_Service {
    
    declare @type: StreamCepServiceImpl: @Service;
    
    declare @type: StreamCepServiceImpl: @Transactional;
    
    @Autowired
    StreamCepRepository StreamCepServiceImpl.streamCepRepository;
    
    public long StreamCepServiceImpl.countAllStreamCeps() {
        return streamCepRepository.count();
    }
    
    public void StreamCepServiceImpl.deleteStreamCep(StreamCep streamCep) {
        streamCepRepository.delete(streamCep);
    }
    
    public StreamCep StreamCepServiceImpl.findStreamCep(Long id) {
        return streamCepRepository.findOne(id);
    }
    
    public List<StreamCep> StreamCepServiceImpl.findAllStreamCeps() {
        return streamCepRepository.findAll();
    }
    
    public List<StreamCep> StreamCepServiceImpl.findStreamCepEntries(int firstResult, int maxResults) {
        return streamCepRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void StreamCepServiceImpl.saveStreamCep(StreamCep streamCep) {
        streamCepRepository.save(streamCep);
    }
    
    public StreamCep StreamCepServiceImpl.updateStreamCep(StreamCep streamCep) {
        return streamCepRepository.save(streamCep);
    }
    
}