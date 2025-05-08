package kr.kh.tableup.model.util;

import java.util.Arrays;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.kh.tableup.model.vo.MemberVO;
import kr.kh.tableup.model.vo.RestaurantManagerVO;

public class CostomManager extends User{

	
	private RestaurantManagerVO manager;
	
	public CostomManager(String rm_username, String rm_password, Collection<? extends GrantedAuthority> authorities) {
		super(rm_username, rm_password, authorities);
	}
	public CostomManager(RestaurantManagerVO vo) {
		super(	vo.getRm_id(),
				vo.getRm_pw(), 
				Arrays.asList(new SimpleGrantedAuthority(vo.getMe_authority())));
		this.manager = vo;
	}
	
}
