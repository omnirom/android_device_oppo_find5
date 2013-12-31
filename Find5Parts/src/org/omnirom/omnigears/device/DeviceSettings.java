/*
* Copyright (C) 2013 The OmniROM Project
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*
*/
package org.omnirom.omnigears.device;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.TwoStatePreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceCategory;

public class DeviceSettings extends PreferenceActivity  {

    public static final String KEY_S2WSWITCH = "s2w_switch";
    public static final String KEY_S2WSTROKE = "s2w_stroke";
    public static final String KEY_S2WLENGTH = "s2w_length";
    public static final String KEY_DOUBLETAB_SWITCH = "double_tap";
    public static final String KEY_CAMERA_SWITCH = "camera";
    public static final String KEY_MUSIC_SWITCH = "music";
    public static final String KEY_TORCH_SWITCH = "torch";
    public static final String KEY_VIBSTRENGTH = "vib_strength";
    public static final String KEY_SUSPEND_CAP_FREQ = "suspend_cap_freq";
    public static final String KEY_SUSPEND_CAP_CORE = "suspend_cap_core";

    private TwoStatePreference mS2WSwitch;
    private ListPreference mS2WStroke;
    private ListPreference mS2WLength;
    private TwoStatePreference mDoubleTapSwitch;
    private TwoStatePreference mCameraSwitch;
    private TwoStatePreference mMusicSwitch;
    private TwoStatePreference mTorchSwitch;
    private VibratorStrengthPreference mVibratorStrength;
    private SuspendFreqCap mSuspendFreqCap;
    private SuspendCoreCap mSuspendCoreCap;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.main);

        mS2WSwitch = (TwoStatePreference) findPreference(KEY_S2WSWITCH);
        mS2WSwitch.setEnabled(Sweep2WakeSwitch.isSupported());
        mS2WSwitch.setChecked(Sweep2WakeSwitch.isEnabled(this));
        mS2WSwitch.setOnPreferenceChangeListener(new Sweep2WakeSwitch());

        mS2WStroke = (ListPreference) findPreference(KEY_S2WSTROKE);
        mS2WStroke.setEnabled(Sweep2WakeStroke.isSupported());
        mS2WStroke.setValue(Sweep2WakeStroke.getValue(this));
        mS2WStroke.setOnPreferenceChangeListener(new Sweep2WakeStroke());

        mS2WLength = (ListPreference) findPreference(KEY_S2WLENGTH);
        mS2WLength.setEnabled(Sweep2WakeMinLength.isSupported());
        mS2WLength.setValue(squashLengthValue(Sweep2WakeMinLength.getValue(this)));
        mS2WLength.setOnPreferenceChangeListener(new Sweep2WakeMinLength());

        mDoubleTapSwitch = (TwoStatePreference) findPreference(KEY_DOUBLETAB_SWITCH);
        mDoubleTapSwitch.setEnabled(DoubleTapSwitch.isSupported());
        mDoubleTapSwitch.setChecked(DoubleTapSwitch.isEnabled(this));
        mDoubleTapSwitch.setOnPreferenceChangeListener(new DoubleTapSwitch());

        mCameraSwitch = (TwoStatePreference) findPreference(KEY_CAMERA_SWITCH);
        mCameraSwitch.setEnabled(CameraGestureSwitch.isSupported());
        mCameraSwitch.setChecked(CameraGestureSwitch.isEnabled(this));
        mCameraSwitch.setOnPreferenceChangeListener(new CameraGestureSwitch());

        mMusicSwitch = (TwoStatePreference) findPreference(KEY_MUSIC_SWITCH);
        mMusicSwitch.setEnabled(MusicGestureSwitch.isSupported());
        mMusicSwitch.setChecked(MusicGestureSwitch.isEnabled(this));
        mMusicSwitch.setOnPreferenceChangeListener(new MusicGestureSwitch());

        mTorchSwitch = (TwoStatePreference) findPreference(KEY_TORCH_SWITCH);
        mTorchSwitch.setEnabled(TorchGestureSwitch.isSupported());
        mTorchSwitch.setChecked(TorchGestureSwitch.isEnabled(this));
        mTorchSwitch.setOnPreferenceChangeListener(new TorchGestureSwitch());

        mVibratorStrength = (VibratorStrengthPreference) findPreference(KEY_VIBSTRENGTH);
        mVibratorStrength.setEnabled(VibratorStrengthPreference.isSupported());

        mSuspendFreqCap = (SuspendFreqCap) findPreference(KEY_SUSPEND_CAP_FREQ);
        mSuspendFreqCap.setEnabled(SuspendFreqCap.isSupported());
        mSuspendFreqCap.setValue(SuspendFreqCap.getValue(this));
        mSuspendFreqCap.setOnPreferenceChangeListener(mSuspendFreqCap);

        mSuspendCoreCap = (SuspendCoreCap) findPreference(KEY_SUSPEND_CAP_CORE);
        mSuspendCoreCap.setEnabled(SuspendCoreCap.isSupported());
        mSuspendCoreCap.setValue(SuspendCoreCap.getValue(this));
        mSuspendCoreCap.setOnPreferenceChangeListener(mSuspendCoreCap);
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
    }


    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

    private String squashLengthValue(String value) {
        // map it to 325, 500, 850 if not exact value
        int intValue=new Integer(value).intValue();
        if(intValue==325 || intValue==500 || intValue==850){
            return value;
        }
        // we found a different value in sysfs
        // map it to our 3 possible length
        if(intValue<325)
            return "325";
        if(intValue>850)
            return "850";
        if(intValue>325 && intValue <500){
            int diff1=intValue-325;
            int diff2=500-intValue;
            return (diff1<diff2)?"325":"500";
        }
        if(intValue>500 && intValue <850){
            int diff1=intValue-500;
            int diff2=850-intValue;
            return (diff1<diff2)?"500":"850";
        }
        return value;
    }
}
