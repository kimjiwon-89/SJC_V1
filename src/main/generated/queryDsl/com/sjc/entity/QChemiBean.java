package com.sjc.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QChemiBean is a Querydsl query type for ChemiBean
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QChemiBean extends EntityPathBase<ChemiBean> {

    private static final long serialVersionUID = 213084848L;

    public static final QChemiBean chemiBean = new QChemiBean("chemiBean");

    public final StringPath daystem1 = createString("daystem1");

    public final StringPath daystem2 = createString("daystem2");

    public final StringPath matchscore = createString("matchscore");

    public final NumberPath<Long> seq = createNumber("seq", Long.class);

    public QChemiBean(String variable) {
        super(ChemiBean.class, forVariable(variable));
    }

    public QChemiBean(Path<? extends ChemiBean> path) {
        super(path.getType(), path.getMetadata());
    }

    public QChemiBean(PathMetadata metadata) {
        super(ChemiBean.class, metadata);
    }

}

