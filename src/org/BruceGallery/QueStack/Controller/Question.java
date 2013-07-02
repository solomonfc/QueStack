package org.BruceGallery.QueStack.Controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.OracleTypes;
import org.BruceGallery.QueStack.ConnectionSource;
import org.BruceGallery.QueStack.Model.PublicParam;

/**
 * Created with IntelliJ IDEA.
 * User: Bruce
 * Date: 7/2/13
 * Time: 10:56 PM
 * To change this template use File | Settings | File Templates.
 */
public class Question {

    private PublicParam pubParams;

    public static void main (String [] args) throws SQLException {
        Question qstnCtrl = new Question();
        qstnCtrl.keywordSearch("", "", "", "", "", "", "", "", 1, 50);
    }

	public void keywordSearch(
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
        pubParams = new PublicParam();

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

            pubParams.setOI_FLAG(stmt.getInt(11));
            pubParams.setOS_ERRCODE(stmt.getString(12));
            pubParams.setOS_MSG(stmt.getString(13));
            pubParams.setOI_TOTALNUM(stmt.getInt(14));

            questionRS = (ResultSet) stmt.getObject(15);


            System.out.println(pubParams.getOI_FLAG());

			while (questionRS.next()) {
                System.out.println("QSTN_ID : " + questionRS.getString("QSTN_ID"));
//                System.out.println("CTLG_NAME : " + questionRS.getString("CTLG_NAME"));
//                System.out.println("SUBCTLG_NAME : " + questionRS.getString("SUBCTLG_NAME"));
//                System.out.println("USER_ID : " + questionRS.getString("USER_ID"));
//                System.out.println("TITLE : " + questionRS.getString("TITLE"));
//                System.out.println("STATUS : " + questionRS.getString("STATUS"));
//                System.out.println("REPLY_NO : " + questionRS.getString("REPLY_NO"));
//                System.out.println("REPLY_NO : " + questionRS.getString("ENT_DT"));
//                System.out.println("REPLY_NO : " + questionRS.getString("UPD_DT"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (questionRS != null) {questionRS.close();}
			if (stmt != null) {stmt.close();}
			if (conn != null) {conn.close();}
		}
	}

    public PublicParam getPubParams() {
        return pubParams;
    }
}
