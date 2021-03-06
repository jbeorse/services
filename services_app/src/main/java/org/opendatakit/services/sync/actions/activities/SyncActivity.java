/*
 * Copyright (C) 2014 University of Washington
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package org.opendatakit.services.sync.actions.activities;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import org.opendatakit.logging.WebLogger;
import org.opendatakit.services.R;
import org.opendatakit.services.sync.actions.fragments.SyncFragment;

/**
 * An activity for syncing the local content with the server.
 *
 * @author mitchellsundt@gmail.com
 *
 */
public class SyncActivity extends AbsSyncBaseActivity {

  private static final String TAG = SyncActivity.class.getSimpleName();

  @Override
  protected void onResume() {
    super.onResume();

    WebLogger.getLogger(getAppName()).i(TAG, "[onResume] getting SyncFragment");

    FragmentManager mgr = getFragmentManager();
    String newFragmentName;
    Fragment newFragment;

    // we want the list fragment
    newFragmentName = SyncFragment.NAME;
    newFragment = mgr.findFragmentByTag(newFragmentName);
    if ( newFragment == null ) {
      newFragment = new SyncFragment();
      WebLogger.getLogger(getAppName()).i(TAG, "[onResume] creating new SyncFragment");
      
      FragmentTransaction trans = mgr.beginTransaction();
      trans.replace(R.id.sync_activity_view, newFragment, newFragmentName);
      WebLogger.getLogger(getAppName()).i(TAG, "[onResume] replacing fragment with id " + newFragment.getId());
      trans.commit();
    }
  }

}
