package wayne.model;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="merchandise")
public class MerchandiseBean {
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private int merchandiseId;	                        //--商品編號
		private String merchandiseName;                     //--商品名稱
		private String merchandiseContent;        		    //--商品內容
		private String merchandisePicture;    			    //--商品圖片
		private String merchandiseTag;			            //--商品種類
		private int	merchandisePrice;           			//--商品金額
		private int	merchandiseQuantity;					//--商品庫存
		private String merchandiseStatus;					//--商品狀態
		
		@Override
		public String toString() {
			return "merchandiseBean [merchandiseId=" + merchandiseId + ", merchandiseName=" + merchandiseName
					+ ", merchandiseContent=" + merchandiseContent + ", merchandisePicture=" + merchandisePicture
					+ ", merchandiseTag=" + merchandiseTag + ", merchandisePrice=" + merchandisePrice
					+ ", merchandiseQuantity=" + merchandiseQuantity + ", merchandiseStatus=" + merchandiseStatus + "]";
		}
		public int getMerchandiseId() {
			return merchandiseId;
		}
		public void setMerchandiseId(int merchandiseId) {
			this.merchandiseId = merchandiseId;
		}
		public String getMerchandiseName() {
			return merchandiseName;
		}
		public void setMerchandiseName(String merchandiseName) {
			this.merchandiseName = merchandiseName;
		}
		public String getMerchandiseContent() {
			return merchandiseContent;
		}
		public void setMerchandiseContent(String merchandiseContent) {
			this.merchandiseContent = merchandiseContent;
		}
		public String getMerchandisePicture() {
			return merchandisePicture;
		}
		public void setMerchandisePicture(String merchandisePicture) {
			this.merchandisePicture = merchandisePicture;
		}
		public String getMerchandiseTag() {
			return merchandiseTag;
		}
		public void setMerchandiseTag(String merchandiseTag) {
			this.merchandiseTag = merchandiseTag;
		}
		public int getMerchandisePrice() {
			return merchandisePrice;
		}
		public void setMerchandisePrice(int merchandisePrice) {
			this.merchandisePrice = merchandisePrice;
		}
		public int getMerchandiseQuantity() {
			return merchandiseQuantity;
		}
		public void setMerchandiseQuantity(int merchandiseQuantity) {
			this.merchandiseQuantity = merchandiseQuantity;
		}
		public String getMerchandiseStatus() {
			return merchandiseStatus;
		}
		public void setMerchandiseStatus(String merchandiseStatus) {
			this.merchandiseStatus = merchandiseStatus;
		}

}
