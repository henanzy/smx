package com.hnzy.hot.socket;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.mina.transport.socket.nio.NioSocketAcceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hnzy.hot.socket.server.ServerSocket;


public class ServerListener implements ServletContextListener, HttpSessionListener{
	 private final static Logger log = LoggerFactory.getLogger(ServerListener.class);
	 private ReplyTimer rt = null;
	 private ServerSocket server;
	  private static NioSocketAcceptor acceptor;
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		server.stopServer();
		ServerListener.acceptor.unbind();
		ServerListener.acceptor.dispose();
		event.getServletContext().log("监听器销毁");
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		server=new ServerSocket();
		boolean flag=server.startServer();
			rt =new ReplyTimer(1);
			rt.start();
	        
		if (flag) {
			log.info("--服务器Socket已经启动成功！");
		}else{
			log.info("服务器Socket启动失败---");
		}
	}

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		
	}

}
