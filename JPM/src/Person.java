
public abstract class Person implements JobService
{
	private int ID;
	private String firstName;
	private String lastName;
	private String email;
	private int contactNumber;
	private String username;
	private String password;
	
	public void registerAccount()
	{
		return;
	}
	
	public boolean updateInfo()
	{
		return true;
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

	public int getID()
	{
		return ID;
	}

	public void setID(int iD)
	{
		ID = iD;
	}

	public String getFirstName()
	{
		return firstName;
	}

	public void setFirstName(String firstName)
	{
		this.firstName = firstName;
	}

	public String getLastName()
	{
		return lastName;
	}

	public void setLastName(String lastName) 
	{
		this.lastName = lastName;
	}

	public String getEmail() 
	{
		return email;
	}

	public void setEmail(String email) 
	{
		this.email = email;
	}

	public int getContactNumber()
	{
		return contactNumber;
	}

	public void setContactNumber(int contactNumber) 
	{
		this.contactNumber = contactNumber;
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}
}
