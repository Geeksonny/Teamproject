package com.itwillbs.service;

import java.io.BufferedReader;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.google.protobuf.TextFormat.ParseException;

@Service
public class ApiService {

		// 카카오 토큰 받기
	    public String getToken(String code) throws IOException {
	        // 인가코드로 토큰받기
	        String host = "https://kauth.kakao.com/oauth/token";
	        URL url = new URL(host);
	        HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
	        String token = "";
	        try {
	            urlConnection.setRequestMethod("POST");
	            urlConnection.setDoOutput(true); // 데이터 기록 알려주기

	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=d7b448253a75eb1ebba5ccf3936ad5ea");
	            sb.append("&redirect_uri=http://localhost:8080/web/auth/kakao");
	            sb.append("&code=" + code);

	            bw.write(sb.toString());
	            bw.flush();

	            int responseCode = urlConnection.getResponseCode();
	            System.out.println("responseCode = " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
	            String line = "";
	            String result = "";
	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("result = " + result);

	            // json parsing
	            JSONParser parser = new JSONParser();
	            JSONObject elem = (JSONObject) parser.parse(result);

	            String access_token = elem.get("access_token").toString();
	            String refresh_token = elem.get("refresh_token").toString();
	            System.out.println("refresh_token = " + refresh_token);
	            System.out.println("access_token = " + access_token);

	            token = access_token;

	            br.close();
	            bw.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }


	        return token;
	    }

	    // 카카오 유저 정보 가져오기
	    public Map<String, String> getUserInfo(String access_token) throws IOException {
	        String host = "https://kapi.kakao.com/v2/user/me";
	        Map<String, String> result = new HashMap<>();
	        try {
	            URL url = new URL(host);

	            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
	            urlConnection.setRequestProperty("Authorization", "Bearer " + access_token);
	            urlConnection.setRequestMethod("GET");

	            int responseCode = urlConnection.getResponseCode();
	            System.out.println("responseCode = " + responseCode);


	            BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
	            String line = "";
	            String res = "";
	            while((line=br.readLine())!=null)
	            {
	                res+=line;
	            }

	            JSONParser parser = new JSONParser();
	            JSONObject obj = (JSONObject) parser.parse(res);
	            JSONObject kakao_account = (JSONObject) obj.get("kakao_account");
	            JSONObject properties = (JSONObject) obj.get("properties");

	            String nickname = properties.get("nickname").toString();
	            String email = kakao_account.get("email").toString();

	            result.put("user_id", email);
	            result.put("user_name", nickname);
	            result.put("user_Type", "1");
	            br.close();


	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return result;
	    }


}
