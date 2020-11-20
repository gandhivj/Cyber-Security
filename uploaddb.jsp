<%@page import="org.apache.poi.xwpf.extractor.XWPFWordExtractor"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="org.apache.poi.xwpf.usermodel.XWPFDocument"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%String uid=(String)session.getAttribute("id"); %>
<%

		String a=null,c=null,d=null,f1=null,image=null,size33=null,ss=null,fPath=null,fid=null,myimagename=null,fname=null,file_key=null;
		/* Statement st = null; */
		ResultSet rs1=null;
		int iid=0,score=0;
		int ch,id1=0;
		
		FileInputStream fs=null;
		FileInputStream fileInputStream = null;
		XWPFDocument document=null;
		int m=0;
		
			
			/* session.setAttribute("fid",m); */
			
				ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		//String dirName =context.getRealPath("\\Gallery");
                	
                String dirName =context.getRealPath("/Gallery");
                   System.out.println("Dir Name 0 : " + dirName);
		String paramname=null;
		String file=null;

		java.util.Date now = new java.util.Date();
	 String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
     StringBuffer strContent = new StringBuffer("");
		File file1 = null;
		File fileToBeRead=null;	
	
		try {
                   
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				
				paramname = (String) params.nextElement();
				
				if(paramname.equalsIgnoreCase("fileid"))
				{
					fid=multi.getParameter(paramname);
				}
				
				if(paramname.equalsIgnoreCase("fname"))
				{
					d=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("keyword_index"))
				{
					c=multi.getParameter(paramname);
				}
				/* if(paramname.equalsIgnoreCase("url"))
				{
					f1=multi.getParameter(paramname);
				} */
				if(paramname.equalsIgnoreCase("file_key"))
				{
					file_key=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("image"))
				{
					image=multi.getParameter(paramname);
				}
				
				}
					
			int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			f = 1;
			image = multi.getFilesystemName(paramname);
			 fPath = context.getRealPath("/Gallery/"+image);
                       // fPath = context.getRealPath("Gallery/"+image);
			System.out.println("fpath=========="+fPath);
			file1 = new File(fPath);
			double size11=file1.length();
			double  size12=size11/1024;
			double size22=Math.round(size12*100.0)/100.0;
			size33=Double.toString(size22);
			myimagename=file1.getName();
			fname = FilenameUtils.removeExtension(myimagename);
			fs = new FileInputStream(file1);
                        System.out.println("fs.available()"+fs.available());
			/*   */
			list.add(fs);
			/* while ((ch = fs.read()) != -1)
			    strContent.append((char) ch); */
			
			   
		}		
	}
	        /* FileInputStream fs1 = null; */
            //name=dirName+"\\Gallery\\"+image;
			 fileToBeRead = new File(fPath);
                         System.out.println("upload1");
	fileInputStream = new FileInputStream(fileToBeRead);
         System.out.println("fileInputStream " + fileInputStream.available());
          try
         {
	document = new XWPFDocument(fileInputStream);
         System.out.println("upload3");
        
	XWPFWordExtractor extractor = new XWPFWordExtractor(document);
         System.out.println("upload4");
      ss=extractor.getText();
         }
         catch(Exception e1)
         {
               System.out.println("Errors : " + e1.getMessage());
         }
			
	  System.out.println("upload5");
			
			
			Connection con1=Databasecon.getconnection();
                          System.out.println("connection 1");

			//	PreparedStatement ps=con1.prepareStatement("insert into upload(uid,fid,file_name,keyword_index,file,ff,file_size,score,date,fpath,enc_index,enc_content,file_key)"
                        //     + " values(?,?,?,?,?,?,?,?,?,?,AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'),?)");

			
                        	PreparedStatement ps=con1.prepareStatement("insert into upload(uid,fid,file_name,keyword_index,file,ff,file_size,score,date,fpath,enc_index,enc_content,file_key)"
                             + " values(?,?,?,?,?,?,?,?,?,?,?,?,?)");

                        
                         
                       /* System.out.println("f : " + f);
                        System.out.println("uid : " + uid);
                        System.out.println("fid : " + fid);
                        System.out.println("file_name : " + d);
                        System.out.println("keyword_index : " + c);
                        System.out.println("file : " + image);    
                        
                        System.out.println("ff : " + ss);
                        System.out.println("file_size : " + size33);
                          System.out.println("score : " + score);
                        System.out.println("date : " + strDateNew);
                        System.out.println("fpath : " + fPath);
                        System.out.println("enc_index : " + c);    
                        
                        
                        System.out.println("enc_content : " + ss);
                        System.out.println("file_key : " + file_key);*/
                  
                        
                                ps.setString(1,uid);
                        	ps.setString(2,fid);
				ps.setString(3,d);
				ps.setString(4,c);	
                        	ps.setString(5,image);
                                ps.setString(6,ss);
				ps.setString(7,size33);
				ps.setInt(8,score);
				ps.setString(9,strDateNew);
				ps.setString(10,fPath);
				ps.setString(11,c);
				ps.setString(12,ss);
				ps.setString(13,file_key);

                                
                                       System.out.println("connection 2");
       if(f == 0)
               	ps.setObject(5,null);
		else if(f == 1)
		{
			fs = (FileInputStream)list.get(0);
                         //  System.out.println("fs.available()"+fs.available());
			//ps.setBinaryStream(5,fs,fs.available()); 
		}	
       System.out.println("connection 3");
       int x;
                        try
                        {
			 x=ps.executeUpdate();
                               System.out.println("connection 4");
                               
			if(x!=0)
			{%>
			<script>
			alert("File Uploaded Successfully");
			window.location="upload.jsp";
				</script>
			<% }
			else
			{
				%>
				<script>
				alert("File Upload Error");
				window.location="upload.jsp";
					</script>
		<% 	}
                }
                catch(SQLException e1)
                {
                    out.println("SQLException :" + e1.getMessage());
                }
				
		} 
                
		catch (Exception e) 
		{
                        out.println("Error Message : "+e.getStackTrace().toString());
			out.println("Error Message : "+e.getMessage());
                        
		}
			
			
 %>

	
 
