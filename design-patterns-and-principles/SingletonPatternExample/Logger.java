
class Logger{
    private static Logger i;

    private Logger(){
        System.out.println("Logger instance created");
    }

    public static Logger getInstance(){
        if(i == null){
            i = new Logger();
        }
        return i;
    }

    public void Log(String m){
        System.out.println("Log:" + m); 
    }
}