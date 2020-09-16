package com.weather.proj.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.weather.proj.member.vo.MemberVO;

@Service
public class KakaoController {
	
	public JsonNode getAccessToken(String autorize_code) {
		 
        final String RequestUrl = "https://kauth.kakao.com/oauth/token";
 
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
 
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
 
        postParams.add(new BasicNameValuePair("client_id", "bbccaf38294801c2dee60e6c0660d931"));
 
        postParams.add(new BasicNameValuePair("redirect_uri", "http://teamjesus.iptime.org/proj/kakaologin.do"));
 
        postParams.add(new BasicNameValuePair("code", autorize_code));
 
        final HttpClient client = HttpClientBuilder.create().build();
 
        final HttpPost post = new HttpPost(RequestUrl);
 
        JsonNode returnNode = null;
 
        try {
 
            post.setEntity(new UrlEncodedFormEntity(postParams));
 
            final HttpResponse response = client.execute(post);
 
            ObjectMapper mapper = new ObjectMapper();
 
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (UnsupportedEncodingException e) {
 
            e.printStackTrace();
 
        } catch (ClientProtocolException e) {
 
            e.printStackTrace();
 
        } catch (IOException e) {
 
            e.printStackTrace();
 
        } finally {
 
        }
 
        return returnNode;
 
    }

    
    public MemberVO getKakaoUserInfo(String access_Token) {
    	MemberVO vo = new MemberVO();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    ��û�� �ʿ��� Header�� ���Ե� ����
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	        
	        String line = "";
	        StringBuffer result = new StringBuffer();
	        
	        while ((line = br.readLine()) != null) {
	        	result.append(new String(URLDecoder.decode(line, "UTF-8")));
	        }
	        System.out.println("response body : " + result.toString());
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result.toString());
	        System.out.println(result);
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
	        System.out.println(email);
	        String id= email.substring(0,email.lastIndexOf("@"));
	        
	        vo.setCus_id(id);
	        vo.setCus_name(nickname);
	        vo.setCus_email(email);
	        vo.setCus_sex("");
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    
	    return vo;
	}
    
    public JsonNode Logout(String autorize_code) {
        final String RequestUrl = "https://kapi.kakao.com/v2/user/logout";
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
        post.addHeader("Authorization", "Bearer " + autorize_code);
        JsonNode returnNode = null;
        try {
            final HttpResponse response = client.execute(post);
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
        return returnNode;
 
    }
}

    