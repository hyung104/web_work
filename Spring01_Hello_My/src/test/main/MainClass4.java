package test.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import test.mypac.Car;

public class MainClass4 {
	public static void main(String[] args) {
		ApplicationContext context=new ClassPathXmlApplicationContext("test/main/init.xml");
		// spring bean 컨테이너에서 Car type 객체 얻어오기
		Car c1=context.getBean(Car.class);
		
		c1.drive();
	}
}
