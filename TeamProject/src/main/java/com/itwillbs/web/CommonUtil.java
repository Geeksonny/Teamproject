package com.itwillbs.web;

import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

/**
 * The Class CommonUtil.
 *
 * @author Administrator
 * @version 1.0
 * @since 2017. 1. 20
 */
public class CommonUtil
{

	/** The log. */
	private static Logger log = LoggerFactory.getLogger(CommonUtil.class);

	/**
	 * Instantiates a new common util.
	 */
	private CommonUtil() {}

	/**
	 * Checks if is null list obj.
	 * isNullListObj List 객체의 정보 존재여부 확인.
	 *
	 * @param list
	 *            체크할 List 객체
	 * @return 체크 결과(true : 정보없음, false : 정보있음)
	 */
	public static boolean isNullListObj(List<?> list)
	{
		return ((list == null) || list.isEmpty()) ? true : false;
	}

	/**
	 * isNullObj 객체의 정보 존재여부 확인.
	 *
	 * @param obj
	 *            the obj
	 * @return 체크 결과(true : 정보없음, false : 정보있음)
	 */
	public static boolean isNullObj(Object obj)
	{
		return (obj == null) ? true : false;
	}

	/**
	 * isNull 문자열 Null 확인.
	 *
	 * @param str
	 *            체크할 문자열
	 * @return 체크 결과(true : Null, false : Not Null)
	 */
	public static boolean isNull(String str)
	{
		return (str == null) ? true : false;
	}

	/**
	 * isChkOmit 누락 데이터 체크.
	 *
	 * @param str
	 *            체크할 문자열
	 * @return 체크 결과(true : 정보 누락, false : 정보 있음)
	 */
	public static boolean isChkOmit(String str)
	{
		boolean bChk = false;
		if (isNull(str))
		{
			bChk = true;
		}
		else
		{
			if ("".equals(str)) {
				bChk = true;
			}
		}
		return bChk;
	}

	/**
	 * chngNullStr Null 문자열 NullString으로 변환.
	 *
	 * @param str
	 *            문자열
	 * @return 변환된 문자열
	 */
	public static String chngNullStr(String str)
	{
		if (isNull(str)) {
			return "";
		}
		else return str;
	}

	/**
	 * getReplaceStr 문자열 내 특정문자 치환 처리.
	 *
	 * @param str
	 *            문자열
	 * @param regex
	 *            치환대상 문자열
	 * @param repStr
	 *            치환할 문자열
	 * @return 치환 결과 문자열
	 */
	public static String getReplaceStr(String str, String regex, String repStr)
	{
		if (isChkOmit(str)) {
			return str;
		}
		else return str.replaceAll(regex, repStr);
	}

	/**
	 * isEmpty "" 이거나 null 일경우 true, 그 외 false.
	 *
	 * @param str
	 *            문자열
	 * @return 치환 결과 문자열
	 */
	public static boolean isEmpty(String str)
	{
		String tmpStr=chngNullStr(str);
		boolean result;
		if(isEquals(tmpStr, "")) {
			result = true;
		} else {
			result = false;
		}
		return result;
	}

	/**
	 * 현재숫자가 min,max사이의 값이면 true를 return한다.
	 *
	 * @param min
	 *            the min
	 * @param max
	 *            the max
	 * @param no
	 *            the no
	 * @return true, if successful
	 */
	public static boolean checkInRange(double min, double max, double no) {
		if(CommonUtil.isNullObj(no)) {
			return false;
		}
		return (no >= min && no <= max)?true:false;
	}

	/**
	 * 문자열이 서로 같은지 확인한다.
	 *
	 * @param a
	 *            the a
	 * @param b
	 *            the b
	 * @return true, if is equals
	 */
	public static boolean isEquals(String a, String b){

		String ta = trim(a);
		String tb = trim(b);

		if(a==null)
			return false;
		if(b==null)
			return false;
		return ta.equals(tb);
	}

