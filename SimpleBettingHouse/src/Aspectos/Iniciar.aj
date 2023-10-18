import java.io.File;
import java.util.Calendar;

public aspect Iniciar {

    File file = new File("Log.txt");  
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    pointcut success() : call(* effectiveLogIn(..) );
    after() : success() {
    	System.out.println("**** User Logged in ****");
    }
}