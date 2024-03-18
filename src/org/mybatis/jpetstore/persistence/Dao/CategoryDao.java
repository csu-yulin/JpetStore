package org.mybatis.jpetstore.persistence.Dao;

import org.mybatis.jpetstore.domain.Category;

import java.util.List;

public interface CategoryDao {
    List<Category> getCategoryList();

    Category getCategory(String categoryId);
}
