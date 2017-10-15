package com.meliora.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

/**
 * 生成时间戳工具类
 * 
 * @author lisongqiu
 * @company meliora
 * @version 1.0
 **/
public class TimeUtil {
	public final static String YYYYMMDDHHMMSS = "yyyy-MM-dd HH:mm:ss";
	public final static String YYYYMMDD = "yyyy-MM-dd";
	public final static String YYYYMM = "yyyy-MM";
	public final static String YYYY = "yyyy";
	public final static String HHMMSS = "HH:mm:ss";

	// 获得时间字符串，格式为：年月日时分秒
	public String getString() {
		String str = "";
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		str = format.format(new Date());
		return str;
	}

	// 生成随机数：1000以内的三位数的随机数
	public int randNum() {
		int result = 0;
		Random rand = new Random();
		result = rand.nextInt(1000);
		return result;
	}

	// 将时间字符串与随机数拼接
	public static String getTimeStr() {
		TimeUtil tu = new TimeUtil();
		String time = tu.getString() + tu.randNum();
		return time;
	}

	public static void main(String[] args) {
		System.out.println(TimeUtil.getTimeStr());
	}

	/**
	 * 计算两个日期之间相差的月数
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static int getMonths(Date date1, Date date2) {
		int iMonth = 0;
		int flag = 0;
		try {
			Calendar objCalendarDate1 = Calendar.getInstance();
			objCalendarDate1.setTime(date1);

			Calendar objCalendarDate2 = Calendar.getInstance();
			objCalendarDate2.setTime(date2);

			if (objCalendarDate2.equals(objCalendarDate1))
				return 0;
			if (objCalendarDate1.after(objCalendarDate2)) {
				Calendar temp = objCalendarDate1;
				objCalendarDate1 = objCalendarDate2;
				objCalendarDate2 = temp;
			}
			if (objCalendarDate2.get(Calendar.DAY_OF_MONTH) < objCalendarDate1
					.get(Calendar.DAY_OF_MONTH))
				flag = 1;

			if (objCalendarDate2.get(Calendar.YEAR) > objCalendarDate1
					.get(Calendar.YEAR))
				iMonth = ((objCalendarDate2.get(Calendar.YEAR) - objCalendarDate1
						.get(Calendar.YEAR))
						* 12 + objCalendarDate2.get(Calendar.MONTH) - flag)
						- objCalendarDate1.get(Calendar.MONTH);
			else
				iMonth = objCalendarDate2.get(Calendar.MONTH)
						- objCalendarDate1.get(Calendar.MONTH) - flag;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return iMonth;
	}

	public static long getQuot(String time1, String time2) {
		long quot = 0;
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date date1 = ft.parse(time1);
			Date date2 = ft.parse(time2);
			quot = date1.getTime() - date2.getTime();
			quot = quot / 1000 / 60 / 60 / 24;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return quot;
	}

	
	public static String getDateString(Date date, final String args) {
		SimpleDateFormat fmt = new SimpleDateFormat(args);
		
		return fmt.format(date);

	}
	/**
	 * 返回指定日期的字符串格式
	 * 
	 * @param date
	 * @param args
	 * @param args1
	 * @return yyyy-MM-dd HH:mm:ss
	 * */
	public static String getDateString1(Date date, final String args, int args1) {
		SimpleDateFormat fmt = new SimpleDateFormat(args);
		Calendar calendar = Calendar.getInstance();
		if (date != null) {
			calendar.setTime(date);
		}
		calendar.add(Calendar.MONTH, args1);
		calendar.set(Calendar.HOUR_OF_DAY, 8);
		calendar.set(Calendar.MINUTE, 30);
		calendar.set(Calendar.SECOND, 0);

		return fmt.format(calendar.getTime());
	}

