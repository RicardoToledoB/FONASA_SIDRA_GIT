package com.model;

import com.Fonasa.Fonasa;
import com.google.gson.Gson;
import com.ws.CertificadorPrevisionalSoap;
import com.ws.QueryCertificadorPrevisionalTO;
import com.ws.QueryTO;
import com.ws.ReplyCertificadorPrevisionalTO;
import com.ws.SONDACertificadoPrevisional;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class ServletFonasa extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            SONDACertificadoPrevisional service = new SONDACertificadoPrevisional();
            CertificadorPrevisionalSoap port=service.getCertificadorPrevisionalSoap();
            QueryCertificadorPrevisionalTO query=new QueryCertificadorPrevisionalTO();
            QueryTO qto = new QueryTO();
            qto.setTipoEmisor(0);
            qto.setTipoUsuario(0);
            query.setQueryTO(qto);
            query.setClaveEntidad(6160);
            query.setEntidad(61607900);
            query.setRutBeneficiario(15905884);
            query.setDgvBeneficiario("0");
            query.setCanal(0);
            ReplyCertificadorPrevisionalTO result = port.getCertificadoPrevisional(query);
            ArrayList<Fonasa> fonasa=new ArrayList<Fonasa>();
            fonasa.add(new Fonasa(result.getBeneficiarioTO().getNombres()));
            String json=null;
            json=new Gson().toJson(fonasa);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json); 
       }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
