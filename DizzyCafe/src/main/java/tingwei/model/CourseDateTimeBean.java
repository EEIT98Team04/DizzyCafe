package tingwei.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="courseDateTime")
public class CourseDateTimeBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int num;
	private int courseId;
	private java.sql.Timestamp courseStartTime;
	private java.sql.Timestamp courseEndTime;
	
	@Override
	public String toString() {
		return "CourseDateTimeBean [num=" + num + ", courseId=" + courseId + ", courseStartTime=" + courseStartTime
				+ ", courseEndTime=" + courseEndTime + "]";

	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public java.sql.Timestamp getCourseStartTime() {
		return courseStartTime;
	}
	public void setCourseStartTime(java.sql.Timestamp courseStartTime) {
		this.courseStartTime = courseStartTime;
	}
	public java.sql.Timestamp getCourseEndTime() {
		return courseEndTime;
	}
	public void setCourseEndTime(java.sql.Timestamp courseEndTime) {
		this.courseEndTime = courseEndTime;
	}

}
