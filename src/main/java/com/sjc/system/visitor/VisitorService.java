package com.sjc.system.visitor;

public interface VisitorService {

    void incrementVisitorCount(String ipAddress);

    Long getVisitorCount();
}
