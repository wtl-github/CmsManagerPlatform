package com.sgnbs.cms.util;

import java.util.Random;
import java.util.UUID;
//import com.game.publish.maintain.MdCol;

/**
 * Created by liuyang on 15/4/2.
 */
public class StrUtil{

    static final char[] hexDigits = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    static final char[] digits = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    static final Random rand = new Random();

    public static String getUUID() {
        String uuid = UUID.randomUUID().toString();
        return uuid.replaceAll("-", "");
    }

    public static String randomString(int length) {
        StringBuffer sb = new StringBuffer();
        for (int loop = 0; loop < length; ++loop) {
            sb.append(hexDigits[rand.nextInt(hexDigits.length)]);
        }
        return sb.toString();
    }

    public static String randomNumber(int length) {
        StringBuffer sb = new StringBuffer();
        for (int loop = 0; loop < length; ++loop) {
            sb.append(digits[rand.nextInt(digits.length)]);
        }
        return sb.toString();
    }

/*    public static String getEncryptionToken(String token) {
        for (int i = 0; i < 6; i++) {
            token = EncryptionUtil.encoderBase64(token.getBytes());
        }
        return token;
    }

    public static String getDecryptToken(String encryptionToken) {
        for (int i = 0; i < 6; i++) {
            encryptionToken = EncryptionUtil.decoderBase64(encryptionToken.getBytes());
        }
        return encryptionToken;
    }*/

    public static void main(String[] args) {
        System.out.println(StrUtil.getUUID());
    }
    
	public static String splitStr(String source,String type){
//		String type = "0=治安类,1=保洁类,2=设施类,3=建议类,4=政策咨询类,5=社区服务类,6=其他";
		String[] types = source.split(",");
		for(int i=0;i<types.length;i++){
			if(types[i].split("=")[0].equals(type))
			return types[i].split("=")[1];	
		}
		return null;
	}
	
/*	public static List<MdCol> splitStr(String source){
//		String type = "0=治安类,1=保洁类,2=设施类,3=建议类,4=政策咨询类,5=社区服务类,6=其他";
		List<MdCol> str = new ArrayList<MdCol>();
		String[] types = source.split(",");
		for(int i=0;i<types.length;i++){
			MdCol mdCol = new MdCol();
			mdCol.setType(types[i].split("=")[0]);
			mdCol.setTypeName(types[i].split("=")[1]);
			str.add(mdCol);	
		}
		return str;
	}*/

	public static Boolean notNull(String str)
	{
		if(str!=null&&!"".equals(str))
		{
			return true;
		}
		else
		{
			return false;
		}
		
	}
	
}
