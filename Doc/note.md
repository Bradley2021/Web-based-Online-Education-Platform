
## 1、注解的疑问

1. @Mapper注解

作用：在接口类上添加了`@Mapper`，在编辑之后会生成相应的接口实现类。

添加位置：接口类上面

```java
@Mapper
public interface UserDAO {
   //代码
}
```

如果想要每个接口都要变成实现类，那么需要在每个接口类上加上`@Mapper`注解，比较麻烦，解决这个问题用 `@MapperScan`



2. @MapperScan注解

作用：指定要变成实现类的接口所在的包，然后包下面的所有接口在编译之后都会生成相应的实现类。

添加位置：是在 `Springboot` 启动类上面添加。

```java
@SpringBootApplication
@MapperScan("com.winter.dao")
public class SpringbootMybatisDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootMybatisDemoApplication.class, args);
    }
}
```

添加@MapperScan(“com.winter.dao”)注解以后，com.winter.dao包下面的接口类，在编译之后都会生成相应的实现类。


3. @ComponentScan注解

作用：根据定义的扫描路径，把符合扫描规则的类装配到spring容器中。


## 2、手动安装依赖

由于一些maven依赖不能从官网下载，我们需要使用jar文件进行手动安装到自己的本地仓库中。

注意：jar文件在哪，就从哪里进入cmd，并执行以下代码。

`mvn install:install-file -DgroupId=com.aliyun -DartifactId=owl-hdfs -Dversion=1.4.11 -Dpackaging=jar -Dfile=D:/aliyun-sdk-vod-upload-1.4.11.jar`




