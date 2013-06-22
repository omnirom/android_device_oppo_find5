package com.cyanogenmod.settings.device;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileReader;

public class Utils {

    /**
     * Write a string value to the specified file.
     * @param filename      The filename
     * @param value         The value
     */
    public static void writeValue(String filename, String value) {
        try {
            FileOutputStream fos = new FileOutputStream(new File(filename));
            fos.write(value.getBytes());
            fos.flush();
            fos.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Write the "color value" to the specified file. The value is scaled from
     * an integer to an unsigned integer by multiplying by 2.
     * @param filename      The filename
     * @param value         The value of max value Integer.MAX
     */
    public static void writeColor(String filename, int value) {
        writeValue(filename, String.valueOf((long) value * 2));
    }

    /**
     * Write the "gamma value" to the specified file.
     * @param filename      The filename
     * @param value         The value
     */
    public static void writeGamma(String filename, int value) {
        writeValue(filename, String.valueOf(value));
    }

    /**
     * Check if the specified file exists.
     * @param filename      The filename
     * @return              Whether the file exists or not
     */
    public static boolean fileExists(String filename) {
        return new File(filename).exists();
    }

    public static boolean fileWritable(String filename) {
        return fileExists(filename) && new File(filename).canWrite();
    }
    
    public static String readLine(String filename) {
        BufferedReader br = null;
        String line = null;
        try {
            br = new BufferedReader(new FileReader(filename), 1024);
            line = br.readLine();
        } catch (IOException e) {
            return null;
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    // ignore
                }
            }
        }
        return line;
    }
    
    public static boolean getFileValueAsBoolean(String filename, boolean defValue) {
    	String fileValue = readLine(filename);
        if(fileValue!=null){
        	return (fileValue.equals("0")?false:true);
        }
		return defValue;
    }
    
    public static String getFileValue(String filename, String defValue) {
    	String fileValue = readLine(filename);
        if(fileValue!=null){
			return fileValue;
        }
		return defValue;
    }
}
