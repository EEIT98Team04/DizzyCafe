package dragon.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="store")
public class StoreBean {
	@Id
	private int storeId;
	private String storeName; 
	private String storeAddress;

	@Override
	public String toString() {
		return "StoreBean [stroeId=" + storeId + ", storeName=" + storeName + ", storeAddress=" + storeAddress + "]";
	}
	
	public int getStroeId() {
		return storeId;
	}
	public void setStroeId(int stroeId) {
		this.storeId = stroeId;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	
	
}