	/**
	 * 
	 * 
	 * */
	public static String getDateString2(Date date, final String args) {
		if(!Util.valid(date)){
			return "";
		}
		SimpleDateFormat fmt = new SimpleDateFormat(args);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, 8);
		calendar.set(Calendar.MINUTE, 30);
		calendar.set(Calendar.SECOND, 0);
		return fmt.format(calendar.getTime());

	}
	public static String getDateString4(Date date) {
		if(!Util.valid(date)){
			return "";
		}
		SimpleDateFormat fmt = new SimpleDateFormat(YYYYMMDDHHMMSS);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, 8);
		calendar.set(Calendar.MINUTE, 30);
		calendar.set(Calendar.SECOND, 0);
		return fmt.format(calendar.getTime());

	}
	/**
	 * 每月的第一天或者最后一天
	 * */
	public static String getStringDate1(String date, String args, String args1) {
		SimpleDateFormat fmt = new SimpleDateFormat(args);
		Calendar calendar = Calendar.getInstance();
		try {
			Date date1 = fmt.parse(date);
			calendar.setTime(date1);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (args1.equals("first")) {
			calendar.set(Calendar.DAY_OF_MONTH, calendar
					.getActualMinimum(Calendar.DAY_OF_MONTH));
		} else if (args1.equals("last")) {
			calendar.add(Calendar.MONTH, 1);
			calendar.set(Calendar.DAY_OF_MONTH, calendar
					.getActualMinimum(Calendar.DAY_OF_MONTH));
		}
		calendar.set(Calendar.HOUR_OF_DAY, 8);
		calendar.set(Calendar.MINUTE, 30);
		calendar.set(Calendar.SECOND, 0);
		return fmt.format(calendar.getTime());
	}

	private static Date removeOther(Date time, String format) {
		DateFormat df = new SimpleDateFormat(format);
		try {
			time = df.parse(df.format(time));
		} catch (ParseException e) {
		}
		return time;
	}

	public static Date add(Date time, int field, int amount) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(time);
		calendar.add(field, amount);
		return calendar.getTime();
	}

	public static Date getDayBegin() {
		return getDayBegin(new Date());
	}

	public static Date getDayBegin(Date time) {
		return removeOther(time, YYYYMMDD);
	}

	public static Date getDayEnd() {
		return offset(getDayEnd(new Date()));
	}

	public static Date getDayEnd(Date time) {
		return add(removeOther(time, YYYYMMDD), Calendar.DATE, 1);
	}

	public static String getCurrentMonth() {
		SimpleDateFormat fmt = new SimpleDateFormat(TimeUtil.YYYYMM);
		Calendar calendar = Calendar.getInstance();
		return fmt.format(calendar.getTime());

	}

	public static Date getPreMonth(Date time) {
		return offset(add(time, Calendar.MONTH, -1));
	}

	public static Date getMonthBegin(Date time) {
		return getMonthBegin(time, true);
	}

	public static Date getMonthBegin(Date time, boolean offset) {
		DateFormat df = new SimpleDateFormat("yyyy-MM");
		try {
			time = df.parse(df.format(time));
		} catch (ParseException e) {
		}
		if (offset) {
			return offset(time);
		} else {
			return time;
		}
	}

	public static Date getMonthEnd(Date time) {
		return getMonthEnd(time, true);
	}

	public static Date getMonthEnd(Date time, boolean offset) {
		DateFormat df = new SimpleDateFormat("yyyy-MM");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(time);
		calendar.add(Calendar.MONTH, 1);
		time = calendar.getTime();
		try {
			time = df.parse(df.format(time));
		} catch (ParseException e) {
		}
		if (offset) {
			return offset(time);
		} else {
			return time;
		}
	}

	public static Date getYearBegin(Date time) {
		return getYearBegin(time, true);
	}

	public static Date getYearBegin(Date time, boolean offset) {
		DateFormat df = new SimpleDateFormat("yyyy");
		try {
			time = df.parse(df.format(time));
		} catch (ParseException e) {
		}
		if (offset) {
			return offset(time);
		} else {
			return time;
		}
	}

	public static Date getYearEnd(Date time) {
		return getYearEnd(time, true);
	}

	public static Date getYearEnd(Date time, boolean offset) {
		DateFormat df = new SimpleDateFormat("yyyy");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(time);
		calendar.add(Calendar.YEAR, 1);
		time = calendar.getTime();
		try {
			time = df.parse(df.format(time));
		} catch (ParseException e) {
		}
		if (offset) {
			return offset(time);
		} else {
			return time;
		}
	}

	public static Date offset(Date time) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(time);
		calendar.set(Calendar.HOUR, 8);
		calendar.set(Calendar.MINUTE, 30);
		return calendar.getTime();
	}

	public static Date getPreviousMonth(Date time) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(time);
		calendar.add(Calendar.MONTH, -1);
		return calendar.getTime();
	}

	public static Date getNextMonth(Date time) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(time);
		calendar.add(Calendar.MONTH, 1);
		return calendar.getTime();
	}

	public static boolean dateDiff(Date date) {
		Calendar c = Calendar.getInstance();
		if (date != null) {
			long now = c.getTime().getTime();
			long diff = date.getTime();
			if ((diff - now) / 1000 / 60 / 60 / 24 <= 30
					&& (diff - now) / 1000 / 60 / 60 / 24 >= 0) {
				return true;
			}
		}
		return false;
	}

	public static int getMonthSpace(Date date1, Date date2)
			throws ParseException {
		int iMonth = 0;
		int flag = 0;
		try {
			Calendar objCalendarDate1 = Calendar.getInstance();
			objCalendarDate1.setTime(date1);

			Calendar objCalendarDate2 = Calendar.getInstance();
			objCalendarDate2.setTime(date2);

//			if (objCalendarDate2.equals(objCalendarDate1))
//				return 0;
//			if (objCalendarDate1.after(objCalendarDate2)) {
//				Calendar temp = objCalendarDate1;
//				objCalendarDate1 = objCalendarDate2;
//				objCalendarDate2 = temp;
//			}
//			if (objCalendarDate2.get(Calendar.DAY_OF_MONTH) < objCalendarDate1
//					.get(Calendar.DAY_OF_MONTH))
//				flag = 1;

			if (objCalendarDate2.get(Calendar.YEAR) > objCalendarDate1
					.get(Calendar.YEAR))
				iMonth = ((objCalendarDate2.get(Calendar.YEAR) - objCalendarDate1
						.get(Calendar.YEAR))
						* 12 + objCalendarDate2.get(Calendar.MONTH) - flag)
						- objCalendarDate1.get(Calendar.MONTH);
			else
				iMonth = objCalendarDate2.get(Calendar.MONTH)
						- objCalendarDate1.get(Calendar.MONTH) - flag;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return iMonth;

	}
	
	public static String formatSecondToDate(Integer second){
		long day = second / (24 * 60 * 60);
		long hour = (second / (60 * 60 ) - day * 24);
		long min = ((second / (60)) - day * 24 * 60 - hour * 60);
		long s = (second  - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		String a1 = hour + "";
		String b1 = min + "";
		String c1 = s + "";
		if (hour < 10) {
			a1 = "0" + hour;
		}
		if (min < 10) {
			b1 = "0" + min;
		}
		if (s < 10) {
			c1 = "0" + s;
		}
		String date = a1 + ":" + b1 + ":" + c1;
		return date;
	}
	public static String formatSecondToDate1(Integer second){
		if(second<0){
			//出现负数
			return "数据异常";
		}
		long hour = second / (60 * 60 ) ;
		long min = second / (60) - hour * 60;
		long s = second  - hour * 60 * 60 - min * 60;
		String a1 = hour + "";
		String b1 = min + "";
		String c1 = s + "";
		if (hour < 10 && hour>0) {
			a1 = "0" + a1;
		}
		if (min < 10 && min>0) {
			b1 = "0" + b1;
		}
		if (s < 10 && s>0) {
			c1 = "0" + c1;
		}
		String date = a1 + ":" + b1 + ":" + c1;
		return date;
	}
	public static Date parseDate(String dateString,String format){
		DateFormat df = new SimpleDateFormat(format);
		Date date = null;
		try {
			date = df.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
	public static Date parseDateTime(String string) {
		return parse(string, YYYYMMDDHHMMSS);
	}
	public static Date parse(String string, String format) {
		Date time = null;
		DateFormat df = new SimpleDateFormat(format);
		try {
			time = df.parse(string);
		} catch (Exception e) {
		}
		return time;
	}
	
	public static String isLicenseVerification(Date licenseVerificationTime){
		if(Util.valid(licenseVerificationTime)){
			Calendar c = Calendar.getInstance();
			c.setTime(licenseVerificationTime);
			c.add(Calendar.MONTH, -1);
			Date remind = c.getTime();
			if(TimeUtil.getDateString(remind, "yyyy-MM-dd").equals(TimeUtil.getDateString(new Date(), "yyyy-MM-dd")) ||
					((new Date()).after(remind) && (new Date()).before(licenseVerificationTime))){
				return "yes";
			}
		}
		return "no";
	}
	
	public static String getIntervalBetweenTwoDate(Date date1,Date date2){
		if(Util.valid(date1) && Util.valid(date2)){
			Long total = date2.getTime()-date1.getTime();
			String result = "";
			Long hh = total/3600000;
			Long mm = (total - hh*3600000)/60000;
			if(hh!=0L){
				result += hh.toString()+"小时 ";
			}
			if(mm!=0L){
				result += mm.toString()+"分钟";
			}
			return result;
		}
		return "";
	}

	public static String getDateString3(Date date, final String args) {
		if(date != null){
			SimpleDateFormat fmt = new SimpleDateFormat(args);
			return fmt.format(date);
		}else{
			return "";
		}


	}
}
