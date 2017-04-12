import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class server {
	
	
	public static void main(String[] args) throws IOException {
		
		int port=2271;
		ServerSocket serverSocket=new ServerSocket(port);
		System.out.println("Server is Started!!\n");
	
		while(true)
		{
			
			Socket socket=serverSocket.accept();
			
	
			InputStream ipstream=socket.getInputStream();
			BufferedReader br=new BufferedReader(new InputStreamReader(ipstream));
			
		
			OutputStream os=socket.getOutputStream();
			PrintWriter writer=new PrintWriter(os,true);
			
			
			System.out.println("Client :"+ br.readLine());
			writer.println("this is Test---from server");
			
			
		}
		
		
	}

}