	/**
	 * 문자열이 서로 다른지 확인한다.
	 *
	 * @param a
	 *            the a
	 * @param b
	 *            the b
	 * @return true, if is not equals
	 */
	public static boolean isNotEquals(String a, String b) {
		return !isEquals(a, b);
	}

	/**
	 * * 공백을 없앤다. null 일 경우 null 을 반환
	 *
	 * @param str
	 *            the str
	 * @return the string
	 */
	public static String trim(String str) {
		return str == null ? null : str.trim();
	}


	/**
	 * <pre>
	 * chngIntStr 문자열을 Integer 로 변환
	 * 문자열이 NULL인 경우 0을 반환
	 * 그 외 숫자형이 아닌 경우 NumberFormatException 발생.
	 * </pre>
	 *
	 * @param str
	 *            문자열
	 * @return 변환된 Integer
	 * @exception NumberFormatException
	 *                the number format exception
	 */
	public static Integer chngIntStr(String str)
	{
		if (isChkOmit(str)) {
			return 0;
		}
		else return Integer.parseInt(str);
	}

	/**
	 * text 에 repl 값을 with 로 max 만큼 교체 한다. <br>
	 *
	 * @param text
	 *            the text
	 * @param repl
	 *            the repl
	 * @param with
	 *            the with
	 * @param max
	 *            the max
	 * @return the string
	 */
	public static String replace(String text, String repl, String with, int max) {
		if(text == null) {
			return text;
		}

		if(repl == null) {
			return text;
		}

		if (isEmpty(text) || isEmpty(repl) || with == null || max == 0) {
			return text;
		}
		int start = 0;
		int end = text.indexOf(repl, start);
		if (end == -1) {
			return text;
		}
		int replLength = repl.length();
		int increase = with.length() - replLength;
		increase = increase < 0 ? 0 : increase;
		increase *= (max < 0 ? 16 : (max > 64 ? 64 : max));
		StringBuilder buf = new StringBuilder(text.length() + increase);
		int maxTmp = max;
		while (end != -1) {
			buf.append(text.substring(start, end)).append(with);
			start = end + replLength;
			maxTmp = maxTmp-1;
			if (maxTmp == 0) {
				break;
			}
			end = text.indexOf(repl, start);
		}
		buf.append(text.substring(start));
		return buf.toString();
	}

	/**
	 * string 을 잘라서 String array 로 반환 <br>
	 * .
	 *
	 * @param str
	 *            the str
	 * @param separatorChars
	 *            the separator chars
	 * @return the string[]
	 */
	public static String[] split(String str, String separatorChars) {
		return splitWorker(str, separatorChars, -1, false);
	}

	/**
	 * String 을 separatorChars 로 분할 하여 String array 로 반환 <br>
	 * .
	 *
	 * @param str
	 *            the str
	 * @param separatorChars
	 *            the separator chars
	 * @param max
	 *            the max
	 * @param preserveAllTokens
	 *            the preserve all tokens
	 * @return the string[]
	 */
	private static String[] splitWorker(String str, String separatorChars,
			int max, boolean preserveAllTokens) {

		if (str == null) {
			return new String[0];
		}
		int len = str.length();
		if (len == 0) {
			return new String[0];
		}
		List<String> list = new ArrayList<>();
		int sizePlus1 = 1;
		int i = 0;
		int start = 0;
		boolean match = false;
		boolean lastMatch = false;
		if (separatorChars == null) {
			while (i < len) {
				if (Character.isWhitespace(str.charAt(i))) {
					if (match || preserveAllTokens) {
						lastMatch = true;
						if (sizePlus1++ == max) {
							i = len;
							lastMatch = false;
						}
						list.add(str.substring(start, i));
						match = false;
					}
					start = ++i;
					continue;
				}
				else {
					lastMatch = false;
				}
				match = true;
				i++;
			}
		}
		else if (separatorChars.length() == 1) {
			char sep = separatorChars.charAt(0);
			while (i < len) {
				if (str.charAt(i) == sep) {
					if (match || preserveAllTokens) {
						lastMatch = true;
						if (sizePlus1++ == max) {
							i = len;
							lastMatch = false;
						}
						list.add(str.substring(start, i));
						match = false;
					}
					start = ++i;
					continue;
				}
				else {
					lastMatch = false;
				}
				match = true;
				i++;
			}
		}
		else {
			while (i < len) {
				if (separatorChars.indexOf(str.charAt(i)) >= 0) {
					if (match || preserveAllTokens) {
						lastMatch = true;
						if (sizePlus1++ == max) {
							i = len;
							lastMatch = false;
						}
						list.add(str.substring(start, i));
						match = false;
					}
					start = ++i;
					continue;
				}
				else {
					lastMatch = false;
				}
				match = true;
				i++;
			}
		}
		if (match || (preserveAllTokens && lastMatch)) {
			list.add(str.substring(start, i));
		}
		return list.toArray(new String[list.size()]);
	}

