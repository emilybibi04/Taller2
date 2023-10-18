import java.io.File;
import java.util.Calendar;

public aspect cerrar {

    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    pointcut success() : call(* effectiveLogOut(..) );
    after() : success() {
    	System.out.println("**** User logged out ****");
    }
}