package library.domain;

import java.io.Serializable;

public class BookTypeBean implements Serializable {
	private String btid;
	private String type;

	public String getBtid() {
		return btid;
	}

	public void setBtid(String btid) {
		this.btid = btid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}


	public BookTypeBean(String btid2, String typename) {
		this.btid = btid2;
		this.type = typename;
	}

	public BookTypeBean() {
	}
}
