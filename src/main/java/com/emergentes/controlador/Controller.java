
package com.emergentes.controlador;

import com.emergentes.modelo.GestorLibros;
import com.emergentes.modelo.Libro;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Libro objlibro = new Libro();
        int id;
        int pos;
        String opcion = request.getParameter("op");
        String op = (opcion != null) ? request.getParameter("op"):"view";
        
        if(op.equals("nuevo")){
            HttpSession ses = request.getSession();
            GestorLibros agenda = (GestorLibros) ses.getAttribute("agenda");
            objlibro.setId(agenda.obtieneId());
            request.setAttribute("op", op);
            request.setAttribute("misLibros", objlibro);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        
        if(op.equals("modificar")){
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            GestorLibros agenda = (GestorLibros) ses.getAttribute("agenda");
            pos = agenda.ubicarLibro(id);
            objlibro = agenda.getLista().get(pos);
            
            request.setAttribute("op", op);
            request.setAttribute("misLibros", objlibro);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        
        if(op.equals("eliminar")){
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            GestorLibros agenda = (GestorLibros) ses.getAttribute("agenda");
            pos = agenda.ubicarLibro(id);
            agenda.eliminarLibro(pos);
            ses.setAttribute("agenda", agenda);
            response.sendRedirect("index.jsp");
        }
        
        if(op.equals("view")){
            response.sendRedirect("index.jsp");
        }

    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Libro objlibro = new Libro();
        int pos;
        String op = request.getParameter("op");
        
        if(op.equals("grabar")){
            //Recuperar valores del formulario
            //Verificar si es nuevo o una modificacion
            objlibro.setId(Integer.parseInt(request.getParameter("id")));
            objlibro.setTitulo(request.getParameter("titulo"));
            objlibro.setAutor(request.getParameter("autor"));
            objlibro.setResumen(request.getParameter("resumen"));
            objlibro.setMedio(request.getParameter("medio"));
            
            HttpSession ses = request.getSession();
            GestorLibros agenda = (GestorLibros) ses.getAttribute("agenda");
            
            String opg = request.getParameter("opg");
            
            if(opg.equals("nuevo")){
                agenda.insertarLibro(objlibro);
            }
            else{
                pos = agenda.ubicarLibro(objlibro.getId());
                agenda.modificarLibro(pos, objlibro);
            }
            ses.setAttribute("agenda", agenda);
            response.sendRedirect("index.jsp");
        }

    }

}