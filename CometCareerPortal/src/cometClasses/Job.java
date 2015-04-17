package cometClasses;

public class Job {

	private int job_id;
	private String title;
	private String description;
	private String visa_category;
	private String job_type;
	private String primaryreq;
	private String secondaryreq;
	private String additionalreq;
	private int author_id;
	private String link;

	public String getPrimaryreq() {
		return primaryreq;
	}

	public void setPrimaryreq(String primaryreq) {
		this.primaryreq = primaryreq;
	}

	public String getSecondaryreq() {
		return secondaryreq;
	}

	public void setSecondaryreq(String secondaryreq) {
		this.secondaryreq = secondaryreq;
	}

	public String getAdditionalreq() {
		return additionalreq;
	}

	public void setAdditionalreq(String additionalreq) {
		this.additionalreq = additionalreq;
	}

	public int getJob_id() {
		return job_id;
	}

	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
	public String getVisa_category() {
		return visa_category;
	}

	public void setVisa_category(String visa_category) {
		this.visa_category = visa_category;
	}

	public String getJob_type() {
		return job_type;
	}

	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}

	public int getAuthor_id() {
		return author_id;
	}

	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
}
