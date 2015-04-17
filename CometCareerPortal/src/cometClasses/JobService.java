package cometClasses;

import java.sql.Connection;

public interface JobService {

	public void postJob(Job job, Connection con,int id);
	public void searchProfile();

}
