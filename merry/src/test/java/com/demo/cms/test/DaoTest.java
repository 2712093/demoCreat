package com.demo.cms.test;


import javax.annotation.Resource;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.demo.cms.dao.AdminDao;
import com.demo.cms.dao.AdminMapper;
import com.demo.cms.dao.ConfigDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DaoTest {

	@Resource(name="adminMapper")
	private AdminMapper adminMapper;
	@Resource(name="adminDao")
	private AdminDao adminDao;
	
	@Resource(name="configDao")
	private ConfigDao configDao;
//	@Resource(name="folderDao")
	
//	public void adminTester(){
//		System.out.println("-----insert test-----");
//		Admin admin = new Admin();
//		admin.setCreateTime(new Date());;
//		admin.setName("哈哈");
//		admin.setPassword("123456");
//		int res=adminDao.addAdmin(admin);
//		System.out.println(res);
//		
//		System.out.println("-----delete test-----");
//		adminDao.deleteAdmin(3L);
//		
//		System.out.println("-----update test-----");
//		adminDao.updateAdminByadminId(2L, "456789");
//		
//		System.out.println("-----offset rows test-----");
//		adminDao.getAllList(1L, 1L);
//		
//		System.out.println("-----get count test-----");
//		System.out.println(adminDao.getAllListCount());
//		
//		System.out.println("-----get by name test-----");
//		System.out.println(adminDao.getAdminByName("观音").getAdminId());
//	}
//	
//	
//	public void adminMapperTester(){
//		Admin admin = new Admin();
//		admin=adminMapper.selectByPrimaryKey(1L);
//		System.out.println(admin.getName()+","+admin.getPassword());
//		
//		
//		admin = new Admin();
//		admin.setCreateTime(new Date());;
//		admin.setName("观音");
//		admin.setPassword("123456");
//		int res=adminMapper.insert(admin);
//		System.out.println(res);
//	}
//	
//	@Test
//	public void configDaoTest(){
//		assert(configDao.getConfigByKey("shamrock_static")!=null);
//	}
//	

}
