package test.mvc.chatting;


import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.springframework.web.bind.annotation.RequestParam;

public class ChatServer 
{

	//필드
	ServerSocket serverSocket;
	ExecutorService threadPool = Executors.newFixedThreadPool(100); //동시채팅 100명가능=클라이언트100개
	Map<String, SocketClient> chatRoom=Collections.synchronizedMap(new HashMap<>());
	
	
	//서비시작메소드
		public void start() throws IOException  
		{
			serverSocket =new ServerSocket(50001); //50001=포트번호
			System.out.println("서버시작");	
			
			Thread thread=new Thread(() -> //Thread 관련 기능의 확장이 필요한 경우에는 Runnable 인터페이스를 사용하면 해결 가능하다. 
			{
		 
			try {
				while(true)
				{
					Socket socket=serverSocket.accept(); //accept로 람다식의 연결을 수락
					SocketClient sc=new SocketClient(this, socket); //통신용 SocketClient 생성
				}//while문
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//try~catch
			 
			
			});//thread 람다식
			thread.start(); //start 호출
		
		}//start
	
		//클라이언트(접속자) 연결시 통신생성
		public void addSocketClient(SocketClient socketClient)//채팅방에 통신을 추가하는역할(채팅방 들어옴)
		{
			String key=socketClient.chatName+"@"+socketClient.clientIp;
			chatRoom.put(key, socketClient);
			
		}
		
		
		
		//클라이언트(접속자) 퇴장시 통신제거
		public void removedSocketClient(SocketClient socketClient)//채팅방에 통신을 제거하는역할(채팅방 나감)
		{
			
			
		}

}//ChatServer
		

	
