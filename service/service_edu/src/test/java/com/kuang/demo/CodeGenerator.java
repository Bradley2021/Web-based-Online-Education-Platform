package com.kuang.demo;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.kuang.common.utils.R;
import com.kuang.eduservice.ServiceEduApplication;
import com.kuang.eduservice.client.OrdersClient;
import com.kuang.eduservice.entity.EduCourse;
import com.kuang.eduservice.entity.vo.CourseInfoVo;
import com.kuang.eduservice.service.EduCourseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Random;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = ServiceEduApplication.class)
public class CodeGenerator {

    @Autowired
    EduCourseService courseService;

    @Qualifier("com.kuang.eduservice.client.OrdersClient")
    @Autowired
    OrdersClient client;


    char[] chars = null;

    {
         chars = new char[36];
        int index = 0;
        for(char c='a'; c<='z'; c++) {
            chars[index++] = c;
        }
        for(char c='0'; c<='9'; c++) {
            chars[index++] = c;
        }
    }

    private static Random r = new Random();

    @Test
    public void run() {

        // 1、创建代码生成器
        AutoGenerator mpg = new AutoGenerator();

        // 2、全局配置
        GlobalConfig gc = new GlobalConfig();
        String projectPath = System.getProperty("user.dir");
        gc.setOutputDir("D:\\javapratice\\IdeaProjects\\guli_parent\\service\\service_edu" + "/src/main/java");

        gc.setAuthor("testjava");
        gc.setOpen(false); //生成后是否打开资源管理器
        gc.setFileOverride(false); //重新生成时文件是否覆盖
        gc.setServiceName("%sService");	//去掉Service接口的首字母I
        gc.setIdType(IdType.ID_WORKER_STR); //主键策略
        gc.setDateType(DateType.ONLY_DATE);//定义生成的实体类中日期类型
        gc.setSwagger2(true);//开启Swagger2模式

        mpg.setGlobalConfig(gc);

        // 3、数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl("jdbc:mysql://localhost:3306/guli?serverTimezone=GMT%2B8");
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
        dsc.setUsername("root");
        dsc.setPassword("123456");
        dsc.setDbType(DbType.MYSQL);
        mpg.setDataSource(dsc);

        // 4、包配置
        PackageConfig pc = new PackageConfig();
        pc.setModuleName("eduservice"); //模块名
        // 包：com.kuang.eduservice
        pc.setParent("com.kuang");
        pc.setController("controller");
        pc.setEntity("entity");
        pc.setService("service");
        pc.setMapper("mapper");
        mpg.setPackageInfo(pc);

        // 5、策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setInclude("edu_comment");
        strategy.setNaming(NamingStrategy.underline_to_camel);//数据库表映射到实体的命名策略
        strategy.setTablePrefix(pc.getModuleName() + "_"); //生成实体时去掉表前缀

        strategy.setColumnNaming(NamingStrategy.underline_to_camel);//数据库表字段映射到实体的命名策略
        strategy.setEntityLombokModel(true); // lombok 模型 @Accessors(chain = true) setter链式操作

        strategy.setRestControllerStyle(true); //restful api风格控制器
        strategy.setControllerMappingHyphenStyle(true); //url中驼峰转连字符

        mpg.setStrategy(strategy);

        // 6、执行
        mpg.execute();
    }

    @Test
    public void insertData(){
        for(int i = 0;i<60;i++){
            CourseInfoVo vo = new CourseInfoVo();

            vo.setTeacherId("1133437453429129218");

            int len = r.nextInt(6);
            StringBuilder title = new StringBuilder();
            for (;len>0;len--){
                char c = getRandomChoice(chars);
                title.append(c);
            }
            vo.setTitle(title.toString());

            vo.setSubjectParentId("1312323828407992322");
            vo.setSubjectId("1312323828407990000");
            vo.setPrice(new BigDecimal(r.nextInt(5)));
            vo.setCover("beijing.aliyuncs.com/2020/10/22/20220722095632.png");
            vo.setViewCount(Long.parseLong(r.nextInt(1000)+""));
            EduCourse course = new EduCourse();
            BeanUtils.copyProperties(vo,course);
            course.setStatus("Normal");
            course.setIsDeleted(0);
            course.setVersion(1L);
            course.setBuyCount(Long.parseLong(r.nextInt(1000)+""));
            course.setLessonNum(1);

            courseService.default1(course);
        }
        System.out.println("f");
    }

    @Test
    public void t(){
        System.out.println("1310497690173407233".length());
    }

    private static char getRandomChoice(char[] choices) {
        int index = r.nextInt(choices.length);
        return choices[index];
    }

    @Test
    public void tt(){
        R aa = client.aa();
        System.out.println(aa);
    }
}
