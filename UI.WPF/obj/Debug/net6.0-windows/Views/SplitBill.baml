   M S B A M L   `   `   `  ����I  ERestaurant.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Restaurant.WPF.ViewsRestaurant.WPF.Views  5   	   $    Restaurant.WPF.Views.SplitBill   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f;Controls,http://metro.mahapps.com/winfx/xaml/controls  5      :d2http://schemas.microsoft.com/expression/blend/2008  5   	   Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5   	   .local"clr-namespace:Restaurant.WPF.Views  5   	     � Title$  
Split Bill��5	   	   (  "MahApps.Metro.Controls.MetroWindow   WindowTransitionsEnabled$
 True��6    � WindowState$ 	Maximized=�6=      MahApps.Brushes.Accent3#���   5
      .��5      �  � RowDefinitions 5   
   �� 5      6   �� 5      $��70 �6   6*    � ColumnDefinitions 5   
   �� 5      $	��230 �6   6-   �� 5      6!   �� 5      6!   .+�5   
   �� $��Stretch=�6   $��
20,20,0,20q�63   
�������._�5      �� .��5      �� -   5        $��orderListSP��5      5      5      5      �� 5   
   
�������$��20,20,10,20q�6$   $��1��69   $��0��6I   ._�5      �� -   5        $��	DataTable��5   %   $��1��6   $��5,5,5,5q�67     MahApps.Brushes.Highlight#���  6I   ._�5      &   System.Windows.Controls.DataGrid  -   5          Name$ LineGrid��5!       $��Stretch=�5      
���   �   SelectionUnit$ FullRow=�5    #      AutoGenerateColumns$ False��5!   2   $��2q�6O   $��Stretch=�5"      $��
10,10,2,10q�6;      CanUserResizeColumns$
 True��5#      "	   VerticalScrollBarVisibility$	 Visible=�5$      $
   HorizontalScrollBarVisibility$
 Hidden=�6=      CanUserSortColumns$
 True��5%      $��10,10,10,10q�69   ��5&      �� 5'       �� 
TargetType)  #System.Windows.Controls.DataGridRow"  6    .�5(      -   5        5*         Columns 5,      4  .System.Windows.Controls.DataGridTemplateColumn  5-      ,  &System.Windows.Controls.DataGridColumn   Header$	 QTY��61      Width5  /System.Windows.Controls.DataGridLengthConverter$ 50 6>      CellTemplate 5.      �� 5/   "   .R�50   &   �� ��6.   �� *QTY+��6F   �� *Color+��6d   �� *
ForeGround+51   #   53        54      $
 Name��61   $	 150 6?    55      �� 56   "   .R�57   &   �� ��6-   �� *
ItemName+��6J   �� *Color+��6i   �� *
ForeGround+58   #   5:        5;      $ Price��61   $	 100 6@    5<      �� 5=   "   .R�5>   &   �� ��6.   �� *Price+��6I   �� *Color+��6g   �� *
ForeGround+5?   #   5A        5B      $ Total��61   $	 100 6@    5C      �� 5D   "   .R�5E   &   �� ��6.   �� *	LineTotal+��6L   �� *Color+��6j   �� *
ForeGround+5F   #   5H        5I      $ Status��61   $	 100 6A    5J      �� 5K   "   .R�5L   &   �� ��6.   �� *Status+��6J   �� *Color+��6h   �� *
ForeGround+5M   #   5O      5Q      5R      5S      �� 5T   
   
�������$��
0,20,20,20q�6$   $��2��68   $��0��6H   ._�5U      �� $��1��6   $��5,5,5,5q�6&   #���  68   ._�5V        -   5        $ selectedLines��5Z       
���   �$��Stretch=�5W      !   EnableColumnVirtualization$
 True��65      EnableRowVirtualization$
 True��6W      CanUserDeleteRows$
 True��5X   !      SelectionMode$ Extended=�6;   $ FullRow=�6T      CanUserAddRows$
 True��5Y      $ False��5Z   7   $��2q�6T   $��Stretch=�5[      $��
10,10,2,10q�6;   $
 True��5\      $	 Visible=�5]      $
 Hidden=�6=   $
 True��5^      $��10,10,10,10q�69    5_        5`      $	 QTY��61   $ 70 6>    5a      �� 5b   "   .R�5c   &   �� 
�������
���   ���6S   �� *QTY+5d   #   5f        5g      $
 Name��61   $	 200 6?    5h      �� 5i   "   .R�5j   &   �� 
�������
���   ���6S   �� *
ItemName+5k   #   5m        5n      $ Price��61   $	 100 6@    5o      �� 5p   "   .R�5q   &   �� 
�������
���   ���6S   �� *Price+5r   #   5t        5u      $ Total��61   $	 110 6@    5v      �� 5w   "   .R�5x   &   �� 
�������
���   ���6S   �� *	LineTotal+5y   #   5{      5~      5      5�      � 5�   
   $��1��6   $��
20,0,20,10q�6%   $��1��5�      $��Stretch=�6   $��Stretch=�68   .+�5�      �� -   5        $��30,15,30,15q�5�      $��18(�6+   $
��Bold"�6F   $��Center=�6X   .��6s   Back6y   �� 5�      -   5        $��splitButton��5�   O   $��30,15,30,15q�6   $��18(�6A   $
��Bold"�6b   $��Center=�6t   .��6�   
Split bill6�   �� 5�      $��30,15,30,15q�6   $��18(�6+   $
��Bold"�69   $��Center=�6L   .��6g   
Merge Bill6s   5�      5�      5�      