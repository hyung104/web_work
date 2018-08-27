package test.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import test.mypac.Weapon;

public class MainClass3 {
	public static void main(String[] args) {
		ApplicationContext context=new ClassPathXmlApplicationContext("test/main/init.xml");
		
		//Spring bean 컨터이너로 부터 객체의 참조값 2번 얻어내기
		Weapon w1=(Weapon)context.getBean("myWeapon");
		Weapon w2=(Weapon)context.getBean("myWeapon");
		
		// 스프링이 관리하는 객체는 signle ton 객체이다.
		if (w1==w2) {
			// 따라서 여러번 getBean()해도 같은 객체의 참조값이다.
			System.out.println("w1과 w2는 같아요");
		}else {
			System.out.println("w1과 w2는 달라요");
		}			
	}
}
