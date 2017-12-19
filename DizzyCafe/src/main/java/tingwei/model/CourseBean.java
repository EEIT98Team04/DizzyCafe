package tingwei.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="COURSE")
public class CourseBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int courseId;
	private String courseName;
	private String courseImg;
	private String courseIntro;
	private String courseContent;
	private int courseCost;
	private String courseTeacher;
	private java.sql.Date courseBegin;
	private java.sql.Date courseEnd;
	private java.sql.Date courseSignupBegin;
	private java.sql.Date courseSignupEnd;
	private int courseLimit;
	
	public int getCourseLimit() {
		return courseLimit;
	}
	public void setCourseLimit(int courseLimit) {
		this.courseLimit = courseLimit;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseImg() {
		return courseImg;
	}
	public void setCourseImg(String courseImg) {
		this.courseImg = courseImg;
	}
	public String getCourseIntro() {
		return courseIntro;
	}
	public void setCourseIntro(String courseIntro) {
		this.courseIntro = courseIntro;
	}
	public String getCourseContent() {
		return courseContent;
	}
	public void setCourseContent(String courseContent) {
		this.courseContent = courseContent;
	}
	public int getCourseCost() {
		return courseCost;
	}
	public void setCourseCost(int courseCost) {
		this.courseCost = courseCost;
	}
	public String getCourseTeacher() {
		return courseTeacher;
	}
	public void setCourseTeacher(String courseTeacher) {
		this.courseTeacher = courseTeacher;
	}
	public java.sql.Date getCourseBegin() {
		return courseBegin;
	}
	public void setCourseBegin(java.sql.Date courseBegin) {
		this.courseBegin = courseBegin;
	}
	public java.sql.Date getCourseEnd() {
		return courseEnd;
	}
	public void setCourseEnd(java.sql.Date courseEnd) {
		this.courseEnd = courseEnd;
	}
	public java.sql.Date getCourseSignupBegin() {
		return courseSignupBegin;
	}
	public void setCourseSignupBegin(java.sql.Date courseSignupBegin) {
		this.courseSignupBegin = courseSignupBegin;
	}
	public java.sql.Date getCourseSignupEnd() {
		return courseSignupEnd;
	}
	public void setCourseSignupEnd(java.sql.Date courseSignupEnd) {
		this.courseSignupEnd = courseSignupEnd;
	}
	@Override
	public String toString() {
		return "CourseBean [courseId=" + courseId + ", courseName=" + courseName + ", courseImg=" + courseImg
				+ ", courseIntro=" + courseIntro + ", courseContent=" + courseContent + ", courseCost=" + courseCost
				+ ", courseTeacher=" + courseTeacher + ", courseBegin=" + courseBegin + ", courseEnd=" + courseEnd
				+ ", courseSignupBegin=" + courseSignupBegin + ", courseSignupEnd=" + courseSignupEnd + ", courseLimit="
				+ courseLimit + "]";
	}

}

