package org.mybatis.jpetstore.web.action.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "EncodingFilter", urlPatterns = {"/*"}) // 对所有请求过滤
public class CharacterEncodingFilter implements Filter {
    protected String encoding = "UTF-8"; // 编码
    public void init(FilterConfig config) {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        if (encoding != null) { // 如果成功取得初始参数
            req.setCharacterEncoding(encoding);
        }
        chain.doFilter(req, resp); // "过滤链"继续向上或向下传递, 一定要有!
    }

    public void destroy() {
        encoding = null;
    }
}
