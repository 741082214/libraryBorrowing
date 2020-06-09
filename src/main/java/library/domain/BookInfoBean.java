
package library.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 图书信息JavaBean
 */
public class BookInfoBean implements Serializable {
	/**
	 * 图书编号
	 */
	private String ISBN;
	/**
	 * 图书类别
	 */
	private String typeId;
	/**
	 * 图书名称
	 */
	private String bookname;
	/**
	 * 作者
	 */
	private String writer;
	/**
	 * 出版商
	 */
	private String publisher;
	/**
	 * 出版日期
	 */
	private Date date;
	/**
	 * 图书价格
	 */
	private BigDecimal price;
	/**
	 * 上架情况
	 */
	private String shelves;

	public BookInfoBean() {
		super();
	}

	public BookInfoBean(String ISBN, String typeId, String bookname,
			String writer, String publisher, Date date,
		   BigDecimal price,String shelves) {
		super();
		this.ISBN = ISBN;
		this.typeId = typeId;
		this.bookname = bookname;
		this.writer = writer;
		this.publisher = publisher;
		this.date = date;
		this.price = price;
		this.shelves=shelves;
	}

	/**
	 * @return iSBN
	 */
	public String getISBN() {
		return ISBN;
	}

	/**
	 * @param iSBN
	 *            要设置的 iSBN
	 */
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	/**
	 * @return typeId
	 */
	public String getTypeId() {
		return typeId;
	}

	/**
	 * @param typeId
	 *            要设置的 typeId
	 */
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	/**
	 * @return bookname
	 */
	public String getBookname() {
		return bookname;
	}

	/**
	 * @param bookname
	 *            要设置的 bookname
	 */
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	/**
	 * @return writer
	 */
	public String getWriter() {
		return writer;
	}

	/**
	 * @param writer
	 *            要设置的 writer
	 */
	public void setWriter(String writer) {
		this.writer = writer;
	}

	/**
	 * @return publisher
	 */
	public String getPublisher() {
		return publisher;
	}

	/**
	 * @param publisher
	 *            要设置的 publisher
	 */
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	/**
	 * @return date
	 */
	public Date getDate() {
		return date;
	}

	/**
	 * @param date
	 *            要设置的 date
	 */
	public void setDate(Date date) {
		this.date = date;
	}

	/**
	 * @return price
	 */
	public BigDecimal getPrice() {
		return price;
	}

	/**
	 * @param price
	 *            要设置的 price
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}


	public String getShelves() {
		return shelves;
	}
	public void setShelves(String shelves) {
		this.shelves = shelves;
	}

}