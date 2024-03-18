package org.mybatis.jpetstore.service;

import org.mybatis.jpetstore.domain.*;
import org.mybatis.jpetstore.persistence.Dao.ItemDao;
import org.mybatis.jpetstore.persistence.Dao.LineItemDao;
import org.mybatis.jpetstore.persistence.Dao.OrderDao;
import org.mybatis.jpetstore.persistence.Dao.SequenceDao;
import org.mybatis.jpetstore.persistence.impl.*;

import javax.sound.midi.InvalidMidiDataException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderService {

    private ItemDao itemDao;
    private OrderDao orderDao;
    private SequenceDao sequenceDao;
    private LineItemDao lineItemDao;
    public OrderService(){
        this.itemDao = new ItemDaoImpl();
        this.orderDao = new OrderDaoImpl();
        this.sequenceDao = new SequenceDaoImpl();
        this.lineItemDao=new LineItemDaoImpl();
    }
    public void insertOrder(Order order) {
        order.setOrderId(getNextId("ordernum"));
//        for (int i = 0; i < order.getLineItems().size(); i++) {
//            LineItem lineItem = (LineItem) order.getLineItems().get(i);
//            String itemId = lineItem.getItemId();
//            Integer increment = new Integer(lineItem.getQuantity());
//            Map<String, Object> param = new HashMap<String, Object>(2);
//            param.put("itemId", itemId);
//            param.put("increment", increment);
//            itemDao.updateInventoryQuantity(param);
//        }

        orderDao.insertOrder(order);
        orderDao.insertOrderStatus(order);
        for (int i = 0; i < order.getLineItems().size(); i++) {
            LineItem lineItem = (LineItem) order.getLineItems().get(i);
            lineItem.setOrderId(order.getOrderId());
            lineItemDao.insertLineItem(lineItem);
        }
    }

    public Order getOrder(int orderId) {
        Order order = orderDao.getOrder(orderId);
        order.setLineItems(lineItemDao.getLineItemsByOrderId(orderId));

        for (int i = 0; i < order.getLineItems().size(); i++) {
            LineItem lineItem = (LineItem) order.getLineItems().get(i);
            Item item = itemDao.getItem(lineItem.getItemId());
            item.setQuantity(itemDao.getInventoryQuantity(lineItem.getItemId()));
            lineItem.setItem(item);
        }

        return order;
    }

    public List<Order> getOrdersByUsername(String username) {
        return orderDao.getOrdersByUsername(username);
    }

    public int getNextId(String name){
        Sequence sequence = new Sequence(name,-1);
        sequence = sequenceDao.getSequence(sequence);
        if (sequence == null) {
            throw new RuntimeException("Error: A null sequence was returned from the database (could not get next " + name
                    + " sequence).");
        }
        Sequence parameterObject = new Sequence(name, sequence.getNextId() + 1);
        sequenceDao.updateSequence(parameterObject);
        return sequence.getNextId();
    }

    public static void main(String[] args) {
        OrderService orderService=new OrderService();
        AccountService accountService=new AccountService();
        CatalogService catalogService=new CatalogService();
        Account account=accountService.getAccount("j2ee","123");
        Item item= catalogService.getItem("EST-1");
        Cart cart=new Cart();
        cart.addItem(item,true);
        Order order=new Order();
        order.initOrder(account,cart);
        orderService.insertOrder(order);
    }
}

