package org.BruceGallery.QueStack.Model;

/**
 * Created with IntelliJ IDEA.
 * User: Bruce
 * Date: 7/2/13
 * Time: 11:26 PM
 * To change this template use File | Settings | File Templates.
 */
public class PublicParam {

    private String OS_ERRCODE;
    private String OS_MSG;
    private int OI_TOTALNUM;


    public int getOI_FLAG() {
        return OI_FLAG;
    }

    public void setOI_FLAG(int OI_FLAG) {
        this.OI_FLAG = OI_FLAG;
    }

    private int OI_FLAG;

    public int getOI_TOTALNUM() {
        return OI_TOTALNUM;
    }

    public void setOI_TOTALNUM(int OI_TOTALNUM) {
        this.OI_TOTALNUM = OI_TOTALNUM;
    }

    public String getOS_MSG() {

        return OS_MSG;
    }

    public void setOS_MSG(String OS_MSG) {
        this.OS_MSG = OS_MSG;
    }

    public String getOS_ERRCODE() {

        return OS_ERRCODE;
    }

    public void setOS_ERRCODE(String OS_ERRCODE) {
        this.OS_ERRCODE = OS_ERRCODE;
    }
}
