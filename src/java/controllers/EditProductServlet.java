    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Date;
import model.Account;
import model.Product;
import model.dao.ProductDAO;

/**
 *
 * @author ThaiDuong
 */
@WebServlet(name = "EditProductServlet", urlPatterns = {"/EditProductServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class EditProductServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "images/sanPham";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            String productId = request.getParameter("productId");
            String productName = request.getParameter("productName");
            String brief = request.getParameter("brief");
            int typeId = Integer.parseInt(request.getParameter("typeId"));
            String unit = request.getParameter("unit");
            int price = Integer.parseInt(request.getParameter("price"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            String account = ((Account) request.getSession().getAttribute("user")).getAccount();

            ProductDAO dao = new ProductDAO();
            Product oldProduct = dao.getObjectById(productId);
            String productImage = oldProduct.getProductImage();

            Part filePart = request.getPart("productImage");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = extractFileName(filePart);
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists() && !uploadDir.mkdirs()) {
                    throw new IOException("Không tạo được thư mục: " + uploadPath);
                }
                if (!uploadDir.canWrite()) {
                    throw new IOException("Không có quyền ghi: " + uploadPath);
                }
                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath);
                productImage = "/" + UPLOAD_DIR + "/" + fileName;
            }

            Product product = new Product(productId, productName, productImage, brief, new Date(System.currentTimeMillis()),
                    typeId, account, unit, price, discount);
            dao.updateRec(product);

            response.sendRedirect("products-manage.jsp");
        } catch (NumberFormatException e) {
            response.sendRedirect("edit-product.jsp?error=2&msg=Giá trị số lỗi!");
        } catch (IOException e) {
            response.sendRedirect("edit-product.jsp?error=3&msg=" + e.getMessage());
        } catch (Exception e) {
            response.sendRedirect("edit-product.jsp?error=1");
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
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
