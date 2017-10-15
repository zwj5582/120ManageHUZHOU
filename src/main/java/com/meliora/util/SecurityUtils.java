package com.meliora.util;
import java.security.MessageDigest;

public class SecurityUtils {
	private static char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7',
			'8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

	public final static String MD5(String input) {
		try {
			byte[] bytesInput = input.getBytes();
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			messageDigest.update(bytesInput);
			byte[] bytesDigest = messageDigest.digest();
			int byteLength = bytesDigest.length;
			char chars[] = new char[byteLength * 2];
			for (int i = 0; i < byteLength; i++) {
				byte digestByte = bytesDigest[i];
				chars[i * 2] = hexDigits[digestByte >>> 4 & 0xf];
				chars[i * 2 + 1] = hexDigits[digestByte & 0xf];
			}
			return new String(chars);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void main(String[] arg) {
		System.out.println(SecurityUtils.MD5("111111"));
	}

}
