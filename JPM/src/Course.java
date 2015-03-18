
public class Course
{
	private int courseID;
	private String courseTitle;
	private String courseSection;
	private Professor professor;
	
	public void addNewCourse()
	{
		return;
	}

	public int getCourseID() 
	{
		return courseID;
	}

	public void setCourseID(int courseID)
	{
		this.courseID = courseID;
	}

	public String getCourseTitle() {
		return courseTitle;
	}

	public void setCourseTitle(String courseTitle) 
	{
		this.courseTitle = courseTitle;
	}

	public String getCourseSection() 
	{
		return courseSection;
	}

	public void setCourseSection(String courseSection) 
	{
		this.courseSection = courseSection;
	}

	public Professor getProfessor() 
	{
		return professor;
	}

	public void setProfessor(Professor professor) 
	{
		this.professor = professor;
	}
}
