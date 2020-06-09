package library.domain;

import java.io.Serializable;

public class BookShelvesBean implements Serializable {
    private String ISBN;
    private String shelves;

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getShelves() {
        return shelves;
    }

    public void setShelves(String shelves) {
        this.shelves = shelves;
    }
}
