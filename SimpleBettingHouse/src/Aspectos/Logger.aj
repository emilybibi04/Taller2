import java.io.File;
import java.util.Calendar;

public aspect Logger {

    File file = new File("Register.txt");  
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    pointcut success() : call(* successfulSignUp(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }
}