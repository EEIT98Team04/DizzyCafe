package minghui.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import minghui.model.dao.ManagerDAO;
import minghui.utils.Encryption;

@Service
public class ManagerLoginService {
	@Autowired
	private ManagerDAO managerDAO;
	
	@Transactional(readOnly = true)
	public ManagerBean login(String managerAccount, String managerPassword) {
		if(managerAccount != null && !managerAccount.trim().isEmpty()) {
			ManagerBean bean = managerDAO.select(managerAccount);
			if(bean != null) {
				if(bean.getManagerPassword().equals(Encryption.md5(managerPassword))) {
					return bean;
				}
			}
		}
		return null;
	}
}
