package MT;





public class LinkDatabase{
	
	String name;
	String URL;
	int vote;
        int given;
   String username;
	
   public void setusername(String name)
	{
		this.username=name;
	}
	
	public String getusername()
	{
		return this.username;
	}
	public void setname(String name)
	{
		this.name=name;
	}
	
	public String getname()
	{
		return this.name;
	}
	
	public void setURL(String URL)
	{
		this.URL=URL;
	}
	
	public String getURL()
	{
		return this.URL;
	}
	
	public void setvote(int num)
	{
		this.vote = num;
	}
	
	public int getvote()
	{
		return this.vote;
	}
        
        
}
