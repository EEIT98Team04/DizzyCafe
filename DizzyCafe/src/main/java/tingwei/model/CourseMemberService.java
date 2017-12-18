package tingwei.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CourseMemberService {
	
	@Autowired
	private CourseMemberDAO courseMemberDAO;
	
	public int[] countNowPeople(int courseIdStart, int courseIdEnd, int rows_perPage) {
		return courseMemberDAO.countNowPeople(courseIdStart, courseIdEnd,rows_perPage);
	}
}
