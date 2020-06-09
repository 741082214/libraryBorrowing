
package library.domain;
import java.io.Serializable;

public class BorrowBean implements Serializable {
	private String borrowId;
	private String bookISBN;
	private String bookName;
	private String userId;
	private Integer isback;
	private String borrowDate;
	private String backDate;
	public BorrowBean() {
		super();
	}

	public BorrowBean(String bookISBN, String bookName,
							String userId, Integer isback, String borrowDate, String backDate) {
		super();
		this.bookISBN = bookISBN;
		this.bookName = bookName;
		this.userId = userId;
		this.isback = isback;
		this.borrowDate = borrowDate;
		this.backDate = backDate;
	}

	public String getBorrowId() {
		return borrowId;
	}

	public void setBorrowId(String borrowId) {
		this.borrowId = borrowId;
	}

	public String getBookISBN() {
		return bookISBN;
	}

	public void setBookISBN(String bookISBN) {
		this.bookISBN = bookISBN;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getIsback() {
		return isback;
	}

	public void setIsback(Integer isback) {
		this.isback = isback;
	}

	public String getBorrowDate() {
		return borrowDate;
	}

	public void setBorrowDate(String borrowDate) {
		this.borrowDate = borrowDate;
	}

	public String getBackDate() {
		return backDate;
	}

	public void setBackDate(String backDate) {
		this.backDate = backDate;
	}
}