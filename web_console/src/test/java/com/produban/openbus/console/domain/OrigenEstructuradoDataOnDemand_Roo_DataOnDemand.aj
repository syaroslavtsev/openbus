// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.produban.openbus.console.domain;

import com.produban.openbus.console.domain.OrigenEstructurado;
import com.produban.openbus.console.domain.OrigenEstructuradoDataOnDemand;
import com.produban.openbus.console.repository.OrigenEstructuradoRepository;
import com.produban.openbus.console.service.OrigenEstructuradoService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect OrigenEstructuradoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: OrigenEstructuradoDataOnDemand: @Component;
    
    private Random OrigenEstructuradoDataOnDemand.rnd = new SecureRandom();
    
    private List<OrigenEstructurado> OrigenEstructuradoDataOnDemand.data;
    
    @Autowired
    OrigenEstructuradoService OrigenEstructuradoDataOnDemand.origenEstructuradoService;
    
    @Autowired
    OrigenEstructuradoRepository OrigenEstructuradoDataOnDemand.origenEstructuradoRepository;
    
    public OrigenEstructurado OrigenEstructuradoDataOnDemand.getNewTransientOrigenEstructurado(int index) {
        OrigenEstructurado obj = new OrigenEstructurado();
        setIsKafkaOnline(obj, index);
        setKafkaTopic(obj, index);
        setTopologyName(obj, index);
        return obj;
    }
    
    public void OrigenEstructuradoDataOnDemand.setIsKafkaOnline(OrigenEstructurado obj, int index) {
        Boolean isKafkaOnline = Boolean.TRUE;
        obj.setIsKafkaOnline(isKafkaOnline);
    }
    
    public void OrigenEstructuradoDataOnDemand.setKafkaTopic(OrigenEstructurado obj, int index) {
        String kafkaTopic = "kafkaTopic_" + index;
        obj.setKafkaTopic(kafkaTopic);
    }
    
    public void OrigenEstructuradoDataOnDemand.setTopologyName(OrigenEstructurado obj, int index) {
        String topologyName = "topologyName_" + index;
        obj.setTopologyName(topologyName);
    }
    
    public OrigenEstructurado OrigenEstructuradoDataOnDemand.getSpecificOrigenEstructurado(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        OrigenEstructurado obj = data.get(index);
        Long id = obj.getId();
        return origenEstructuradoService.findOrigenEstructurado(id);
    }
    
    public OrigenEstructurado OrigenEstructuradoDataOnDemand.getRandomOrigenEstructurado() {
        init();
        OrigenEstructurado obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return origenEstructuradoService.findOrigenEstructurado(id);
    }
    
    public boolean OrigenEstructuradoDataOnDemand.modifyOrigenEstructurado(OrigenEstructurado obj) {
        return false;
    }
    
    public void OrigenEstructuradoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = origenEstructuradoService.findOrigenEstructuradoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'OrigenEstructurado' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<OrigenEstructurado>();
        for (int i = 0; i < 10; i++) {
            OrigenEstructurado obj = getNewTransientOrigenEstructurado(i);
            try {
                origenEstructuradoService.saveOrigenEstructurado(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            origenEstructuradoRepository.flush();
            data.add(obj);
        }
    }
    
}