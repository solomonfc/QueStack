package org.BruceGallery.QueStack.Servlet;

import org.BruceGallery.QueStack.Controller.Question;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class KeywordSearch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();
        String jsonObject = "";

        try {
            jsonObject = Question.keywordSearch("", "", "", "", "", "", "", "", 1, 50);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println(jsonObject);

        out.print(jsonObject);
        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String keyword = req.getParameter("keyword");

        System.out.println(keyword);

        System.out.println(req.getMethod());
        System.out.println(req.getAttributeNames());

        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();
        String jsonObject = "";

        try {
            jsonObject = Question.keywordSearch("", "", "", "", "", "", "", "", 1, 10);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println(jsonObject);

        out.print(jsonObject);
        out.flush();
    }

}
