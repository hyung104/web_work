package test.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import test.mypac.Weapon;

public class MainClass2 {
	public static void main(String[] args) {
		/*
		 * 무언가 공격하고 싶은데, spring 방식으로 하자
		 */
		
		// 이부분도 나중에 서버 스타트 시점에 로드됨. 설정해주고 class에서 하지 않음.
		// spring frame work에 맡김.
		// spring bean container  객체 컨테이너.
		
		ApplicationContext context=new ClassPathXmlApplicationContext("test/main/init.xml");
	
		/*
		 * 필요한 객체를 직접 new 하지 않고
		 * Spring bean 컨테이너에서 필요한 객체를  얻어와서
		 * 인터페이스 type으로  사용하기
		 * (의존관계를 느슨하게 하기 위해)
		 */
		Weapon w1=(Weapon)context.getBean("myWeapon");
		w1.attack();
	}
}
