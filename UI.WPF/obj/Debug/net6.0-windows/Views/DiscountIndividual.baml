   M S B A M L   `   `   `  ����I  ERestaurant.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Restaurant.WPF.ViewsRestaurant.WPF.Views  5   	   -    'Restaurant.WPF.Views.DiscountIndividual   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f;Controls,http://metro.mahapps.com/winfx/xaml/controls  5      .local"clr-namespace:Restaurant.WPF.Views  5   	     � Title$  Discount Individual��5	   	    � WindowState$ 	Maximized=�6&   '  !System.Windows.Shell.WindowChrome   ResizeGripDirection$ Bottom=�6>   $	��500��6h   $	��900��6x   .��5
      �  � ColumnDefinitions 5   
   �� 5      6!   �� 5      6!    � RowDefinitions 5   
   �� 5      6   �� 5      $��60 �6   6+   .+�5   
   �� -   5        $��	DataTable��5      $��5,5,5,5q�6%      MahApps.Brushes.Highlight#���   67   ._�5      &   System.Windows.Controls.DataGrid  -   5          Name$ 
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
 True��5      $��10,10,10,10q�69      Columns 5      4  .System.Windows.Controls.DataGridCheckBoxColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Choose��6-      Width5  /System.Windows.Controls.DataGridLengthConverter$ 70 6>      
IsReadOnly$ False��6s   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6I   �� *	IsChecked+ �� Mode$ TwoWay=�5      4  .System.Windows.Controls.DataGridTemplateColumn  5       $	 QTY��6-   $	 140 6:      CellTemplate 5!      �� 5"      .R�5#   "   �� 
�������
���   ���6O   �� *QTY+5$      5&        5'      $
 Name��6-   $	 150 6;    5(      �� 5)      .R�5*   "   �� 
�������
���   ���6O   �� *
ItemName+5+      5-        5.      $ Price��6-   $	 140 6<    5/      �� 50      .R�51   "   �� 
�������
���   ���6O   �� *Price+52      54        55      $ 	LineTotal��6-   $	 150 6@    56      �� 57      .R�58   "   �� 
�������
���   ���6O   �� *	LineTotal+59      5;      5=      5>      ]� 5?   
   $��1��6   .+�5@      �� $��10,10,10,10q�6   $��20(�6-   	Comments:6F   �� 5A      -   5        $��
commentBox��5A      $��10,10,10,10q�6(   $��5,5,5,5q�6=   6Q   5B      � 5C   
   $��1��6   #���   6$   .+�5D      � -   5        $��
DiscountWP��5D      $��40q�6,   5E      5F      � 5G   
   $��1��6   $��1��6$   #���   62   $��RightToLeft=�6k   .+�5H      �� -   5        $��17(�5H      $��Right=�6%   $��Bottom=�6B   $��	30,5,30,5q�5I      
�������#���   6A   $��10,10,10,10q�5J      .��67   Back5K      5L      5M      5N      