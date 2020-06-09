
package library.domain;

import java.io.Serializable;
import java.util.Date;


public class UserInfoBean implements Serializable {
	private String uname;
	private Integer uage;
	private String uidCard;
	private String utel;
	private String userId;
	private Date startTime;
	private String upsw;

	public UserInfoBean() {
		super();
	}

	public UserInfoBean(String uname, Integer uage, String uidCard,
						String utel, String userId, Date startTime, String upsw) {
		this.uname = uname;
		this.uage = uage;
		this.uidCard = uidCard;
		this.utel = utel;
		this.userId = userId;
		this.startTime=startTime;
		this.upsw = upsw;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public Integer getUage() {
		return uage;
	}

	public void setUage(Integer uage) {
		this.uage = uage;
	}

	public String getUidCard() {
		return uidCard;
	}

	public void setUidCard(String uidCard) {
		this.uidCard = uidCard;
	}

	public String getUtel() {
		return utel;
	}

	public void setUtel(String utel) {
		this.utel = utel;
	}

	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getUpsw() {
		return upsw;
	}

	public void setUpsw(String upsw) {
		this.upsw = upsw;
	}

	@Override
	public String toString() {
		return "UserInfoBean{" +
				"uname='" + uname + '\'' +
				", uage=" + uage +
				", uidCard='" + uidCard + '\'' +
				", utel='" + utel + '\'' +
				", userId='" + userId + '\'' +
				", startTime=" + startTime +
				", upsw='" + upsw + '\'' +
				'}';
	}
}