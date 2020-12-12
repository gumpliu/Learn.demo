import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

public class IoOperation {
    static byte[] data = "1234567890\n".getBytes();
    static String path = "/home/id-server/idTest.txt";
    static int count = 0;
    public static void main(String[] args) throws Exception {
        switch (args[0]) {
            case "0":
                testBasicFileIO();
                break;
            case "1":
                testBufferedFileIO();
                break;
            default:

        }
    }
    public static void testBasicFileIO() throws Exception {
        File file = new File(path);
        if(file.exists()){
            file.createNewFile();
        }
        FileOutputStream out = new FileOutputStream(file);
        final long start = System.currentTimeMillis();
        while (count < 10000) {
            out.write(data);
            count++;
        }
        System.out.println(System.currentTimeMillis() - start);
        out.close();
    }
    public static void testBufferedFileIO() throws Exception {
        File file = new File(path);
        BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(file));
        final long start = System.currentTimeMillis();
        while (count < 10000) {
            out.write(data);
            count++;
        }
        System.out.println(System.currentTimeMillis() - start);
        out.close();
    }
}