	/**
	 * text 에 repl 값을 with 로 전체 교체 한다. <br>
	 *
	 * @param text
	 *            the text
	 * @param repl
	 *            the repl
	 * @param with
	 *            the with
	 * @return the string
	 */
	public static String replace(String text, String repl, String with) {
		return replace(text, repl, with, -1);
	}


	/**
	 * <pre>
	 * 문자열에서 주어진 separator 로 쪼개어 문자배열을 생성한다
	 * </pre>
	 *
	 * .
	 *
	 * @param str
	 *            원본문자열
	 * @param separator
	 *            원하는 token 문자열
	 * @return 스트링배열
	 */
	public static String[] splitVal(String str, String separator)
	{
		StringTokenizer st = new StringTokenizer(str, separator);
		String[] values = new String[st.countTokens()];
		int pos = 0;
		while (st.hasMoreTokens())
		{
			values[pos++] = st.nextToken();
		}

		return values;
	}

	/**
	 * 현재 uri와 querystring을 반환한다.
	 *
	 * @param request
	 *            the request
	 * @return the paging uri
	 */
	public static String getPagingUri(HttpServletRequest request) {


		Map<String,String> qryMap = getMapForQueryString(request.getQueryString());
		if(qryMap.containsKey("currPage")){
			qryMap.remove("currPage");
		}
		if(qryMap.containsKey("rowRange")){
			qryMap.remove("rowRange");
		}

		return getUrl(request.getRequestURI(), qryMap);

	}



	/**
	 * Gets the url.(from map to param)
	 *
	 * @param url
	 *            the url
	 * @param param
	 *            the param
	 * @return the url
	 */
	public static String getUrl(String url,Map<String,String> param){
		String rst = url;
		if(!param.isEmpty()){
			Set<String> keys = param.keySet();
			Iterator<String> iter = keys.iterator();
			StringBuilder queryString = new StringBuilder();
			boolean isFirst = true;
			while(iter.hasNext()){
				String key= iter.next();
				if(isFirst){
					String val = param.get(key);
					queryString.append("?"+key+"="+val);
					isFirst = false;
				}else{
					String val = param.get(key);
					queryString.append("&"+key+"="+val);
				}
			}
			rst += queryString;
		}
		return rst;
	}


	/**
	 * Gets the map for query string.
	 *
	 * @param queryString
	 *            the query string
	 * @return the map for query string
	 */
	public static Map<String,String> getMapForQueryString(String queryString){
		if(CommonUtil.isNull(queryString)) {
			return  new HashMap<>();
		}
		String[] vals = splitVal(queryString, "&");
		Map<String,String> tmp = new HashMap<>();
		for(String val : vals){
			String[] params = splitVal(val, "=");
			String key = isNotEmpty(params[0])?params[0]:"";
			String value = "";
			if(params.length>1){
				value = isNotEmpty(params[1])?params[1]:"";
			}
			if(isNotEmpty(key))	{
				tmp.put(key, value);
			}
		}
		return tmp;
	}



	/**
	 * Checks if is not empty.
	 *
	 * @param str
	 *            the str
	 * @return true, if is not empty
	 */
	public static boolean isNotEmpty(String str) {
		return !isEmpty(str);
	}



