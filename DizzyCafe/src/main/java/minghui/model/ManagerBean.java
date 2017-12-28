package minghui.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="MANAGER")
public class ManagerBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int managerId;
	private String managerAccount;
	private String managerPassword;
	private String managerPhoto;
	private int managerLevel;
	
	
	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public String getManagerAccount() {
		return managerAccount;
	}
	public void setManagerAccount(String managerAccount) {
		this.managerAccount = managerAccount;
	}
	public String getManagerPassword() {
		return managerPassword;
	}
	public void setManagerPassword(String managerPassword) {
		this.managerPassword = managerPassword;
	}
	public String getManagerPhoto() {
		return managerPhoto;
	}
	public void setManagerPhoto(String managerPhoto) {
		this.managerPhoto = managerPhoto;
	}
	public int getManagerLevel() {
		return managerLevel;
	}
	public void setManagerLevel(int managerLevel) {
		this.managerLevel = managerLevel;
	}
	
	@Override
	public String toString() {
		return "ManagerBean [managerId=" + managerId + ", managerAccount=" + managerAccount + ", managerLevel="
				+ managerLevel + "]";
	}	
	
}
