import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;

public class client {

	
	
	public static void main(String[] args)throws Exception {
		
		
		Socket client=new Socket("localhost",2271);
		
	
		InputStream inputStream=client.getInputStream();
		BufferedReader br=new BufferedReader(new InputStreamReader(inputStream));
		
		
	
		OutputStream stream=client.getOutputStream();
		PrintWriter writer=new PrintWriter(stream,true);
		
		
		writer.println("Hello From Client2");
		System.out.println(br.readLine());
	}
	
}