	/**
	 * Gets the string array from string.
	 *
	 * @param source
	 *            the source
	 * @return the string array from string
	 */
	public static String[] getStringArrayFromString(String source) {
		String[] strings = source.replace("[", "").replace("]", "").split(", ");
		String[] result = new String[strings.length];
		for (int i = 0; i < result.length; i++) {
			result[i] = strings[i];
		}
		return result;
	}


	/**
	 * Gets the string array from object.
	 *
	 * @param arrayObj
	 *            the array obj
	 * @return the string array from object
	 */
	public static List<String> getStringArrayFromObject(Object[] arrayObj) {
		List<String> result = new ArrayList<>();
		for(int i=0; i < arrayObj.length; i++) {
			result.add(arrayObj[i].toString());
		}
		return result;
	}


	/**
	 * Gets the array from string.
	 *
	 * @param source
	 *            the source
	 * @return the array from string
	 */
	public static List<String> getArrayFromString(String source) {
		String[] strings = source.replace("[", "").replace("]", "").split(", ");
		List<String> result = new ArrayList<>();
		for (int i = 0; i < strings.length; i++) {
			result.add(strings[i]);
		}
		return result;
	}

	/**
	 * Gets the adds the month calendar.
	 *
	 * @param month
	 *            the month
	 * @return the adds the month calendar
	 */
	public static Calendar getAddMonthCalendar(int month)
	{
		Calendar today = Calendar.getInstance();
		today.add(Calendar.MONTH, month);
		return today;
	}


	/**
	 * String to int.
	 *
	 * @param str
	 *            the str
	 * @return the int
	 */
	public static int stringToInt(String str) {
		String strNull ="null";
		if(str==null || str.equals(strNull)) {
			return 0;
		} else {
			if (!isNumeric(str)) {
				throw new NumberFormatException();
			}
			return Integer.parseInt(str);
		}

	}

	/**
	 * String to double.
	 *
	 * @param str
	 *            the str
	 * @return the double
	 */
	public static double stringToDouble(String str) {
		String strNull ="null";
		if(str==null || str.equals(strNull)) {
			return 0;
		} else {
			if (!isNumeric(str)) {
				throw new NumberFormatException();
			}
			return Double.parseDouble(str);
		}

	}


	/**
	 * Checks if is numeric.
	 *
	 * @param str
	 *            the str
	 * @return true, if is numeric
	 */
	public static boolean isNumeric(String str) {
		if (str==null) {
			return false;
		}
		if (isEmpty(str)) {
			return false;
		}
		int sz = str.length();
		boolean flag = false;
		for (int i = 0; i < sz; i++) {
			if (isAsciiNumeric(str.charAt(i)) == flag) {
				return false;
			}
		}
		return true;
	}


	/**
	 * Checks if is ascii numeric.
	 *
	 * @param ch
	 *            the ch
	 * @return true, if is ascii numeric
	 */
	public static boolean isAsciiNumeric(char ch) {
		return ch >= '0' && ch <= '9';
	}

	/**
	 * <pre>
	 * Gets the query string value.
	 * QueryString 을 넘겨줄 경우 parameterName=parameterValue 로 분리 하여 argValue 를 rerutn 한다
	 * </pre>
	 *
	 * @param queryString
	 *            the query string
	 * @param parameterName
	 *            the parameter name
	 * @return the query string value
	 */
	public static String getQueryStringValue(String queryString, String parameterName){
		if(queryString == null || parameterName == null || "".equals(queryString) || "".equals(parameterName)){
			return "";
		}else{
			int stringIndex = queryString.indexOf(parameterName);
			if(stringIndex > -1){
				String tempString = queryString.substring(stringIndex);
				int splitCharIndex = tempString.indexOf('&');
				if(splitCharIndex > -1){
					return tempString.substring(parameterName.length(),splitCharIndex);
				}else{
					return tempString.substring(parameterName.length());
				}
			}else{
				return "";
			}
		}
	}

