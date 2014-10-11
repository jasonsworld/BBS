package cn.edu.bupt.DBconnection;

import java.io.IOException;
import java.util.Properties;

public class PropertiesUtils {
	static Properties properties = new Properties();

	public static boolean loadFile(String fileName) {
		try {
			properties.load(PropertiesUtils.class.getClassLoader()
					.getResourceAsStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static String getPropertyValue(String key) {
		return properties.getProperty(key);
	}
}
