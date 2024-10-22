package com.sjc.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QTimepillarBean is a Querydsl query type for TimepillarBean
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QTimepillarBean extends EntityPathBase<TimepillarBean> {

    private static final long serialVersionUID = -812939165L;

    public static final QTimepillarBean timepillarBean = new QTimepillarBean("timepillarBean");

    public final ComparablePath<Character> daystem1 = createComparable("daystem1", Character.class);

    public final ComparablePath<Character> daystem2 = createComparable("daystem2", Character.class);

    public final TimePath<java.time.LocalTime> etime = createTime("etime", java.time.LocalTime.class);

    public final NumberPath<Long> seq = createNumber("seq", Long.class);

    public final ComparablePath<Character> stem1_c = createComparable("stem1_c", Character.class);

    public final ComparablePath<Character> stem1_k = createComparable("stem1_k", Character.class);

    public final ComparablePath<Character> stem2_c = createComparable("stem2_c", Character.class);

    public final ComparablePath<Character> stem2_k = createComparable("stem2_k", Character.class);

    public final TimePath<java.time.LocalTime> stime = createTime("stime", java.time.LocalTime.class);

    public QTimepillarBean(String variable) {
        super(TimepillarBean.class, forVariable(variable));
    }

    public QTimepillarBean(Path<? extends TimepillarBean> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTimepillarBean(PathMetadata metadata) {
        super(TimepillarBean.class, metadata);
    }

}