	/**
	 * Lpad.
	 *
	 * @param num
	 *            the num
	 * @param size
	 *            the size
	 * @return the string
	 */
	/*
	 * 숫자형을 자릿수를 맞추고 싶을때 사용한다.
	 */
	public static String lpad(int num, int size) {
		String f = "%0"+size+"d";
		return String.format(f, num);

	}

	/**
	 * 첫글자를 소문자로 반환.
	 *
	 * @param str
	 *            the str
	 * @return the string
	 */
	public static String changeFirstCharacterToLowerCase(String str) {
		return changeFirstCharacterCase(str, false);
	}


	/**
	 * 첫글자를 대문자 또는 소문자로 반환.
	 *
	 * @param str
	 *            the str
	 * @param capitalize
	 *            the capitalize
	 * @return the string
	 */
	private static String changeFirstCharacterCase(String str, boolean capitalize) {
		if (str == null || str.length() == 0) {
			return str;
		}
		StringBuilder buf = new StringBuilder(str.length());
		if (capitalize) {
			buf.append(Character.toUpperCase(str.charAt(0)));
		}
		else {
			buf.append(Character.toLowerCase(str.charAt(0)));
		}
		buf.append(str.substring(1));
		return buf.toString();
	}

	/**
	 * 'POST'방식의 argument를 쿼리스트링으로 만들어 반환한다.
	 *
	 * @param request
	 *            the request
	 * @return the string
	 */
	public static String postQueryString(HttpServletRequest request){
		String sNames;
		StringBuilder buf= new StringBuilder();
		Enumeration<String> enu = request.getParameterNames();
		while(enu.hasMoreElements()) {
			sNames = enu.nextElement();
			buf.append("&"+sNames+"=").append(request.getParameter(sNames));
		}
		return buf.toString();
	}

	/**
	 * Object를 json string으로 변환.
	 *
	 * @param obj
	 *            the obj
	 * @return the string
	 * @throws JsonProcessingException
	 *             the json processing exception
	 */
	public static String objectToString(Object obj) throws JsonProcessingException{
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		return ow.writeValueAsString(obj);
	}


	/**
	 * 패턴제거.
	 *
	 * @param rex
	 *            the rex
	 * @param inp
	 *            the inp
	 * @return the string
	 */
	public static String removeRex(String rex, String inp){
		Pattern numP = Pattern.compile(rex);
		Matcher mat = numP.matcher("");
		mat.reset(inp);
		return mat.replaceAll("");
	}


