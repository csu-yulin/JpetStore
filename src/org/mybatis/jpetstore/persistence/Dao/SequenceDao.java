package org.mybatis.jpetstore.persistence.Dao;

import org.mybatis.jpetstore.domain.Sequence;

public interface SequenceDao {

    Sequence getSequence(Sequence sequence);
    void updateSequence(Sequence sequence);
}
