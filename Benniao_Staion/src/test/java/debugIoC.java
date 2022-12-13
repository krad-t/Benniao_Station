import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class debugIoC {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");

        //获取当前容器中，所有beanId的数组；
        String[] beanNames = context.getBeanDefinitionNames();
        for (String beanName : beanNames) {
            System.out.println(beanName);
            System.out.println("对象类型是：" + context.getBean(beanName).getClass().getName());
            System.out.println("对象内容是：" + context.getBean(beanName).toString());
            System.out.println("=======================");
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date date = new java.util.Date();
        String currentTime = dateFormat.format(date);
        System.out.println(currentTime);
        Date date1 = new Date(System.currentTimeMillis());
        System.out.println(date1);
    }
}
