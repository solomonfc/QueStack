package org.BruceGallery.QueStack;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import java.sql.SQLException;
import java.util.*;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created with IntelliJ IDEA.
 * User: Bruce
 * Date: 7/3/13
 * Time: 12:56 AM
 * To change this template use File | Settings | File Templates.
 */
public class Utility {

    //publc static Utility(){};

    public static List convertList(ResultSet rs) throws SQLException {

        List list = new ArrayList();

        ResultSetMetaData md = rs.getMetaData();

        int columnCount = md.getColumnCount(); //Map rowData;

        while (rs.next()) { //rowData = new HashMap(columnCount);

            Map rowData = new HashMap();

            for (int i = 1; i <= columnCount; i++) {
                rowData.put(md.getColumnName(i), rs.getObject(i));
            }
            list.add(rowData);

        } return list;

    }

    public static List extractData(ResultSet rs) throws SQLException {
        ResultSetMetaData md = rs.getMetaData();

        int num = md.getColumnCount();

        List listOfRows = new ArrayList();

        while (rs.next()) {
            Map mapOfColValues = new HashMap(num);
            for (int i = 1; i <= num; i++) {
                mapOfColValues.put(md.getColumnName(i), rs.getObject(i));
            }
            listOfRows.add(mapOfColValues);
        }
        return listOfRows;
    }

    public static JSONArray extractJSONArray(ResultSet rs) throws SQLException {
        ResultSetMetaData md = rs.getMetaData();
        int num = md.getColumnCount();
        JSONArray array = new JSONArray();
        while (rs.next()) {
            JSONObject mapOfColValues = new JSONObject();
            for (int i = 1; i <= num; i++) {
                mapOfColValues.put(md.getColumnName(i), rs.getObject(i));
            }
            array.add(mapOfColValues);
        }
        return array;
    }

}
