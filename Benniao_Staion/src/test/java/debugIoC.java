import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

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
    }
}
