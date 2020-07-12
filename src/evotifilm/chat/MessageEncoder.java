package evotifilm.chat;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

import com.google.gson.Gson;




public class MessageEncoder implements Encoder.Text<Message>{



	@Override
	public void init(EndpointConfig arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String encode(Message msg) throws EncodeException {
		 Gson gson = new Gson();
	     String json = gson.toJson(msg);
	     return json;
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
