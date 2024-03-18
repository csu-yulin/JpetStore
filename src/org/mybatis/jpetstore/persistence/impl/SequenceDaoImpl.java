package org.mybatis.jpetstore.persistence.impl;

import org.mybatis.jpetstore.domain.Sequence;
import org.mybatis.jpetstore.persistence.Dao.SequenceDao;
import org.mybatis.jpetstore.persistence.Util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SequenceDaoImpl implements SequenceDao {
    private static final String getSequenceString="SELECT name, nextid" +
            "    FROM SEQUENCE" +
            "    WHERE NAME = ?";
    private static final String updateSequenceString="UPDATE SEQUENCE" +
            "    SET NEXTID = ?" +
            "    WHERE NAME = ?";
    @Override
    public Sequence getSequence(Sequence sequence) {
        Sequence result=null;
        try {
            Connection connection= DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(getSequenceString);
            preparedStatement.setString(1,sequence.getName());
            ResultSet resultSet=preparedStatement.executeQuery();
            if (resultSet.next()){
                result=new Sequence();
                result.setName(resultSet.getString(1));
                result.setNextId(resultSet.getInt(2));
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public void updateSequence(Sequence sequence) {
        try {
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(updateSequenceString);
            preparedStatement.setInt(1,sequence.getNextId());
            preparedStatement.setString(2,sequence.getName());
            int rows=preparedStatement.executeUpdate();
            DBUtil.closeStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        Sequence sequence=new Sequence("ordernum",-1);

        SequenceDao sequenceDao=new SequenceDaoImpl();
        Sequence sequence1=sequenceDao.getSequence(sequence);
        System.out.println(sequence1.getNextId());
    }
}
