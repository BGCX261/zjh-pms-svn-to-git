package com.kaishengit.util;

import java.text.DecimalFormat;

public class FloatUtil {

	public static String getFloat(long l) {
		DecimalFormat df = new DecimalFormat(".##");
		return df.format(l);
	}
}
