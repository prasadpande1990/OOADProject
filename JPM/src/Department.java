
public class Department implements JobService
{
	private int departmentID;
	private String departmentName;
	
	public void reviewProfile()
	{
		return;
	}
	
	public void reviewJobPost()
	{
		return;
	}

	@Override
	public void postJob()
	{
		return;
	}

	@Override
	public void searchProfile()
	{
		return;
	}

	public int getDepartmentID() 
	{
		return departmentID;
	}

	public void setDepartmentID(int departmentID) 
	{
		this.departmentID = departmentID;
	}

	public String getDepartmentName()
	{
		return departmentName;
	}

	public void setDepartmentName(String departmentName)
	{
		this.departmentName = departmentName;
	}
}
