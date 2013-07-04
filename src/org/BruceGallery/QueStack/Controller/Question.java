package org.BruceGallery.QueStack.Controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.OracleTypes;
import org.BruceGallery.QueStack.ConnectionSource;

public class Question {

    public static void main (String [] args) throws SQLException {
        Question qstnCtrl = new Question();
        qstnCtrl.keywordSearch("", "", "", "", "", "", "", "", 1, 50);
    }

	public static String keywordSearch(
            String keyword,
            String ctlg,
            String subctlg,
            String start_date,
            String end_date,
            String user_id,
            String is_owner,
            String full_text,
            int begin_pos,
            int fetch_num
    ) throws SQLException{

        String querySQL = "{call PCKG_QAHUB_QSTN_ANS.PROC_QSTN_QRY_KWD(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";

		Connection conn = null;
		CallableStatement stmt = null;
		ResultSet questionRS = null;

        String resultJSON="";

		try {
			conn = ConnectionSource.getConnection();
            stmt = conn.prepareCall(querySQL);

            //set input params
			stmt.setString(1, keyword);
			stmt.setString(2, ctlg);
			stmt.setString(3, subctlg);
			stmt.setString(4, start_date);
			stmt.setString(5, end_date);
			stmt.setString(6, user_id);
			stmt.setString(7, is_owner);
			stmt.setString(8, full_text);
			stmt.setInt(9, begin_pos);
			stmt.setInt(10, fetch_num);

            //define output type
            stmt.registerOutParameter(11, java.sql.Types.INTEGER);
            stmt.registerOutParameter(12, java.sql.Types.VARCHAR);
            stmt.registerOutParameter(13, java.sql.Types.VARCHAR);
            stmt.registerOutParameter(14, java.sql.Types.INTEGER);
            stmt.registerOutParameter(15, OracleTypes.CURSOR);

            //execute
            stmt.executeUpdate();

            StringBuffer sb = new StringBuffer();

            sb.append("{\"OI_FLAG\":\"" +        stmt.getInt(11)+"\",\r\n");
            sb.append("\"OS_ERRCODE\":\"" +     stmt.getString(12)+"\",\r\n");
            sb.append("\"OS_MSG\":\"" +         stmt.getString(13)+"\",\r\n");
            sb.append("\"OI_TOTALNUM\":\"" +    stmt.getInt(14)+"\",\r\n");


            questionRS = (ResultSet) stmt.getObject(15);

            if(questionRS!=null){
                sb.append("\"QSTN\":[\r\n");

                if(questionRS.next()){
                    sb.append("{\"QSTN_ID\":\""+questionRS.getString("QSTN_ID")+"\",");
                    sb.append("\"CTLG_NAME\":\""+questionRS.getString("CTLG_NAME")+"\",");
                    sb.append("\"SUBCTLG_NAME\":\""+questionRS.getString("SUBCTLG_NAME")+"\",");
                    sb.append("\"USER_ID\":\""+questionRS.getString("USER_ID")+"\",");
                    sb.append("\"TITLE\":\""+questionRS.getString("TITLE")+"\",");
                    sb.append("\"STATUS\":\""+questionRS.getString("STATUS")+"\",");
                    sb.append("\"REPLY_NO\":\""+questionRS.getString("REPLY_NO")+"\",");
                    sb.append("\"ENT_DT\":\""+questionRS.getString("ENT_DT")+"\",");
                    sb.append("\"UPD_DT\":\"" + questionRS.getString("UPD_DT") + "\"}");
                }

                while (questionRS.next()) {
                    sb.append(",\r\n{\"QSTN_ID\":\""+questionRS.getString("QSTN_ID")+"\",");
                    sb.append("\"CTLG_NAME\":\""+questionRS.getString("CTLG_NAME")+"\",");
                    sb.append("\"SUBCTLG_NAME\":\""+questionRS.getString("SUBCTLG_NAME")+"\",");
                    sb.append("\"USER_ID\":\""+questionRS.getString("USER_ID")+"\",");
                    sb.append("\"TITLE\":\""+questionRS.getString("TITLE")+"\",");
                    sb.append("\"STATUS\":\""+questionRS.getString("STATUS")+"\",");
                    sb.append("\"REPLY_NO\":\""+questionRS.getString("REPLY_NO")+"\",");
                    sb.append("\"ENT_DT\":\""+questionRS.getString("ENT_DT")+"\",");
                    sb.append("\"UPD_DT\":\"" + questionRS.getString("UPD_DT") + "\"}");
                }
            }

            sb.append("\r\n]\r\n}");

            resultJSON = sb.toString();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (questionRS != null) {questionRS.close();}
			if (stmt != null) {stmt.close();}
			if (conn != null) {conn.close();}
		}
        return resultJSON;
    }

}
