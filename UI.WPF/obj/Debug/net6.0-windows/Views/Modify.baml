   M S B A M L   `   `   `  ����I  ERestaurant.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Restaurant.WPF.ViewsRestaurant.WPF.Views  5   	   !    Restaurant.WPF.Views.Modify   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:Restaurant.WPF.Views     5   	   T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f;Controls,http://metro.mahapps.com/winfx/xaml/controls  5        � Title$  Modifier��5	   
    � WindowState$ 	Maximized=�6   '  !System.Windows.Shell.WindowChrome   ResizeGripDirection$ Bottom=�64   $	��500��6^   $	��900��6n   .��5
      �  � ColumnDefinitions 5   
   �� 5      6!   �� 5      6!    � RowDefinitions 5   
   �� 5      6   �� 5      $��60 �6   6*   .+�5   
   �� -   5        $��	DataTable��5   !   $��0��6   $��5,5,5,5q�63      MahApps.Brushes.Highlight#���   6E   ._�5      &   System.Windows.Controls.DataGrid  -   5          Name$ 
SOLineGrid��5       
���   �$��Stretch=�5      !   EnableColumnVirtualization$
 True��65      EnableRowVirtualization$
 True��6W      CanUserDeleteRows$
 True��5   !   	   SelectionMode$	 Extended=�6;   
   SelectionUnit$
 FullRow=�6T      CanUserAddRows$
 True��5         AutoGenerateColumns$ False��5   4   $��2q�6Q   $��Stretch=�5      $��
10,10,2,10q�6;      CanUserResizeColumns$
 True��5      "   VerticalScrollBarVisibility$ Visible=�5      $   HorizontalScrollBarVisibility$ Hidden=�6=      CanUserSortColumns$
 True��5      $��10,10,10,10q�69      Columns 5      4  .System.Windows.Controls.DataGridTemplateColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$
 Name��6-      Width5  /System.Windows.Controls.DataGridLengthConverter$	 150 6;      CellTemplate 5      �� 5       .R�5!   "   �� 
�������
���   ���6O   �� *
ItemName+5"      5$        5%      $	 QTY��6-   $	 150 6:    5&      �� 5'      .R�5(   "   �� 
�������
���   ���6O   �� *QTY+5)      5+        5,      $ Price��6-   $	 150 6<    5-      �� 5.      .R�5/   "   �� 
�������
���   ���6O   �� *Price+50      52        53      $ 	LineTotal��6-   $	 150 6@    54      �� 55      .R�56   "   �� 
�������
���   ���6O   �� *	LineTotal+57      59      5;      5<      �� 5=   
   -   5        $��1��5=      $��0��6    $��17(�60   $
��Left=�6>   $��Bottom=�6Z   $��	30,5,30,5q�5>      
�������#���   6A   $��10,10,120,10q�5?      .��6:   Delete5@      � 5A   
   $��1��6     MahApps.Brushes.Accent2#���  6$   .+�5B      � -   5        $��
ModifierWP��5B      $��40q�6,   5C      5D      �� 5E   
   -   5        $��1��5E      $��1��6   $��17(�6.   $��Right=�6<   $��Bottom=�6Y   $��	30,5,30,5q�5F      $��10,10,10,10q�5G      .��67   Back5H      �� 5I   
   -   5        $��1��5I      $��1��6    $��17(�60   $��Right=�6>   $��Bottom=�6[   $��	30,5,30,5q�5J      $��10,10,120,10q�5K      .��6:   Save5L      5M      5N      