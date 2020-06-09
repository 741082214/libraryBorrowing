package library.domain;

import java.io.Serializable;

public class ManageStockpile implements Serializable {
    private String ISBN;
    private String typeId;
    private String shelves;
    private String bookname;
    private int amount;
    private int allAccount;

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getShelves() {
        return shelves;
    }

    public void setShelves(String shelves) {
        this.shelves = shelves;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getAllAccount() {
        return allAccount;
    }

    public void setAllAccount(int all) {
        this.allAccount = all;
    }
}
