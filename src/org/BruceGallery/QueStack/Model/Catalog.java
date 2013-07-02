package org.BruceGallery.QueStack.Model;

/**
 * Created with IntelliJ IDEA.
 * User: Bruce
 * Date: 7/3/13
 * Time: 12:26 AM
 * To change this template use File | Settings | File Templates.
 */
public class Catalog {

    String catalogId;
    String catalogName;

    public String getCatalogName() {
        return catalogName;
    }

    public void setCatalogName(String catalogName) {
        this.catalogName = catalogName;
    }

    public String getCatalogId() {

        return catalogId;
    }

    public void setCatalogId(String catalogId) {
        this.catalogId = catalogId;
    }
}
