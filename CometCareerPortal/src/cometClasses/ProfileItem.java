package cometClasses;

import java.util.ArrayList;

public class ProfileItem {

	private ArrayList<Project> projectList;
	private ArrayList<WorkExperience> workList;
	private ArrayList<Skills> skillsList;
	
	public ArrayList<Project> getProjectList() {
		return projectList;
	}
	public void setProjectList(ArrayList<Project> projectList) {
		this.projectList = projectList;
	}
	public ArrayList<WorkExperience> getWorkList() {
		return workList;
	}
	public void setWorkList(ArrayList<WorkExperience> workList) {
		this.workList = workList;
	}
	public ArrayList<Skills> getSkillsList() {
		return skillsList;
	}
	public void setSkillsList(ArrayList<Skills> skillsList) {
		this.skillsList = skillsList;
	}

}
