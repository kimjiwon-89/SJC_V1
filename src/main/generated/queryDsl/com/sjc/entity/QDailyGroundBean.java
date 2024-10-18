package com.sjc.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QDailyGroundBean is a Querydsl query type for DailyGroundBean
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QDailyGroundBean extends EntityPathBase<DailyGroundBean> {

    private static final long serialVersionUID = -1987058572L;

    public static final QDailyGroundBean dailyGroundBean = new QDailyGroundBean("dailyGroundBean");

    public final StringPath date = createString("date");

    public final StringPath daystem1 = createString("daystem1");

    public final StringPath daystem2 = createString("daystem2");

    public final StringPath matchscore = createString("matchscore");

    public final NumberPath<Long> seq = createNumber("seq", Long.class);

    public QDailyGroundBean(String variable) {
        super(DailyGroundBean.class, forVariable(variable));
    }

    public QDailyGroundBean(Path<? extends DailyGroundBean> path) {
        super(path.getType(), path.getMetadata());
    }

    public QDailyGroundBean(PathMetadata metadata) {
        super(DailyGroundBean.class, metadata);
    }

}

