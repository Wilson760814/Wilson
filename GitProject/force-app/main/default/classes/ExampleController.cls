public class ExampleController {

    DateTime t1;
    transient DateTime t2;

    public String getT1() {
        if (t1 == null) 
        { 
            t1 = System.now(); 
            system.debug('t10= '+t1);
        }
        system.debug('t11= '+t1);
        return '' + t1;
    }

    public String getT2() {
        if (t2 == null) 
        {
            t2 = System.now();
            system.debug('t20= '+t2);
        }
         system.debug('t21= '+t2);
        return '' + t2;
    }
}