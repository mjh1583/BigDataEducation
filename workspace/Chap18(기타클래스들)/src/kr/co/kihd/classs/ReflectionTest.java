package kr.co.kihd.classs;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class ReflectionTest {
	
	public static void main(String[] args) throws ClassNotFoundException {
		
		Class class1 = Class.forName("java.lang.String");
//		Class class1 = Class.forName("kr.co.kihd.classs.Person");
		System.out.println("[생성자 정보]");
		
		Constructor[] constructors = class1.getDeclaredConstructors();
		
		for(Constructor constructor : constructors) {
			System.out.print(constructor.getName() + "(");
			Class[] param = constructor.getParameterTypes();
			
			for(int i = 0; i < param.length; i++) {
				System.out.print(param[i].getSimpleName());
				if(i < param.length -1 ) {
					System.out.print(", ");
				}
			}
			System.out.println(")");
		}
		
		//필드들 표시
		Field[] fields = class1.getDeclaredFields();
		System.out.println("[필드 정보]");
		
		for(Field field : fields) {
			System.out.println(field.getType().getSimpleName() + " " + field.getName());
		}
		
		//메서드 정보
		Method[] methods = class1.getDeclaredMethods();
		System.out.println("[메서드 정보]");
		
		for(Method method : methods) {
			System.out.print(method.getReturnType().getSimpleName() + " ");
			System.out.print(method.getName() + "(");
			
			Class[] param2 = method.getParameterTypes();
			
			for(int i = 0; i < param2.length; i++) {
				System.out.print(param2[i]);
				if(i < param2.length - 1) {
					System.out.print(", ");
				}
			}
			
			System.out.println(")");
		}
	}
	
}
