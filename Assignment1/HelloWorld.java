public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello World");
        Byte [] b = new Byte[4];
        b[0] = (byte) 0x01;
        b[1] = (byte) 0x02;
        b[2] = (byte) 0x03;
        b[3] = (byte) 0x04;

        int value= (b[3]<<24)&0xff000000|
                (b[2]<<16)&0x00ff0000|
                (b[1]<< 8)&0x0000ff00|
                (b[0]<< 0)&0x000000ff;
        System.out.println(value);
        System.out.println();
    }
}