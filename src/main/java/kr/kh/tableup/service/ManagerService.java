package kr.kh.tableup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.tableup.dao.ManagerDAO;
import kr.kh.tableup.model.vo.RestaurantManagerVO;

@Service
public class ManagerService {
	
	@Autowired
	ManagerDAO managerDAO;

	public boolean insertManager(RestaurantManagerVO rm) {
		return managerDAO.insertManager(rm);
	}
}
