package by.rakushev.web;

import java.util.logging.Logger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import by.rakushev.dal.CrudDao;
import by.rakushev.entity.Clients;
import by.rakushev.entity.News;
import by.rakushev.exception.DalException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user/")
public class ItemController {
	private Logger LOGGER = Logger.getLogger(ItemController.class.getSimpleName());

	@Autowired
	private CrudDao crudDao;

	@RequestMapping("/login")
	public String login(HttpSession session) {
		if (session != null) {
			session.removeAttribute("login");
		}
		session.invalidate();
		return "login";
	}

	@RequestMapping("/registr")
	public String registr() {

		return "registration";
	}

	@RequestMapping("/reg")
	public String reg(@ModelAttribute Clients client) {
		try {
			List<Clients> clients = crudDao.list(Clients.class);
			for (Clients cl : clients) {
				if (cl.getMail().equals(client.getMail()) || cl.getLogin().equals(client.getLogin())) {
					return "error-mail";
				}
			}
			crudDao.merge(client);

		} catch (DalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "reg-complete";
	}

	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model, HttpSession session) {
		String login = request.getParameter("login");
		String pass = request.getParameter("password");
		try {
			List<News> list = reverse(crudDao.list(News.class));
			session.setAttribute("login", login);
			model.addAttribute("news", list);
			session.setAttribute("x", new Integer(0));
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		}
		if (login.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("admin")) {
			return "list-admin";
		}
		if (check(login, pass))
			return "list";
		else
			return "error-login";
	}

	public static <T> List<T> reverse(List<T> src) {
		List<T> results = new ArrayList<T>(src);
		Collections.reverse(results);
		return results;
	}

	public boolean check(String login, String pass) {
		try {
			List<Clients> clients = crudDao.list(Clients.class);
			for (Clients cl : clients) {
				if (cl.getLogin().equalsIgnoreCase(login) && cl.getPassword().equalsIgnoreCase(pass)) {
					return true;
				}
			}
		} catch (DalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@ModelAttribute("client")
	public Clients newClient() {
		return new Clients();
	}
}
//
// @RequestMapping("/delete")
// public String delete(@RequestParam Long id) {
// try {
// crudDao.delete(Item.class, id);
// } catch (DalException e) {
// LOGGER.severe(e.getMessage());
// }
// return "forward:/item/list/";
// }
//

