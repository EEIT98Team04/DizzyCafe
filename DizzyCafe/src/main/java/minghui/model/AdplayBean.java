package minghui.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ADPLAY")
public class AdplayBean {
	@Id
	private int id;
		
	@Override
	public String toString() {
		return "AdplayBean [id=" + id + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
}
