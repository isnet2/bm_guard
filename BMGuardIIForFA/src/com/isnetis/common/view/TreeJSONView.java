package com.isnetis.common.view;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.isnetis.device.domain.ClientGroupVO;
import com.isnetis.device.domain.ClientMastVO;

public class TreeJSONView extends AbstractView{

	@SuppressWarnings("unchecked")
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String operation = (String)model.get("operation");
		
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if("GET_CHILDREN".equals(operation)){
			List<ClientGroupVO> list = (List<ClientGroupVO>)model.get("list");
			
			JsonArray array = new JsonArray();			
			for(ClientGroupVO vo : list){
				JsonObject attr = new JsonObject();
				attr.addProperty("id", "node_" + vo.getClientgrp_idx());
				attr.addProperty("rel", "folder");
				
				JsonObject node = new JsonObject();
				node.add("attr", attr);
				node.addProperty("data", vo.getClientgrp_name());
				node.addProperty("state", vo.getRef_count() == 0 ? "" : "closed" );
				
				array.add(node);
			}
			out.write(array.toString());
			
		}else if("CREATE_GROUP".equals(operation)){
			JsonObject obj = new JsonObject();
			obj.addProperty("status", (Integer)model.get("status"));
			obj.addProperty("id", (Integer)model.get("clientgrp_idx"));
			
			out.write(obj.toString());
			
		}else if("RENAME_GROUP".equals(operation) || "REMOVE_GROUP".equals(operation)){
			JsonObject obj = new JsonObject();
			obj.addProperty("status", (Integer)model.get("status"));
			
			out.write(obj.toString());
			
		}else if("GET_DEVICE".equals(operation)){
			List<ClientMastVO> list = (List<ClientMastVO>)model.get("list");
			
			JsonArray array = new JsonArray();
			for(ClientMastVO vo : list){
				JsonObject obj = new JsonObject();
				obj.addProperty("clientgrp_idx", (Integer)model.get("clientgrp_idx"));
				obj.addProperty("client_idx", vo.getClient_idx());
				obj.addProperty("client_name", vo.getClient_name());
				obj.addProperty("ip_addr", vo.getIp_addr());
				obj.addProperty("mac_addr", vo.getMac_addr());
				obj.addProperty("os_type", vo.getOs_type());
				obj.addProperty("create_date", vo.getCreate_date());
				
				array.add(obj);
			}
			out.write(array.toString());
		}else if("SEARCH_DEVICE".equals(operation)){
			List<String> list = (List<String>)model.get("list");
			/*
			 {"1/7/34", "1/9/32"} --> {"#node_1", "#node_7", "#node_34", "#node_1", "#node_9, "#node_32"}로 변경
			 */
			List<String> elementList = new ArrayList<String>();
			for(String path : list){
				String[] splitArray = path.split("/");
				for(String element : splitArray){
					if(!element.equals("")){
						elementList.add("#node_" + element);
					}
				}
			}

			Gson gson = new Gson();
			out.write(gson.toJson(elementList.toArray()));			
		}
	}
}
