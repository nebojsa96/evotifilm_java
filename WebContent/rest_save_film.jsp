
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="evotifilm.JPA.entity.Film"%>
<%@page import="evotifilm.JPA.entity.Zanr"%>
<%@page import="evotifilm.JPA.repository.FilmRepository"%>
<%@page import="evotifilm.JPA.repository.ZanrRepository"%>

<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>


<%@ include file="func_auth_guard.jsp" %>  
	
<%! 
	List<Zanr> zList;
	Film film;
	List<FileItem> imageParts;
%>
	
<%
	
	
	if(ServletFileUpload.isMultipartContent(request)){
        try {
        	film = new Film();
        	zList = ZanrRepository.findAll();
            List <FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            for(FileItem item : multiparts){
                if(!item.isFormField()){
                	if(imageParts==null)
                		imageParts = new ArrayList<FileItem>();
                	imageParts.add(item);
                	
                } else {
                	String fieldName = item.getFieldName();
                	if(fieldName.equals("id"))
                		film.setId(Integer.parseInt(item.getString()));
                	if(fieldName.equals("naziv"))
                		film.setNaziv(item.getString());
                	if(fieldName.equals("godina"))
                		film.setGodina(Integer.parseInt(item.getString()));
                	if(fieldName.equals("zanroviIds")){
                		int zId = Integer.parseInt(item.getString());
                		for(Zanr z : zList){
                			if(zId == z.getId()) {
                				film.appendZanr(z);
                			}
                		}
                	}
                	if(fieldName.equals("trajanje"))
                		film.setTrajanje(item.getString());
                	if(fieldName.equals("ocena"))
                		film.setOcena(Integer.parseInt(item.getString()));
                	if(fieldName.equals("ocenaImdb"))
                		film.setOcenaImdb(Float.parseFloat(item.getString()));
                	if(fieldName.equals("imdb"))
                		film.setImdb(item.getString());
                	if(fieldName.equals("kratakOpis"))
                		film.setKratakOpis(item.getString());
                	if(fieldName.equals("opis"))
                		film.setOpis(item.getString());
                	if(fieldName.equals("zakljucak"))
                		film.setZakljucak(item.getString());
                		
                }
            }
           
        } catch (Exception ex) {
           session.setAttribute("msg_error", "Film nije uspešno sačuvan" + ex);
        }         		
    }else{

        request.setAttribute("msg_error","Film nije uspešno sačuvan");
	}
 
	
	FilmRepository.save(film);
	if(film!=null){
		for(FileItem item : imageParts) {
			File file =  new File(item.getName());
            String name = file.getName();
            String ext = FilenameUtils.getExtension(item.getName());
            item.write( new File(getServletContext().getInitParameter("upload.location") + File.separator + film.getId() + "." + ext));
		}
		session.setAttribute("msg_success", "Film je uspešno kreiran");
	}
	response.sendRedirect("page_film_detalji.jsp?id="+film.getId());
%>