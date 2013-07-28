package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;

public class DoubleTap2WakeSwitch implements OnPreferenceChangeListener {

    private static final String FILE = "/sys/android_touch/dt2w_enabled";

    public static boolean isSupported() {
        return Utils.fileWritable(FILE);
    }

	public static boolean isEnabled(Context context) {
        boolean enabled = Utils.getFileValueAsBoolean(FILE, true);        
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        return sharedPrefs.getBoolean(DeviceSettings.KEY_DOUBLETAB2WAKE_SWITCH, enabled);     
	}

    /**
     * Restore setting from SharedPreferences. (Write to kernel.)
     * @param context       The context to read the SharedPreferences from
     */
    public static void restore(Context context) {
        if (!isSupported()) {
            return;
        }
        
        boolean enabled = isEnabled(context);      
        if(enabled)
            Utils.writeValue(FILE, "1");
        else
            Utils.writeValue(FILE, "0");
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        Boolean enabled = (Boolean) newValue;
        if(enabled)
            Utils.writeValue(FILE, "1");
        else
            Utils.writeValue(FILE, "0");
        return true;
    }

}
