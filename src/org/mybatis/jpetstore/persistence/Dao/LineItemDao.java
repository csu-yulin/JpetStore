package org.mybatis.jpetstore.persistence.Dao;

import org.mybatis.jpetstore.domain.LineItem;

import java.util.List;

public interface LineItemDao {
    List<LineItem> getLineItemsByOrderId(int orderId);

    void insertLineItem(LineItem lineItem);
}
