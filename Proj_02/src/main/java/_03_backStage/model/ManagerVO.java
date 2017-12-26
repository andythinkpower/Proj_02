package _03_backStage.model;

public class ManagerVO implements java.io.Serializable
{
	private static final long serialVersionUID = 1L;  //沒寫不會怎樣,寫了更好
	public ManagerVO(){}  //不帶參數的建構子
	public ManagerVO(int Manager_ID,String Manager_Account,String Manager_Password,int Manager_Level)
	{
		this.Manager_ID = Manager_ID;
		this.Manager_Account = Manager_Account;
		this.Manager_Password = Manager_Password;
		this.Manager_Level = Manager_Level;
	}
	
	//====================private實例變數=============================
	private int Manager_ID;
	private String Manager_Account;
	private String Manager_Password;
	private int Manager_Level; //管理者等級
	//==============================================================
	
	//====================getter跟setter=============================
	public int getManager_ID()
	{
		return Manager_ID;
	}
	public void setManager_ID(int manager_ID)
	{
		Manager_ID = manager_ID;
	}
	public String getManager_Account()
	{
		return Manager_Account;
	}
	public void setManager_Account(String manager_Account)
	{
		Manager_Account = manager_Account;
	}
	public String getManager_Password()
	{
		return Manager_Password;
	}
	public void setManager_Password(String manager_Password)
	{
		Manager_Password = manager_Password;
	}
	public int getManager_Level()
	{
		return Manager_Level;
	}
	public void setManager_Level(int manager_Level)
	{
		Manager_Level = manager_Level;
	}

	
}
