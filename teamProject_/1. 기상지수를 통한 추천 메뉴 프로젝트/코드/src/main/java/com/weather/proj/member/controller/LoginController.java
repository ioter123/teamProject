package com.weather.proj.member.controller;
import java.io.IOException;                            
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.weather.proj.join.dao.JoinDAO;
import com.weather.proj.member.dao.MemberDAO;
import com.weather.proj.member.vo.MemberVO;

@Controller
public class LoginController {
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
    @Autowired
	MemberDAO dao;
    
    @Autowired
	com.weather.proj.join.dao.JoinDAO dao1;
    

    //���̹� �α��� ������ callbackȣ�� �޼ҵ�
    @RequestMapping(value = "callback", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, ModelAndView mv)
            throws Exception {
        System.out.println("����� callback");
        OAuth2AccessToken oauthToken;
        System.out.println(state);
        System.out.println(code);
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //�α��� ����� ������ �о�´�.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        model.addAttribute("result", apiResult);
        System.out.println("result"+apiResult);
        /* ���̹� �α��� ���� ������ View ȣ�� */
        JSONParser parser = new JSONParser(); 
        Object obj = parser.parse(apiResult); 
        JSONObject jsonObj = (JSONObject) obj; 
        //3. ������ �Ľ� //Top���� �ܰ� _response �Ľ� 
        JSONObject response_obj = (JSONObject)jsonObj.get("response"); 
        //response�� nickname�� �Ľ� 
//        System.out.println(obj);
        String email = (String)response_obj.get("email");
        String id = email.substring(0,email.lastIndexOf("@"));
//        System.out.println(id);
        String gender = (String)response_obj.get("gender");
        String name = (String)response_obj.get("name");
        MemberVO vo = new MemberVO();
        System.out.println(obj);
        System.out.println(id);
        System.out.println(name);
        System.out.println(email);
        System.out.println(gender);
        vo.setCus_id(id);
        vo.setCus_name(name);
        vo.setCus_sex(gender);
        vo.setCus_email(email);

        MemberVO result = dao.loginProc2(vo);
        if(result==null) {
        	// ȸ������ ��
        	dao1.joinInsert2(vo);
        	MemberVO vo1=dao.loginProc2(vo);
        	
        	// �α���
        	session.setAttribute("UID",vo1.getCus_id());
			session.setAttribute("UNAME",vo1.getCus_name());
			session.setAttribute("LEVEL",String.valueOf(vo1.getCus_class()));
			RedirectView rv = new RedirectView("main.do");
			mv.setView(rv);
		}
		else if(result.getCus_out().equals("Y")){
			mv.addObject("loginck","out");
			RedirectView rv = new RedirectView("loginFrm.do");
			mv.setView(rv);
		}
		else {
			session.setAttribute("UID",result.getCus_id());
			session.setAttribute("UNAME",result.getCus_name());
			session.setAttribute("LEVEL",String.valueOf(result.getCus_class()));
			RedirectView rv = new RedirectView("main.do");
			mv.setView(rv);
		}
        
        return mv;
    }
    
    @Autowired
    KakaoController kc;

    @RequestMapping(value = "kakaologin", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView kakao(@RequestParam("code") String code, HttpSession session,ModelAndView mv)
            throws Exception {
    	// JsonNodeƮ�����·� ��ū�޾ƿ´�
    	System.out.println(code);
    	JsonNode node = kc.getAccessToken(code);
        System.out.println(node);
        String token = node.get("access_token").toString();
        // ���� json��ü �� access_token�� �����´�
        session.setAttribute("token", token);
        MemberVO vo = kc.getKakaoUserInfo(token);        
        MemberVO result = dao.loginProc2(vo);
        if(result==null) {
        	// ȸ������ ��
        	dao1.joinInsert2(vo);
        	MemberVO vo1=dao.loginProc2(vo);
        	
        	// �α���
        	session.setAttribute("UID",result.getCus_id());
			session.setAttribute("UNAME",result.getCus_name());
			session.setAttribute("LEVEL",String.valueOf(result.getCus_class()));
			RedirectView rv = new RedirectView("main.do");
			mv.setView(rv);
		}
		else if(result.getCus_out().equals("Y")){
			mv.addObject("loginck","out");
			RedirectView rv = new RedirectView("loginFrm.do");
			mv.setView(rv);
		}
		else {
			session.setAttribute("UID",result.getCus_id());
			session.setAttribute("UNAME",result.getCus_name());
			session.setAttribute("LEVEL",String.valueOf(result.getCus_class()));
			RedirectView rv = new RedirectView("main.do");
			mv.setView(rv);
		}
        
        return mv;
    }
    
}

