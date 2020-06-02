
public class Excepciones {
    
    public static void main(String[] args) {
        
        int num, den;
        float division;
        
        num = 20;
        den = 0;
        System.out.println("Antes de la division");
        try{
            division = num / den;    
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e);
            //e.printStackTrace(System.out);
            division = 0;
        }
        
        System.out.println("Despues de la division");
        System.out.println(division);
    }
}
