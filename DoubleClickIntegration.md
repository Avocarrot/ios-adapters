## This is the guide to set up mediation for Avocarrot on DFP dashboard.

### Create a new yield partner for Avocarrot network.

**Note:** Each yield partner is an "ad network" company in DFP. These companies can be used for Mediation for mobile apps.

1. [Sign in](https://www.google.com/dfp/) to DoubleClick for Publishers.

2. Click **Admin** > **Companies**.

3. Click **New company** > **Ad network**.

4. Click Other company

5. Specify a **unique name** for this DFP company to determine how it will appear in DFP reports. This name can differ from the partner's official name. Use “Avocarrot” in this case.

6. Select **Enable for Mediation** to use this company

7. Set the **Credit status** as “Active” for this company.  

    ![_creditStatus](https://raw.githubusercontent.com/avocarrot/ios-adapters/master/images/DFP/step_1.png)

8. Click **Save**.

### Create a new yield group for Avocarrot network to compete in mediation.
**Note:** Yield groups allow you to specify what inventory you want to sell with mediation for mobile apps. You can add Avocarrot network into a yield group with targeting similar to line items.

**Note:** If you already have a yield group, in DFP,  go to **Delivery** > **Yield groups** and click the name of the yield group you'd like to edit. And Click **Edit** then go to step 9 below.

1. [Sign in](https://www.google.com/dfp/) to DoubleClick for Publishers.

2. Click **Delivery** > **Yield groups**.

3. Click Create yield group.

    ![_createYieldGroup](https://raw.githubusercontent.com/avocarrot/ios-adapters/master/images/DFP/step_2.png)

4. Enter a unique **Yield group name** that's descriptive for reporting.

5. Select the **Ad format** you wish to target with this yield group.

  - **Banner:** Display ads for web or mobile apps. For example, a 320x50 leaderboard slot.

  - **Interstitial:** A full-screen ad to be displayed in a mobile app environment.

6. Select "Mobile app" in the **Environment** list

7. For Banner, enter a list of inventory **sizes** to target. Make sure you choose sizes that correspond with what Avocarrot supports.

  - Available Banner size : 320x50, 300x250 (MREC), 728x90

    ![_bannerSize](https://raw.githubusercontent.com/avocarrot/ios-adapters/master/images/DFP/step_3.png)

8. Add **Targeting** to define where in your inventory this yield group can compete for impressions.

    ![_targeting](https://raw.githubusercontent.com/avocarrot/ios-adapters/master/images/DFP/step_4.png)

9. Under "Yield partners", click **Add another yield partner**

10. Select your yield partner created for Avocarrot from the **Yield partner** drop-down menu, or select **Create a new yield partner** to add a new yield partner in your network (see step 1 above). The option to create a new yield partner only appears for users with permission to edit companies.

  - Select **“Custom event mediation”** in the **integration type** list.

  - Select the **operating system** you wish to target, either "iOS" or "Android."

  - Enter name for **Label**, this will be reflected in reporting page.

  - Enter **class name:**

    - For Banner: `AvocarrotAdMobCustomEventBanner`

    - For Interstitial: `AvocarrotAdMobCustomEventInterstitial`

  - Enter your Ad Unit ID from Avocarrot dashboard as **Parameter** values

  - Enter a **Default CPM** value to manually set the price at which the Avocarrot network will compete. Please Consult with your account manager about the optimal CPM. This value is used for mediation ranking.

      ![_defaulyCPM](https://raw.githubusercontent.com/avocarrot/ios-adapters/master/images/DFP/step_5.png)

11. Click **Save** to confirm your changes without activating this yield group for delivery, or click **Save and activate** to confirm your changes and immediately approve ‘Avocarrot’ network for delivery.

12. You can activate the yield group by changing the status of the yield partner to “Active”

Once a yield group has been created and activated, DFP is ready to begin sending requests to Avocarrot.

[Adapter integration guide](https://github.com/Avocarrot/ios-adapters/blob/master/GoogleMobileAdsIntegration.md)
