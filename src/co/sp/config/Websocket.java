package co.sp.config;

import java.util.*;
import javax.websocket.*;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class Websocket {

	private static List<Session> sessionList = Collections.synchronizedList(new ArrayList<Session>());

	@OnOpen
	public void handleOpen(Session session) {
		System.out.println("Connected open");
		sessionList.add(session);
	}

	@OnMessage
	public void handleMessage(String message) {
		System.out.println("메시지 : " + message);
		try {
			for (Session session : sessionList) {
				Basic basic = session.getBasicRemote();
				basic.sendText(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@OnClose
	public void handleClose(Session userSession) {
		sessionList.remove(userSession);
	}

	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
}