   M S B A M L   `   `   `  ����I  ERestaurant.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Restaurant.WPF.ViewsRestaurant.WPF.Views  5   	   %    Restaurant.WPF.Views.BillRecall   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f;Controls,http://metro.mahapps.com/winfx/xaml/controls  5      :d2http://schemas.microsoft.com/expression/blend/2008  5   	   Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5   	   .local"clr-namespace:Restaurant.WPF.Views  5   	     � Title$  Bill Recall��5	   	    � WindowState$ 	Maximized=�6   $	��300��65   $	��900��6E   .��5
      �  � RowDefinitions 5   
   �� 5      $��70 �6   6*   �� 5      6   �� 5      $��50 �6   6*   .+�5   
   � $��0��6   $��Center=�6"   .+�5      � .+�5      �� $��	45,0,10,0q�6   $��17(�6/   $��Center=�6=   Search By Bill No6k   �� 5      -   5        $��	SearchBox��5   D   $��5,7,5,5q�6   $	��200��6,   $��35��68   6W   5      �� 5      -   5        $��70��5      $��30��6    $��10,0,0,0q�6,   .��6[   Search6c   �� 5      -   5        $��70��5      $��30��6    $��5,0,0,0q�6,   .��6M   
View All6W   �� 5      -   5        $��70��5      $��30��6    $��5,0,0,0q�6,   .��6N   
Dispatch6X   5      �� 5   
   -   5        $��0��5   !   $��30,10,30,10q�6.   $��45��6D   $��18(�6P   $��
20,0,100,0q�6^   $��Right=�6r   .��6�   
Cash Out6�   �� 5   
   -   5        $��	DataTable��5         MahApps.Brushes.Highlight#���   5      $��1��6K   $��10,10,10,10q�5   '   ._�5      &   System.Windows.Controls.DataGrid  -   5          Name$ 	OrderList��5       
���   �  MahApps.Brushes.Accent4#���  5   !      CanUserDeleteRows$
 True��5   !      CanUserAddRows$
 True��5         AutoGenerateColumns$ False��5    2   $��1q�6O   $��Stretch=�5!      $��2,10,2,2q�6;      CanUserResizeColumns$
 True��5"      "   VerticalScrollBarVisibility$ Visible=�69   $	   HorizontalScrollBarVisibility$
	 Auto=�6_   
   CanUserSortColumns$

 True��5#      $��10,10,10,10q�69      Columns 5$      4  .System.Windows.Controls.DataGridTemplateColumn  5%      ,  &System.Windows.Controls.DataGridColumn   Header$ Bill No��6-      Width5  /System.Windows.Controls.DataGridLengthConverter$ 60 6?      CellTemplate 5&      �� 5'      .R�5(   "   �� 
�������
���   ���6O   �� *Id+5)      5+        5,      $ 
Created On��6-   $	 120 6B    5-      �� 5.      .R�5/   "   �� 
�������
���   ���6O   �� *	CreatedOn+50      52        53      $ Net Bill��6-   $	 100 6@    54      �� 55      .R�56   "   �� 
�������
���   ���6O   �� *
NetTotal+57      59        5:      $ 
Order Type��6-   $	 100 6B    5;      �� 5<      .R�5=   "   �� 
�������
���   ���6O   �� *	OrderType+5>      5@        5A      $ Status��6-   $	 100 6>    5B      �� 5C      .R�5D   "   �� 
�������
���   ���6O   �� *Status+5E      5G        5H      $ Payment Method��6-   $	 100 6F    5I      �� 5J      .R�5K   "   �� 
�������
���   ���6O   �� *PaymentMethod+5L      5N        5O      $ 
BillTitle ��6-   $	 120 6B    5P      �� 5Q      .R�5R   "   �� 
�������
���   ���6O   �� *	BillTitle+5S      5U        5V      $ Address��6-   $	 120 6?    5W      �� 5X      .R�5Y   "   �� 
�������
���   ���6O   �� *	Address+5Z      5\        5]      $ Phone No��6-   $	 120 6@    5^      �� 5_      .R�5`   "   �� 
�������
���   ���6O   �� *	PhoneNo+5a      5c        5d      $ Rider Id��6-   $	 110 6@    5e      �� 5f      .R�5g   "   �� 
�������
���   ���6O   �� *	RiderId+5h      5j        5k      $ Dispatched Time��6-   $	 130 6G    5l      �� 5m      .R�5n   "   �� 
�������
���   ���6O   �� *DispatchedTime+5o      5q        5r      $ Delivered Time��6-   $	 140 6F    5s      �� 5t      .R�5u   "   �� 
�������
���   ���6O   �� *DeliveryTime+5v      5x      5z      5{      � 5|   
   $��2��6   $��10,0,0,0q�6!   $��Center=�63   .+�5}      �� -   5        $��	30,5,30,5q�5}      $��17(�6)   .��6F   Recall6N   �� 5~      -	   5        $��	30,5,30,5q�5~      $��17(�6)   .��6D   Back6J   5      5�      5�      