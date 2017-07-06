package com.lzcb.bigitem.dao;

import java.util.List;

import com.lzcb.bigitem.Entity.Department;

public interface DepartmentDao {
	public void addDepartment(Department department);//添加部门信息
	public void updateDepartment(Department department);//修改部门信息
	public void deleteDepartment(int id);//删除部门
	public List<Department> findDeptAll(int currentPage,int pageSize);//分页查询所有部门
	public List<Department> findDeptAll();//不分页查询所有部门
	public Department findDeptById(int id);//根据id查询部门
	public List<String> findSjbh();//查询上级编号
	public String nameByDeptId(int id);//根据部门ID返回部门名称,上级编号用
	public int idByDeptName(String name);//根据部门名称,返回id,修改部门信息用
	public int queryCount();//查询数据个数
}
