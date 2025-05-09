package kr.kh.tableup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.tableup.dao.ManagerDAO;
import kr.kh.tableup.model.vo.RestaurantManagerVO;
import kr.kh.tableup.model.vo.RestaurantVO;

@Service
public class ManagerService {
	
	@Autowired
	ManagerDAO managerDAO;

	public boolean insertManager(RestaurantManagerVO rm) {
		return managerDAO.insertManager(rm);
	}

	public RestaurantManagerVO getManagerId(String rm_id) {
		
		return managerDAO.selectManager(rm_id);
	}

	public RestaurantVO selectRestaurant(int rm_num) {
		return managerDAO.selectRestaurant(rm_num);
	}
}
