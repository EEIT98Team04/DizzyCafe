package tingwei.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="courseDateTime")
public class CourseDateTimeBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int num;
	private int courseId;
	private java.sql.Timestamp courseDateTime;
	private int courseLength;
	@Override
	public String toString() {
		return "CourseDateTimeBean [num=" + num + ", courseId=" + courseId + ", courseDateTime=" + courseDateTime
				+ ", courseLength=" + courseLength + "]";
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
	public java.sql.Timestamp getCourseDateTime() {
		return courseDateTime;
	}
	public void setCourseDateTime(java.sql.Timestamp courseDateTime) {
		this.courseDateTime = courseDateTime;
	}
	public int getCourseLength() {
		return courseLength;
	}
	public void setCourseLength(int courseLength) {
		this.courseLength = courseLength;
	}
}
