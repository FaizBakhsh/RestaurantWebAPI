   M S B A M L   `   `   `  ����I  ERestaurant.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Restaurant.WPF.ViewsRestaurant.WPF.Views  5   	   '    !Restaurant.WPF.Views.BillTransfer   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:Restaurant.WPF.Views     5   	   T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f;Controls,http://metro.mahapps.com/winfx/xaml/controls  5   	     � Title$  Bill Transfer��5	   	   $	��500��6   $
��1000��6/    � WindowStartupLocation$ CenterScreen=�6?   .��5
      � .+�5   
   ��    MahApps.Brushes.Highlight#���   6   $
��Left=�6K   $��Stretch=�6f   $��25,25,25,25q�5      ._�5      &   System.Windows.Controls.DataGrid  -   5        $��	orderList��5   Q   
���   �  MahApps.Brushes.Accent4#���  5   !      CanUserDeleteRows$
 True��5   !      CanUserAddRows$
 True��6:      AutoGenerateColumns$ False��5       $��1q�6=   $��Stretch=�5      $��2,10,2,2q�6;      CanUserResizeColumns$
 True��5      "   VerticalScrollBarVisibility$ Visible=�69   $   HorizontalScrollBarVisibility$ Hidden=�6_      CanUserSortColumns$
 True��5      $��10,10,10,10q�69   	   Columns	 5      4  .System.Windows.Controls.DataGridTemplateColumn  5      ,  &System.Windows.Controls.DataGridColumn
   Header$
 Bill_No��6-      Width5  /System.Windows.Controls.DataGridLengthConverter$	 150 6?      CellTemplate 5      �� 5      .R�5   "   �� 
�������
���   ���6O   �� *Id+5      5        5      $
 
Bill_Title��6-   $	 150 6B    5      �� 5      .R�5   "   �� 
�������
���   ���6O   �� *	BillTitle+5       5"        5#      $
 Net Bill��6-   $	 150 6@    5$      �� 5%      .R�5&   "   �� 
�������
���   ���6O   �� *
NetTotal+5'      5)        5*      $
 	Bill Type��6-   $	 150 6A    5+      �� 5,      .R�5-   "   �� 
�������
���   ���6O   �� *PaymentMethod+5.      50      52      53      � 54   
   $��Stretch=�6   $��Right=�60    � Orientation$ Vertical=�6L   $��25,35,25,25q�6c   .+�55      �� $��22(�6   Transfer Selected Bill To6B   �� 56      -   5        $��Cash_btn��56   Z   $��30,10,30,10q�6   $��18(�6+   $��0,40,0,0q�69   .��6j   Cash6p   �� 57      -   5        $��Card_btn��57   Z   $��30,10,30,10q�6   $��18(�6+   $��0,10,0,0q�69   .��6j   	Visa Card6u   �� 58      -   5        $��30,10,30,10q�58      $��18(�6+   $��	0,120,0,0q�69   .��6Y   Exit6_   59      5:      5;      