	/**
	 * <pre>
	 * Str cut.
	 * * 문자열 자르기
	 * [ex]
	 * "가나다라" 에서 2바이트까지 자르고 싶을경우 strCut("가나다라", null, 2, 0, true, true); [결과 : "가"]
	 * "가나다라" 에서 "다"라는 키워드 기준에서 2바이트까지 자르고싶을경우 strCut("가나다라", "다", 2, 0, true, true); [결과 : "다"]
	 * "가나다라" 에서 "라"라는 키워드 기준으로 그 이전의 4바이트까지 포함하여 6바이트까지 자르고 싶을 경우 strCut("가나다라", "라", 6, 4, true, true); [결과 : "나다라"]
	 * "가나다라" 에서 3바이트를 자를 경우 [결과 : "가"]
	 * "가a나다라" 에서 3바이트를 자를 경우 [결과 : "가a"]
	 * "가나다라" 에서 "나" 키워드 기준으로 이전 1바이트 포함하여 4바이트까지 자를 경우 [결과 : "나"]
	 *</pre>
	 *
	 * @param szText
	 *            the sz text
	 * @param szKey
	 *            the sz key
	 * @param nLength
	 *            the n length
	 * @param nPrev
	 *            the n prev
	 * @param isNotag
	 *            the is notag
	 * @param isAdddot
	 *            the is adddot
	 * @return the string
	 */
	public static String strCut(String szText, String szKey, int nLength, int nPrev, boolean isNotag, boolean isAdddot){  // 문자열 자르기

		String rVal = szText;
		int oF = 0;
		int oL = 0;
		int rF = 0;
		int rL = 0;
		int nLengthPrev = 0;
		Pattern p = Pattern.compile("<(/?)([^<>]*)?>", Pattern.CASE_INSENSITIVE);  // 태그제거 패턴

		if(isNotag) {
			rVal = p.matcher(rVal).replaceAll(""); // 태그 제거
		}
		rVal = rVal.replaceAll("&amp;", "&");
		rVal = rVal.replaceAll("(!/|\r|\n|&nbsp;)", "");  // 공백제거

		try {
			byte[] bytes = rVal.getBytes("UTF-8");     // 바이트로 보관
			if(szKey != null && !"".equals(szKey)) {
				nLengthPrev = (rVal.indexOf(szKey) == -1)? 0: rVal.indexOf(szKey);  // 일단 위치찾고
				nLengthPrev = rVal.substring(0, nLengthPrev).getBytes("MS949").length;  // 위치까지길이를 byte로 다시 구한다
				nLengthPrev = (nLengthPrev-nPrev >= 0)? nLengthPrev-nPrev:0;    // 좀 앞부분부터 가져오도록한다.
			}

			// x부터 y길이만큼 잘라낸다. 한글안깨지게.
			int j = 0;

			if(nLengthPrev > 0) {
				while(j < bytes.length) {
					if((bytes[j] & 0x80) != 0) {
						oF+=2;
						rF+=3;
						if(oF+2 > nLengthPrev) {
							break;
						}
						j+=3;
					} else {
						if(oF+1 > nLengthPrev) {
							break;
						}
						++oF;
						++rF;
						++j;
					}
				}
			}
			j = rF;

			while(j < bytes.length) {
				if((bytes[j] & 0x80) != 0) {
					if(oL+2 > nLength) {
						break;
					}
					oL+=2;
					rL+=3;
					j+=3;
				} else {
					if(oL+1 > nLength) {
						break;
					}
					++oL;
					++rL;
					++j;
				}
			}

			rVal = new String(bytes, rF, rL, "UTF-8");  // charset 옵션

			if(isAdddot && rF+rL+2 <= bytes.length) {
				rVal+=".."; // ...을 붙일지말지 옵션
			}
		} catch(UnsupportedEncodingException e){ log.error("Exception:{}", e); }

		return rVal;
	}

	/**
	 *
	* @Method		: stringLenChek
	* @Date			: 2017. 2. 17.
	* @Writter		: Lee seongyeol
	* @EditHistory	:
	*
	* @Discript		: 문자열의 길이가 정해놓은 길이와 맞지 않을 경우 false 리턴.
	* 				  str : 문자  , len : 정해진 문자열 길이, sign : 1(최대문자열 길이 제한), 2(최소문자열 길이 제한), 3(최소,최대문자열 포함.)
	*
	* @param str
	* @param len
	* @param sign
	* @return
	 */
	public static boolean stringLenChek(String str, int len, int sign){

		boolean result = true;

		switch (sign)
		  {
		   case 1 : if(str.length() > len) result = false; break;
		   case 2 : if(str.length() < len) result = false; break;
		   case 3 : if(str.length() != len) result = false; break;
		  }

		return result;
	}

	/**
	 *
	* @Method		: validatePassword
	* @Date			: 2017. 3. 7.
	* @Writter		: LEE SEONG YEOL <ruise6114@bluetechs.com>
	* @EditHistory	:
	*
	* @Discript		:
	*
	* @param password
	* @return
	 */
	public static boolean validatePassword(final String password){

		Pattern p;

		p = Pattern.compile("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*?_~]).{8,20})");
		Matcher matcher = p.matcher(password);
		return matcher.matches();

	}

	/**
	 *
	* @Method		: toUpperCaseSafely
	* @Date			: 2017. 3. 16.
	* @Writter		: LEE SEONG YEOL <ruise6114@bluetechs.com>
	* @EditHistory	:
	*
	* @Discript		:
	*
	* @param str
	* @return
	 */
	public static String toUpperCaseSafely(String str) {
		return ((str != null) ? str.toUpperCase() : str);
	}

