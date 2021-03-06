package com.iwonder.tea.usr.service.imp;

import java.util.ArrayList;

import com.iwonder.tea.usr.dao.IAddressInfoDao;
import com.iwonder.tea.usr.dao.IUserInfoDao;
import com.iwonder.tea.usr.dao.imp.AddressInfoDaoImp;
import com.iwonder.tea.usr.dao.imp.UserInfoDaoImp;
import com.iwonder.tea.usr.entity.UserInfo;
import com.iwonder.tea.usr.service.IUserInfoService;
import com.iwonder.tea.usr.view.UserInfoConditionView;
import com.iwonder.tea.usr.view.UserInfoQueryView;

public class UserInfoServiceImp implements IUserInfoService {
	private IUserInfoDao userInfoDao = new UserInfoDaoImp();
	// private IAddressInfoDao addressInfoDao = new AddressInfoDaoImp();

	public ArrayList<UserInfoQueryView> list(UserInfoConditionView userInfoConditionView) {

		return userInfoDao.list(userInfoConditionView);

	}

	public UserInfo load(String userId) {

		return userInfoDao.load(userId);

	}

	public void insert(UserInfo userInfo) {

		userInfoDao.insert(userInfo);

	}

	public void update(UserInfo userInfo) {

		userInfoDao.update(userInfo);

	}

	public void delete(String userId) {

		userInfoDao.delete(userId);
		// addressInfoDao.deleteByStudentId(userId);

	}

	@Override
	public ArrayList<UserInfo> list() {
		return userInfoDao.list();
	}

	@Override
	public UserInfo login(UserInfo userInfo) {
		return userInfoDao.login(userInfo);
	}
}
