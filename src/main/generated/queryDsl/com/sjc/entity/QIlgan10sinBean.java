package com.sjc.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QIlgan10sinBean is a Querydsl query type for Ilgan10sinBean
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QIlgan10sinBean extends EntityPathBase<Ilgan10sinBean> {

    private static final long serialVersionUID = 876125652L;

    public static final QIlgan10sinBean ilgan10sinBean = new QIlgan10sinBean("ilgan10sinBean");

    public final StringPath cheonganjiji = createString("cheonganjiji");

    public final ComparablePath<Character> ilgan = createComparable("ilgan", Character.class);

    public final StringPath match = createString("match");

    public final NumberPath<Long> seq = createNumber("seq", Long.class);

    public QIlgan10sinBean(String variable) {
        super(Ilgan10sinBean.class, forVariable(variable));
    }

    public QIlgan10sinBean(Path<? extends Ilgan10sinBean> path) {
        super(path.getType(), path.getMetadata());
    }

    public QIlgan10sinBean(PathMetadata metadata) {
        super(Ilgan10sinBean.class, metadata);
    }

}

