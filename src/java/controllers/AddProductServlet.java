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
import model.Product;
import model.dao.ProductDAO;
import model.Account;

@WebServlet(name = "AddProductServlet", urlPatterns = {"/AddProductServlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AddProductServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "images/sanPham";

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

            String productImage = "";
            Part filePart = request.getParameter("productImage") != null ? request.getPart("productImage") : null;
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
            ProductDAO dao = new ProductDAO();
            dao.insertRec(product);

            response.sendRedirect("products-manage.jsp");
        } catch (NumberFormatException e) {
            response.sendRedirect("add-product.jsp?error=2&msg=Giá trị số lỗi!");
        } catch (IOException e) {
            response.sendRedirect("add-product.jsp?error=3&msg=" + e.getMessage());
        } catch (Exception e) {
            response.sendRedirect("add-product.jsp?error=1");
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

    @Override
    public String getServletInfo() {
        return "Add Product Servlet";
    }
}
