package com.sjc.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QDailySkyBean is a Querydsl query type for DailySkyBean
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QDailySkyBean extends EntityPathBase<DailySkyBean> {

    private static final long serialVersionUID = 1108867828L;

    public static final QDailySkyBean dailySkyBean = new QDailySkyBean("dailySkyBean");

    public final StringPath date = createString("date");

    public final StringPath daystem1 = createString("daystem1");

    public final StringPath daystem2 = createString("daystem2");

    public final StringPath matchscore = createString("matchscore");

    public final NumberPath<Long> seq = createNumber("seq", Long.class);

    public QDailySkyBean(String variable) {
        super(DailySkyBean.class, forVariable(variable));
    }

    public QDailySkyBean(Path<? extends DailySkyBean> path) {
        super(path.getType(), path.getMetadata());
    }

    public QDailySkyBean(PathMetadata metadata) {
        super(DailySkyBean.class, metadata);
    }

}

