<%@ page contentType="image/jpeg" import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"%>
<%@ page import="java.io.OutputStream"%>

<%!Color getRandColor(int fc, int bc) {
		Random random = new Random();

		if (fc > 255)
			fc = 255;

		if (bc > 255)
			bc = 255;

		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	int width = 100, height = 25;
	BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	java.awt.Graphics g = image.getGraphics();

	Random random = new Random();

	g.setColor(getRandColor(220, 255));
	g.fillRect(0, 0, width, height);

	g.setFont(new Font("Times New Roman", Font.BOLD, 30));

	g.setColor(new Color(100, 100, 100));
	for (int i = 0; i < 10; i++) {
		int x = random.nextInt(width);
		int y = random.nextInt(height);
		int xl = random.nextInt(50);
		int yl = random.nextInt(50);
		g.drawLine(x,y,x+xl,y+yl);
	}

	String chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	String s = "";
	String string = "";
	int length = chars.length();

	for (int i = 0; i < 4; i++) {

		s = Character.toString(chars.charAt(random.nextInt(length)));
		string += s;
		g.setColor(getRandColor(0, 255));
		g.drawString(s, 24 * i + 5, 18);
		
	}
	// set pic value
	session.setAttribute("code", string);

	//commit the action
	g.dispose();

	// show
	OutputStream os = response.getOutputStream();
	ImageIO.write(image, "GIF", os);
	os.flush();
	os.close();
	os = null;
	response.flushBuffer();
	out.clear();
	out = pageContext.pushBody();
%>