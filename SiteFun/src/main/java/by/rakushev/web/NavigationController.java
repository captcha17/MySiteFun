package by.rakushev.web;

import java.io.IOException;
import java.util.logging.Logger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import by.rakushev.dal.CrudDao;
import by.rakushev.entity.Clients;
import by.rakushev.entity.Comments;
import by.rakushev.entity.News;
import by.rakushev.entity.Questions;
import by.rakushev.exception.DalException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

@Controller
@RequestMapping("/navigation/")
public class NavigationController {
	private Logger LOGGER = Logger.getLogger(ItemController.class.getSimpleName());

	@Autowired
	private CrudDao crudDao;

	@RequestMapping("/category")
	public String category(Model model, @RequestParam("group") String group, HttpSession session) {
		try {
			List<News> list = reverse(crudDao.getGroup(News.class, group));
			model.addAttribute("news", list);
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		}
		if ("admin".equalsIgnoreCase((String) session.getAttribute("login")))
			return "list-admin";
		else
			return "list";
	}
	
	@RequestMapping("/search")
	public String search(HttpServletRequest request, Model model, HttpSession session) {
		String searchField = request.getParameter("searchRequest");
		try {
			List<News> list = reverse(crudDao.list(News.class, searchField));
			model.addAttribute("news", list);
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		}
		if ("admin".equalsIgnoreCase((String) session.getAttribute("login")))
			return "list-admin";
		else
			return "list";
	}
	
	@RequestMapping("/photo")
	public String photo(Model model) {
		try {
			List<News> list = reverse(crudDao.list(News.class));
			model.addAttribute("news", list);
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		}
		return "photos";
	}

	@RequestMapping("/categories")
	public String categories() {

		return "categories";
	}
	
	@RequestMapping("/contacts")
	public String contacts() {

		return "contacts";
	}
	
	@RequestMapping("/question")
	public String question(HttpServletRequest req, Model model) {
		String fio=req.getParameter("fio");
		String organization=req.getParameter("organization");
		String phone=req.getParameter("phone");
		String mail=req.getParameter("mail");
		String sms=req.getParameter("sms");
		if (!fio.isEmpty() && !mail.isEmpty() && !sms.isEmpty()){
			Questions q=new Questions();
			q.setFio(fio);
			q.setOrganization(organization);
			q.setPhone(phone);
			q.setMail(mail);
			q.setSms(sms);
			try {
				crudDao.merge(q);
			} catch (DalException e) {
				LOGGER.severe(e.getMessage());
			}
			model.addAttribute("success", "Вопрос успешно отправлен!");
		}
		else model.addAttribute("error", "Заполните обязательные поля!");
		return "contacts";
	}
	
	@RequestMapping("/comment")
	public void addcomment(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
		Map <String, Object> map= new HashMap<String,Object>();
		boolean isValid = false;
		String login=(String)session.getAttribute("login");
		Long newsId=(Long)session.getAttribute("newsId");
		String comment = request.getParameter("comment");
		if(comment != null && comment.length()!=0){
			isValid = true;
			try {
				Comments logCom=new Comments();
				logCom.setComment(comment);
				logCom.setLogin(login);
				logCom.setNews(newsId);
				map.put("comment", comment);
				map.put("login", login);
				crudDao.merge(logCom);
			} catch (DalException e) {
				LOGGER.severe(e.getMessage());
			}
		}
		map.put("isValid", isValid);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(new Gson().toJson(map));
//		return "login";
	}

	@RequestMapping("/pagination")
	public String pagination(Model model, HttpSession session, @RequestParam("page") Integer page) {
		if (page<0){
			page=0;}
		else if(page>5){
			page=5;}
		session.setAttribute("x", page);
		try {
			List<News> list = reverse(crudDao.list(News.class));
			model.addAttribute("news", list);
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		}
		if ("admin".equalsIgnoreCase((String) session.getAttribute("login")))
			return "list-admin";
		else
			return "list";
	}
	
	@RequestMapping("/profile")
	public String profile(@RequestParam("log") String login, HttpSession session) {
		try {
			Clients client = crudDao.getProfile(Clients.class, login);
			session.setAttribute("client", client);
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		}
		return "profile";
	}
	
	@RequestMapping("/settings")
	public String settings(@RequestParam("log") String login, HttpSession session) {
		try {
			Clients client = crudDao.getProfile(Clients.class, login);
			session.setAttribute("client", client);
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		}
		return "settings";
	}
	
	@RequestMapping("/change")
	public String change(HttpSession session, HttpServletRequest req) {
		try {
			Clients updClient=(Clients)session.getAttribute("client");
			String myName=(String)req.getParameter("myname");
			String myLastName=(String)req.getParameter("mylastname");
			String sex=(String)req.getParameter("sex");
			String about=(String)req.getParameter("about");
			if (!myName.isEmpty())
			updClient.setMyname(myName);
			if (!myLastName.isEmpty())
			updClient.setMylastname(myLastName);
			if (!sex.isEmpty())
			updClient.setSex(sex);
			if (!about.isEmpty())
			updClient.setAbout(about);
			crudDao.saveOrUpdate(updClient);
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		}
		return "profile";
	}
	
	@RequestMapping("/changepass")
	public String changePass(HttpSession session, HttpServletRequest req, Model model) {
		try {
			Clients updClient=(Clients)session.getAttribute("client");
			String oldPass=req.getParameter("oldPassword");
			String newPass=req.getParameter("newPassword");
			String confirm=req.getParameter("confirm");
			if (oldPass.equals(updClient.getPassword())){
				if (newPass.equals(confirm)){
				updClient.setPassword(newPass);
				updClient.setConfirm(confirm);
			crudDao.saveOrUpdate(updClient);
			model.addAttribute("success", "Пароль успешно изменен!!!");
				}
				else model.addAttribute("notconfirm", "Новый пароль не подтверден!!!");
			}
			else 
				model.addAttribute("error", "Старый пароль не подтвержден!!!");
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		}
		return "settings";
	}

	@RequestMapping("/out")
	public String out(@RequestParam("index") Long id, Model model,HttpSession session) {
		try {
			News objId = crudDao.check(News.class, id);
			List<Comments> list = reverse(crudDao.getGroup(Comments.class, id));
			model.addAttribute("listComments", list);
			model.addAttribute("objId", objId);
			session.setAttribute("newsId", id);
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		}
		return "output";
	}

	public static <T> List<T> reverse(List<T> src) {
		List<T> results = new ArrayList<T>(src);
		Collections.reverse(results);
		return results;
	}

}