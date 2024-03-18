# jPetStore
## 介绍
掌握使用JSP/Servlet技术进行Web应用网站的开发。熟练使用IntelliJ IDEA工具进行Web应用项目的构建和开发，掌握JSP和Servlet相关技术的运用，包括JSP语法、EL表达式语言、JSTL标准标签库、Servlet常用接口和类、JDBC等技术，加深对MVC开发模式的理解和应用。

## 实验内容
基于MVC开发模式用JSP/Servlet技术实现宠物商店网站JPetStore。具体内容包含基本任务和扩展任务两个部分：

## 基本任务：（60分）
1. 商品展示业务模块，包括大类Category、小类Product和具体商品Item的展示和搜索功能。
2. 用户管理业务模块，包括用户注册、登录、修改用户信息、查询用户相关订单等业务功能。
3. 订单管理模块，包括购物车管理、新增订单、地址信息等业务功能。

## 扩展任务：（30分）
添加验证码功能：在用户注册和用户登录模块中添加验证码功能。
日志功能：数据库中添加日志信息表，给项目添加日志功能，用户登录后记录用户行为，比如浏览了哪些商品、将商品添加进购物车、生成订单等。
## 开放任务：（10分）
每小组根据实际情况选择对JPetStore的界面、UI、功能等方面进行完善。
##实验要求
1. 使用IntelliJ IDEA、MySQL和Tomcat环境进行开发；
2. 基础业务功能需和传统宠物商店示例一样；
3. 扩展任务功能（验证码和日志）在完成任务书要求上可自由发挥。
## 使用说明
1. 配置Tomcat,导入三个依赖库:jsp-api.jar,servlet-api.jar,mysql-connector-java-版本号.jar
2. 运行sql文件,创建数据库以及表单,连接petdb
3. 若使用JSTL,需导入standard.jar和standard.jar包
## 注意事项
进入程序首先配置web框架，否则tomcat会配置失败
关于mail包:需要将两个包(mail和activation)通过module导入依赖,还需要将它们导入tomcat的lib文件夹下
