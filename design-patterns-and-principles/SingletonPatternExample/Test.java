public class Test{
    public static void main(String[] args){
        Logger l1 = Logger.getInstance();
        Logger l2 = Logger.getInstance(); 

        l1.Log("Starting the application.");
        l2.Log("Application is running.");

        if(l1 == l2){
            System.out.println("Both references point to the same Logger instance.");
        } else {
            System.out.println("Different Logger instances exist.");
        }
        
        //Displaying hash codes of the logger instances to confirm they are the same instance

        System.out.println("Hash code of l1: " + l1.hashCode());
        System.out.println("Hash code of l2: " + l2.hashCode());
    }
}