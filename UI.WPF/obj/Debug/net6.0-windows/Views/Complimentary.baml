   M S B A M L   `   `   `  ����I  ERestaurant.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Restaurant.WPF.ViewsRestaurant.WPF.Views  5   	   (    "Restaurant.WPF.Views.Complimentary   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f;Controls,http://metro.mahapps.com/winfx/xaml/controls  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5   	   .local"clr-namespace:Restaurant.WPF.Views  5   	     � Title$  Complimentary��5	   	    � WindowState$ 	Maximized=�6    � WindowStartupLocation$ CenterScreen=�67   $	��400��6\   $	��900��6l   .��5
      �  � ColumnDefinitions 5   
   �� 5      6!   �� 5      6"    � RowDefinitions 5   
   �� 5      6   �� 5      $��60 �6   6+   .+�5   
   �� -   5        $��	DataTable��5      $��0��6#   $��5,5,5,5q�60      MahApps.Brushes.Highlight#���   6B   ._�5      &   System.Windows.Controls.DataGrid  -   5          Name$ 
SOLineGrid��5       
���   �$��Stretch=�5      !   EnableColumnVirtualization$
 True��65      EnableRowVirtualization$
 True��6W      CanUserDeleteRows$
 True��5   !   	   SelectionMode$	 Extended=�6;   
   SelectionUnit$
 FullRow=�6T      CanUserAddRows$
 True��5         AutoGenerateColumns$ False��5   4   $��2q�6Q   $��Stretch=�5      $��
10,10,2,10q�6;      CanUserResizeColumns$
 True��5      "   VerticalScrollBarVisibility$ Visible=�5      $   HorizontalScrollBarVisibility$ Hidden=�6=      CanUserSortColumns$
 True��5      $��10,10,10,10q�69      Columns 5      4  .System.Windows.Controls.DataGridCheckBoxColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Choose��6-      Width5  /System.Windows.Controls.DataGridLengthConverter$ 70 6>      
IsReadOnly$ False��6s   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6I   �� *	IsChecked+ �� Mode$ TwoWay=�5      4  .System.Windows.Controls.DataGridTemplateColumn  5'      $	 QTY��6-   $	 140 6:      CellTemplate 5(      �� 5)      .R�5*   "   �� 
�������
���   ���6O   �� *QTY+5+      5-        5.      $
 Name��6-   $	 150 6;    5/      �� 50      .R�51   "   �� 
�������
���   ���6O   �� *
ItemName+52      54        55      $ Price��6-   $	 140 6<    56      �� 57      .R�58   "   �� 
�������
���   ���6O   �� *Price+59      5;        5<      $ 	LineTotal��6-   $	 150 6@    5=      �� 5>      .R�5?   "   �� 
�������
���   ���6O   �� *	LineTotal+5@      5B      5D      5E      ]� 5F   
   $��1��6   .+�5G      �� $��10,10,10,10q�6   $��20(�6-   	Comments:6F   �� 5H      -   5        $��
commentBox��5H   *    �� TextWrapping$
 Wrap=�6   $��10,10,10,10q�6<   $��5,5,5,5q�6Q   6e   5I      ]� 5J   
   $��1��6   $��0��6$   #���   62   .+�5K      �� -   5        $��Complimentary��5K   2   $��25(�6J   $��50,10,50,10q�6X   $��Center=�6o   $��Center=�6�   
�������#���   6�   5L      � 5M   
   $��1��6   $��1��6$   #���   62   $��RightToLeft=�6k   .+�5N      �� -   5        $��17(�5N      $��Right=�6%   $��Bottom=�6B   $��	30,5,30,5q�5O      
�������#���   6A   $��10,10,10,10q�5P      .��67   Back5Q      5R      5T      5U      