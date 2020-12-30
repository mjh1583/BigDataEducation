package kr.gov.httpservlet2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Calc")
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static float USD_RATE =  1100.91f;  //달러
	private static float JPY_RATE =  1000.62f;    //엔화
	private static float CNY_RATE =  168.59f;   //위안
	private static float GBP_RATE =  1493.58f;  //파운드
	private static float EUR_RATE =  1343.59f;  //유로
	
    public CalcServlet() {
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter writer = response.getWriter();
		
		writer.println("<html><title>환율계산기</title>");
		writer.println("<font size=5>환율 계산기</font><br/>");
		writer.println("<form name='frmCalc' method='get' action='Calc'>");
		writer.println("원화 : <input type='text' name='won' size='10' />");
		writer.println("<select name='operator'>");
		writer.println("<option value='dollar'>달러</option>");
		writer.println("<option value='en'>엔화</option>");
		writer.println("<option value='wian'>위안</option>");
		writer.println("<option value='pound'>파운드</option>");
		writer.println("<option value='euro'>유로</option>");
		writer.println("</select>");
		
		writer.println("<input type='hidden' name='command' value='calculate' />");
		writer.println("<input type='submit' value='변환' />");
		writer.println("</form>");
		writer.println("</html>");
		
		String command = request.getParameter("command");
		String won = request.getParameter("won");
		String operator = request.getParameter("operator");
		
		//환율 계산결과 출력
		if(command != null && command.equals("calculate")) {
			String result = calculate(Float.parseFloat(won), operator);
			
			writer.println("<html><font size=10>변환결과</font><br/>");
			writer.println("<font size=10>" + result + "</font><br/>");
			writer.println("<a href='Calc'>환율 계산기</a>");
			writer.println("</html>");
			
			return;
		}
		
		writer.close();
	}
	
	//환율 계산하는 메서드
	private static String calculate(float won, String operator){
		String result = "";
		
		if(operator.equals("dollar")) {
			result = String.format("%.6f", won / USD_RATE);
		}
		else if(operator.equals("en")) {
			result = String.format("%.6f", won / JPY_RATE);
		}
		else if(operator.equals("wian")) {
			result = String.format("%.6f", won / CNY_RATE);
		}
		else if(operator.equals("pound")) {
			result = String.format("%.6f", won / GBP_RATE);
		}
		else if(operator.equals("euro")) {
			result = String.format("%.6f", won / EUR_RATE);
		}
		
		return result;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
