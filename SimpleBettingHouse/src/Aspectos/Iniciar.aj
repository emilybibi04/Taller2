import java.io.File;
import java.util.Calendar;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import com.bettinghouse.Person;
import com.bettinghouse.User;

public aspect Iniciar {

    File file = new File("Register.txt");
    File file2 = new File("Log.txt");  
    
    pointcut registrarUsuario(User user, Person person): call(* successfulSignUp(User, Person)) && args(user, person);
    
    after(User user, Person person) : registrarUsuario(user, person) {
    	Calendar cal = Calendar.getInstance();
    	try(PrintWriter pw = new PrintWriter(new FileOutputStream(file,true))){
    		pw.println("Usuario registrado: [" + user + "]    Fecha: [" + cal.getTime() + "]");
    	} catch(FileNotFoundException e){
    		System.out.println(e.getMessage());
    	}    
    }
    
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    pointcut success(User user) : (call(* effectiveLogIn(User)) && args(user)) || (call (* effectiveLogOut(User)) && args(user));
    after(User user) : success(user) {
    	if (thisJoinPointStaticPart.getSignature().getName().equals("effectiveLogIn")) {
    		Calendar cal = Calendar.getInstance();
    		try(PrintWriter pw = new PrintWriter(new FileOutputStream(file2,true))){
        		pw.println("Sesión iniciada por usuario: [" + user + "]    Fecha: [" + cal.getTime() + "]");
        	} catch(FileNotFoundException e){
        		System.out.println(e.getMessage());
        	}    
    		System.out.println("**** User logged in ****");
    	} else {
    		Calendar cal = Calendar.getInstance();
    		try(PrintWriter pw = new PrintWriter(new FileOutputStream(file2,true))){
        		pw.println("Sesión cerrada por usuario: [" + user + "]    Fecha: [" + cal.getTime() + "]");
        	} catch(FileNotFoundException e){
        		System.out.println(e.getMessage());
        	}    
    		System.out.println("**** User logged out ****");
    	}
    }
}