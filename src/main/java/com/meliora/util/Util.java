package com.meliora.util;

import com.meliora.common.$;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;

public class Util {

	public static boolean valid(String string) {
		if (string != null && !"".equals(string)) {
			return true;
		}
		return false;
	}

	public static boolean valid(Integer integer) {
		if (integer != null && integer > 0) {
			return true;
		}
		return false;
	}

	public static boolean valid(Object[] objects) {
		if (objects != null && objects.length > 0) {
			return true;
		}
		return false;
	}

	public static boolean valid(Collection<Object> collection) {
		if (collection != null && !collection.isEmpty()) {
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	public static boolean valid(Object object) {
		if (object != null) {
			if (object instanceof Object[]) {
				return valid((Object[]) object);
			} else if (object instanceof Collection<?>) {
				return valid((Collection<Object>) object);
			} else if (object instanceof String) {
				return valid((String) object);
			} else if (object instanceof Integer) {
				return valid((Integer) object);
			}
			return true;
		}
		return false;
	}

	public static <T> T getFirst(List<T> list) {
		if (valid(list)) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public static String idcardMask(String string) {
		if (string != null && string.length() > 10) {
			StringBuffer sb = new StringBuffer(string.substring(0, 6));
			for (int i = 0; i < string.length() - 10; i++) {
				sb.append("*");
			}
			sb.append(string.substring(string.length() - 4, string.length()));
			string = sb.toString();
		}
		return string;
	}

	public static String bcardMask(String string) {
		if (string != null && string.length() >= 4) {
			string = string.substring(0, string.length() - 4) + "****";
		}
		return string;
	}
	public static Float getFloat0(Float value) {
		
		return valid(value)?value:0f;
	}
	public static Float getFloat0(Object value) {
		
		return valid(value)?Float.valueOf(value.toString()):0f;
	}
	public static Float getFloat1(Float value) {
		
		return valid(value)?value:1f;
	}
	public static String getString(Object value){
		return valid(value)?value.toString():"";
	}
	public static Integer getInteger(Object value){
		return valid(value)?(Integer)value:0;
	}
	public static String format2dec(Object value){
		if(!valid(value)){
			return "";
		}
		if(Double.valueOf(value.toString())==0){
			//return "0.00";
		}
		DecimalFormat df1 = new DecimalFormat("0.00"); 
		return df1.format((Double.valueOf(value.toString())));
	}
	
	public static String format3dec(String value1,String value2,String value3){
		value1 = Util.valid(value1) ? value1 : "0";
		value2 = Util.valid(value2) ? value2 : "0";
		value3 = Util.valid(value3) ? value3 : "0";
		Double value = Double.parseDouble(value1)+Double.parseDouble(value2)-Double.parseDouble(value3);
		if(!valid(value)){
			return "";
		}
		if(Double.valueOf(value.toString())==0){
			//return "0.00";
		}
		DecimalFormat df1 = new DecimalFormat("0.00"); 
		return df1.format((Double.valueOf(value.toString())));
	}

	public static List<String> stringToList(String params){
		List<String> tlist = new ArrayList<String>();
		if(Util.valid(params)){
			String[] temps = params.split(",");
			for(String temp : temps){
				if(Util.valid(temp)){
					tlist.add(temp.trim());
				}
			}
		}

		return tlist;
	}


	public static byte[] createCaptcha(){
		int length = 4;
		long seed = System.currentTimeMillis();
		Random r = new Random(seed);
		StringBuffer captchaBuffer = new StringBuffer();
		for (int i = 0; i < length; i++) {
			captchaBuffer.append(r.nextInt(9));
		}
		String captcha = captchaBuffer.toString();

		BufferedImage bi = new BufferedImage(40, 16, BufferedImage.SCALE_DEFAULT);
		Graphics2D g = bi.createGraphics();

		g.setColor(new Color(255, 255, 255));
		g.fillRect(0, 0, 40, 16);

		g.setColor(Color.black);
		g.setFont(new Font("宋体", Font.BOLD, 12));
		g.drawString(captcha, 4, 12);
		SessionUtils.setAttribute($.SESSION_CAPTCHA,captcha);
		Random random = new Random();
		for (int i = 0; i < 12; i++) {
			int x = random.nextInt(40);
			int y = random.nextInt(16);
			g.drawLine(x, y, x, y);
		}
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		try {
			ImageIO.write(bi, "PNG", outputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return outputStream.toByteArray();
	}

}