	/**
	 * limitLength의 길이 보다 length 가 긴 string value 를 자릿수에 맞게 잘라줌(byte length)
	 *
	 * @param limitLength - 자릿수
	 * @param stringValue - string value
	 * @return String
	 */
	public static String getLimitedString(int limitLength, String stringValue) {
		String rtnValue = "";
		int rSize = 0;

		if (!(stringValue == null || "".equals(stringValue)))
		{
			if (stringValue.getBytes().length > limitLength)
			{
				for (int len=0; rSize<stringValue.length(); rSize++, len++ )
				{
					if (stringValue.charAt(rSize) > 0x007F)
					{
						len += 1;
					}

					if (len >= limitLength)
					{
						break;
					}
				}

				rtnValue = stringValue.substring(0, rSize);
			}
			else
			{
				rtnValue = stringValue;
			}
		}

		return rtnValue;
	}

	/**
	 * 문자열에 대해 해당 자릿수만큼 prefix로 채운 문자열 생성
	 *
	 * @param str
	 * @param posit - 자릿수
	 * @param prefix - 앞에 채울 문자(char)
	 * @return
	 */
	public static String getFilledString(String str, int posit, char prefix) {
		if (str == null) { return null; }

		int strLen = str.length();
		if(strLen >= posit)
		{
			return str;
		}

		StringBuffer buf = new StringBuffer();

		for (int i=0; i<(posit - strLen); ++i)
		{
			buf.append(prefix);
		}

		buf.append(str);

		return buf.toString();
	}

	// String.split() 성능 개선 위해.
	public static String[] splitFaster(String str, String separator, int separatorLen) {
		if (str == null) { return null; }

		if (str.length() == 0) // empty string
		{
			// return (new String[] {""});
			return (new String[] {}); // empty array
		}

		int strLen = str.length();
		int idx = 0, startIdx = idx;
		ArrayList<String> tlist = new ArrayList<String>();

		while ((idx = str.indexOf(separator, startIdx)) != -1)
		{
		tlist.add(str.substring(startIdx, idx));
		startIdx = idx + separatorLen;
		}

		if (startIdx <=  strLen)
		{
			tlist.add(str.substring(startIdx, strLen));
		}

		return (String[]) tlist.toArray(new String[tlist.size()]);
	}

	/**
	 * 숫자에 대해 해당 자릿수만큼 '0'으로 채운 문자열 생성
	 *
	 * @param val
	 * @param posit - 자릿수
	 * @return
	 */
	public static String getFilledString(long val, int posit) {
		String ret = null;
		StringBuffer pattern = new StringBuffer();

		for (int i=0; i<posit; ++i) {
			pattern.append("0");
		}

		DecimalFormat df = new DecimalFormat(pattern.toString());
		ret = df.format(val);

		return ret;
	}

	public static boolean isNotFalse(Boolean bool) {
	      return !isFalse(bool);
	  }

	 public static boolean isFalse(Boolean bool) {
	      if (bool == null) {
	          return false;
	      }
	      return bool.booleanValue() ? false : true;
	  }

	 /**
	  * get Local Server ip.
	  * @return
	  */
	 public static String getLocalServerIp() {
	        try {

	            for ( Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements(); ) {

	                NetworkInterface intf = en.nextElement();
	                for ( Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements(); ) {

	                    InetAddress inetAddress = enumIpAddr.nextElement();
	                    if ( !inetAddress.isLoopbackAddress() && !inetAddress.isLinkLocalAddress() && inetAddress.isSiteLocalAddress() ) {

	                        return inetAddress.getHostAddress().toString();
	                    }
	                }
	            }
	        } catch ( SocketException ex ) {}
	        return null;
	 }

	 public static String fmtDouble(double d)
	 {
	     if(d == (long) d)
	         return String.format("%d",(long)d);
	     else
	         return String.format("%s",d);
	 }


}
