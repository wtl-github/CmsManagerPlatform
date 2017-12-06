package com.sgnbs.cms.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateTools {

	public static final String YYYYMMDD = "yyyy-MM-dd";

	public static final String YYYYMMDDHHMMSS = "yyyy-MM-dd HH:mm:ss";

	public static final String YYYYMMDD_START = "yyyy-MM-dd 00:00:00";
	public static final String YYYYMMDD_END = "yyyy-MM-dd 23:59:59";

	public static final String YYYY = "yyyy";

	/**
	 * 
	 * @param date
	 *            yyyy-mm-dd
	 * @param format
	 * @return
	 * @throws ParseException
	 */
	public static String parseYMDDate(String date, String format) throws ParseException {
		Date d = null;
		SimpleDateFormat ssdf = new SimpleDateFormat(YYYYMMDD);
		if (date != null) {
			d = ssdf.parse(date);
		} else {
			d = new Date();
		}
		return new SimpleDateFormat(format).format(d);
	}

	public static String parseYMDHMS(Date date) {
		if (date == null) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(YYYYMMDDHHMMSS);
		return sdf.format(date);
	}

	public static Date dateAdd(Date date, int interval) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.SECOND, interval);
		return calendar.getTime();
	}

	public static String parseDate(Date date, String format) {
		String str = "0";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		if (date != null) {
			str = sdf.format(date);
		}

		return str;
	}

	public static String getDate(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat(YYYYMMDD);
		if (date == null) {
			date = sdf.format(new Date());
		}
		return date;
	}

	public static Date getDate(String date, String format) throws ParseException {
		Date d = null;
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		if (date != null) {
			d = sdf.parse(date);
		}
		else {
			d = new Date();
		}
		return d;
	}

	public static String getYear(String year) {
		SimpleDateFormat sdf = new SimpleDateFormat(YYYY);
		if (year == null) {
			year = sdf.format(new Date());
		}
		return year;
	}

	public static List<String> getMonth(String year) {
		List<String> list = new ArrayList<String>();
		Calendar cal = Calendar.getInstance();
		int nowYear = cal.get(Calendar.YEAR);
		int parameterYear = Integer.parseInt(year);
		if (parameterYear > nowYear) {
			return list;
		}
		if (nowYear == parameterYear) {
			for (int i = 0; i <= cal.get(Calendar.MONTH); i++) {
				if (i < 9) {
					list.add("0" + (i + 1));
				} else {
					list.add(String.valueOf(i + 1));
				}

			}
		}
		if (nowYear > parameterYear) {
			for (int i = 0; i < 12; i++) {
				if (i < 9) {
					list.add("0" + (i + 1));
				} else {
					list.add(String.valueOf(i + 1));
				}
			}
		}
		return list;
	}

	/**
	 * 取本周的第一天,最后一天
	 * 
	 * @return
	 */
	public static List<String> getDayRangeOfCurrentWeek() {
		SimpleDateFormat startFormat = new SimpleDateFormat(YYYYMMDD_START);
		SimpleDateFormat endFormat = new SimpleDateFormat(YYYYMMDD_END);
		List<String> list = new ArrayList<String>();
		Calendar calendar = Calendar.getInstance();
		String endStr = endFormat.format(calendar.getTime());
		calendar.add(Calendar.DATE, -6);
		String startStr = startFormat.format(calendar.getTime());
		list.add(startStr);
		list.add(endStr);
		return list;
	}

	public static List<String> getDaysOfCurrentMonth() {
		List<String> list = new ArrayList<String>();
		Calendar cal = Calendar.getInstance();
		int today = cal.get(Calendar.DATE);
		for (int i = 1; i <= today; i++) {
			if (i < 10) {
				list.add("0" + i);
			} else {
				list.add(String.valueOf(i));
			}
		}
		return list;
	}

	public static List<String> getMonthsOfCurrentYear() {
		List<String> list = new ArrayList<String>();
		Calendar cal = Calendar.getInstance();
		int toMonth = cal.get(Calendar.MONTH);
		for (int i = 0; i <= toMonth; i++) {
			if (i < 9) {
				list.add("0" + (i + 1));
			} else {
				list.add(String.valueOf(i + 1));
			}
		}
		return list;
	}

	/**
	 * 得到指定月的天数
	 */
	public static int getMonthLastDay(int year, int month) {
		Calendar a = Calendar.getInstance();
		a.set(Calendar.YEAR, year);
		a.set(Calendar.MONTH, month - 1);
		a.set(Calendar.DATE, 1);// 把日期设置为当月第一天
		a.roll(Calendar.DATE, -1);// 日期回滚一天，也就是最后一天
		int maxDate = a.get(Calendar.DATE);
		return maxDate;
	}

	/**
	 * 日期格式字符串转换成时间戳
	 */
	public static String date2TimeStamp(String date_str, String format) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return String.valueOf(sdf.parse(date_str).getTime() / 1000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public static String date2TimeStamp(Date date, String format) {
		try {
			return String.valueOf(date.getTime() / 1000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * 时间比较
	 */
	public static int compareDate(Date d1,Date d2){
        if (d1.getTime() > d2.getTime()) {
            return 1;
        } else if (d1.getTime() < d2.getTime()) {
            return -1;
        } else {//相等
            return 0;
        }
}

	public static void main(String[] args) {
		System.out.println(parseYMDHMS(new Date()));
	}
}