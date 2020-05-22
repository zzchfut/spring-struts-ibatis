git add .
git commit -m "spring3 struts1 ibatis2: two datasource model"
git push

git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/zzchfut/spring-struts-ibatis.git
git push -u origin master

>>Spring 3.2 + Struts 1.10 + iBatis 2.3: jdk 1.7 + tomcat 7.0

1, two ways for db config:
  1)JNDI db config:
    META-INF/context.xml --> jdbc.properties --> spring-context.xml
    Attation!! NOT recommended this way
    
  2)JDBC db config:
    jdbc.properties --> spring-context.xml

2, double datasoure  for one project

3, reference api: ibatis-2.3.pdf
   1)sqlmap-config.xml: configuration xml
   2)XxxSqlMap.xml: mapper xml (HERE: NO mapper API)

4, @Service @Resource for Service Bean
   not by XML bean for DI

5, AOP for transaction manager(!important)

6, Struts Message Bundles
   ref: http://makble.com/how-to-config-message-resources-in-struts
   *.properties -> struts-config.xml -> use in JSP by OGNL
   

