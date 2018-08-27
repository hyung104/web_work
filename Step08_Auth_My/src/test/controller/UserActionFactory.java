package test.controller;

import test.action.HomeAction;
import test.users.action.UsersCheckIdAction;
import test.users.action.UsersLoginAction;
import test.users.action.UsersLoginformAction;
import test.users.action.UsersLogoutAction;
import test.users.action.UsersPrivateDeleteAction;
import test.users.action.UsersPrivateInfoAction;
import test.users.action.UsersPrivateUpdateAction;
import test.users.action.UsersPrivateUpdateformAction;
import test.users.action.UsersSignupAction;
import test.users.action.UsersSignup_formAction;

public class UserActionFactory {
	private static UserActionFactory factory;
	private UserActionFactory(){}
	//자신의 참조값을 리턴해주는 메소드
	public static UserActionFactory getInstance(){
		if(factory==null){
			factory=new UserActionFactory();
		}
		return factory;
	}
	
	//인자로 전달되는 command 를 수행할 Action type 객체를 리턴해주는 
	//메소드
	public Action action(String command){
		//Action 추상클래스 type 을 담을 지역변수 만들기 
		Action action=null;
		//System.out.println(command);
		if(command.equals("/home")){
			action=new HomeAction();
		}else if(command.equals("/users/loginform")) {
			action=new UsersLoginformAction();
		}else if(command.equals("/users/login")) {
			action=new UsersLoginAction();
		}else if(command.equals("/users/signup_form")) {
			action=new UsersSignup_formAction();
		}else if ( command.equals("/users/checkid")) {
			action=new UsersCheckIdAction();
		}else if ( command.equals("/users/signup")) {
			action=new UsersSignupAction();
		}else if ( command.equals("/users/logout")) {
			action=new UsersLogoutAction();
		}else if ( command.equals("/users/private/info")) {
			action=new UsersPrivateInfoAction();
		}else if ( command.equals("/users/private/updateform")) {
			action=new UsersPrivateUpdateformAction();
		}else if ( command.equals("/users/private/update")) {
			action=new UsersPrivateUpdateAction();
		}else if ( command.equals("/users/private/delete")) {
			action=new UsersPrivateDeleteAction();
		}
		return action;
	}
}
