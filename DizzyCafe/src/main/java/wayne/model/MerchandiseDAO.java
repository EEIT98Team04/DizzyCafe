package wayne.model;

import java.sql.Blob;
import java.util.List;

public interface MerchandiseDAO {


	public MerchandiseBean select(int merchandiseId) ;


	public List<MerchandiseBean> select() ;

	public MerchandiseBean insert(MerchandiseBean bean) ;

	public MerchandiseBean update(String merchandiseName, String merchandiseContent, Blob merchandisePicture, String merchandiseTag,
			int merchandisePrice, int merchandiseQuantity, String merchandiseStatus, int merchandiseId);

	public boolean delete(int merchandiseId) ;
}