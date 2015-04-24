package by.rakushev.web;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import by.rakushev.dal.CrudDao;
import by.rakushev.entity.FileUploadForm;
import by.rakushev.entity.News;
import by.rakushev.entity.Questions;
import by.rakushev.exception.DalException;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	private Logger LOGGER = Logger.getLogger(ItemController.class.getSimpleName());
	@Autowired
	CrudDao crudDao;

	@RequestMapping("/list-admin")
	public String listAdmin(Model model, HttpSession session) {
		session.setAttribute("x", new Integer(0));
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

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute News news, @ModelAttribute("uploadForm") FileUploadForm uploadForm) {
		List<MultipartFile> files = null;
		MultipartFile file = null;
		byte[] image = new byte[1024 * 1024 * 100];
		try {
			files = uploadForm.getFiles();
			file = files.get(0);
			image = file.getBytes();
			news.setImage(image);
			crudDao.merge(news);

		} catch (DalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			List<News> list = reverse(crudDao.list(News.class));
			model.addAttribute("news", list);
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		}

		return "redirect:/admin/list-admin";
	}

	public static <T> List<T> reverse(List<T> src) {
		List<T> results = new ArrayList<T>(src);
		Collections.reverse(results);
		return results;
	}

	@RequestMapping("/image")
	public String getImage(@RequestParam("index") Long id, HttpServletResponse resp) {
		try {
			News newId = crudDao.check(News.class, id);
			resp.setContentType("image/jpeg");
			OutputStream out = resp.getOutputStream();
			resp.setContentLength(newId.getImage().length);
			out.write(newId.getImage());
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		} catch (IOException e) {
			LOGGER.severe(e.getMessage());
		}
		return "output";
	}
	
	@RequestMapping("/save")
	public String saveImage(@RequestParam("index") Long id, HttpServletResponse resp) {
		try {
			News newId = crudDao.check(News.class, id);
			resp.setContentType("image/jpeg");
			OutputStream out = resp.getOutputStream();
			resp.setHeader("Content-Disposition", "attachment;filename="+id+".jpeg");
			out.write(newId.getImage());
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		} catch (IOException e) {
			LOGGER.severe(e.getMessage());
		}
		return "output";
	}

	@RequestMapping("/delete")
	public String del(@RequestParam("index") Long id) {
		try {
			crudDao.delete(News.class, id);
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		}
		return "redirect:/admin/list-admin";
	}
	
	@RequestMapping("/admin-questions")
	public String quest(Model model) {
		try {
			List<Questions> questions=reverse(crudDao.list(Questions.class));
			model.addAttribute("questions", questions);
		} catch (DalException e) {
			LOGGER.severe(e.getMessage());
		}
		return "admin-questions";
	}

	@ModelAttribute("news")
	public News newNews() {
		return new News();
	}

}
