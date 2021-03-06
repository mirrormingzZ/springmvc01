package com.iwonder.tea.sys.service.imp;

import java.util.ArrayList;

import com.iwonder.tea.sys.dao.IStaffDao;
import com.iwonder.tea.sys.dao.imp.StaffDaoImp;
import com.iwonder.tea.sys.entity.Staff;
import com.iwonder.tea.sys.service.IStaffService;
import com.iwonder.tea.sys.view.StaffConditionView;
import com.iwonder.tea.sys.view.StaffQueryView;

public class StaffServiceImp implements IStaffService {
	private IStaffDao staffDao = new StaffDaoImp();

	public ArrayList<StaffQueryView> list(StaffConditionView staffConditionView) {

		return staffDao.list(staffConditionView);

	}

	public ArrayList<Staff> list() {

		return staffDao.list();

	}

	public Staff load(String staffId) {

		return staffDao.load(staffId);

	}

	public void insert(Staff staff) {

		staffDao.insert(staff);

	}

	public void update(Staff staff) {

		staffDao.update(staff);

	}

	public void delete(String staffId) {

		staffDao.delete(staffId);
		// addressInfoDao.deleteByStudentId(userId);

	}

	@Override
	public Staff login(Staff staff) {
		return staffDao.login(staff);
	}
}
