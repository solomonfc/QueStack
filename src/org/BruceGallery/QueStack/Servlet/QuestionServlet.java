package org.BruceGallery.QueStack.Servlet;

import org.BruceGallery.QueStack.Controller.Question;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QuestionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String para = req.getParameter("bad");
        //resp.getWriter().println(para);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

//        Question qstnCtrl = new Question();
//
//        try {
//
//            qstnCtrl.keywordSearch("", "", "", "", "", "", "", "", 1, 50);
//        } catch (SQLException e) {
//
//            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
//        }
//        resp.getWriter().println(qstnCtrl.getPubParams().getOI_FLAG());


        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();

        String jsonObject = "{ \"text\": \"1000\"} ";
        out.print(jsonObject);
        out.flush();
    }

}
