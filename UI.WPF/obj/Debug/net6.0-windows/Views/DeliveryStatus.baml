   M S B A M L   `   `   `  ����I  ERestaurant.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Restaurant.WPF.ViewsRestaurant.WPF.Views  5   	   )    #Restaurant.WPF.Views.DeliveryStatus   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:Restaurant.WPF.Views     5   	   T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f;Controls,http://metro.mahapps.com/winfx/xaml/controls  5   	     � Title$  Delivery Status��5	   	   $	��500��6!   $
��1000��61    � WindowStartupLocation$ CenterScreen=�6A    � WindowStyle$ ThreeDBorderWindow=�6f   .��5
      � .+�5   
   ��    MahApps.Brushes.Highlight#���   6   $
��Left=�6K   $��Stretch=�6f   $��25,25,25,25q�5      ._�5      &   System.Windows.Controls.DataGrid  -   5        $��dispatchedOrders��5      
���   �  MahApps.Brushes.Accent4#���  5   !      CanUserDeleteRows$
 True��5   !      CanUserAddRows$
 True��6:      AutoGenerateColumns$ False��5       $��1q�6=   $��Stretch=�5      $��2,10,2,2q�6;      CanUserResizeColumns$
 True��5      "   VerticalScrollBarVisibility$ Visible=�69   $   HorizontalScrollBarVisibility$ Hidden=�6_   	   CanUserSortColumns$
	 True��5      $��10,10,10,10q�69   
   Columns
 5      4  .System.Windows.Controls.DataGridTemplateColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Bill_No��6-      Width5  /System.Windows.Controls.DataGridLengthConverter$ 50 6?      CellTemplate 5      �� 5      .R�5   "   �� 
�������
���   ���6O   �� *Id+5      5        5      $ OnlineId��6-   $ 70 6@    5      �� 5      .R�5    "   �� 
�������
���   ���6O   �� *
OnlineId+5!      5#        5$      $ Net Bill��6-   $ 70 6@    5%      �� 5&      .R�5'   "   �� 
�������
���   ���6O   �� *
NetTotal+5(      5*        5+      $ DispatchedTime��6-   $ 70 6F    5,      �� 5-      .R�5.   "   �� 
�������
���   ���6O   �� *DispatchedTime+5/      51        52      $ DeliveredTime��6-   $ 70 6E    53      �� 54      .R�55   "   �� 
�������
���   ���6O   �� *DeliveryTime+56      58        59      $
 Name��6-   $ 70 6<    5:      �� 5;      .R�5<   "   �� 
�������
���   ���6O   �� *Name+5=      5?        5@      $ PhoneNo��6-   $ 70 6?    5A      �� 5B      .R�5C   "   �� 
�������
���   ���6O   �� *	PhoneNo+5D      5F        5G      $ Address��6-   $ 70 6?    5H      �� 5I      .R�5J   "   �� 
�������
���   ���6O   �� *	Address+5K      5M        5N      $ RiderId��6-   $ 70 6?    5O      �� 5P      .R�5Q   "   �� 
�������
���   ���6O   �� *	RiderId+5R      5T      5V      5W      � 5X   
   $��Stretch=�6   $��Right=�60    � Orientation$ Vertical=�6L   $��25,25,25,25q�6c   .+�5Y      �� $��22(�6   Transfer Selected Bill To6A   �� 5Z      -   5        $��30,10,30,10q�5Z      $��18(�6+   $��0,40,0,0q�69   .��6]   	Delivered6h   �� 5[      -   5        $��30,10,30,10q�5[      $��18(�6+   $��0,10,0,0q�69   .��6_   Assign Rider6m   �� 5\      $��30,10,30,10q�6   $��18(�6+   $��0,10,0,0q�69   .��6K   Synchronize6X   �� 5]      -   5        $��30,10,30,10q�5]      $��18(�6-   $��0,50,0,0q�6;   .��6Z   Exit6`   5_      5`      5a      