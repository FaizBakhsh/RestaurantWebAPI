   M S B A M L   `   `   `  ���� I  ERestaurant.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Restaurant.WPF.ViewsRestaurant.WPF.Views  (    "Restaurant.WPF.Views.Complimentary   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f;Controls,http://metro.mahapps.com/winfx/xaml/controls  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  .local"clr-namespace:Restaurant.WPF.Views    � Title$  Complimentary�� � WindowState$ 	Maximized=� � WindowStartupLocation$ CenterScreen=�$	��400��$	��900��.���  � ColumnDefinitions �� ��  � RowDefinitions �� �� $��60 �.+��� -   $��	DataTable��$��0��$��5,5,5,5q�   MahApps.Brushes.Highlight#���   ._�&   System.Windows.Controls.DataGrid  -     Name$ 
SOLineGrid��
���   �$��Stretch=�!   EnableColumnVirtualization$
 True��   EnableRowVirtualization$
 True��   CanUserDeleteRows$
 True��	   SelectionMode$	 Extended=�
   SelectionUnit$
 FullRow=�   CanUserAddRows$
 True��   AutoGenerateColumns$ False��$��2q�$��Stretch=�$��
10,10,2,10q�   CanUserResizeColumns$
 True��"   VerticalScrollBarVisibility$ Visible=�$   HorizontalScrollBarVisibility$ Hidden=�   CanUserSortColumns$
 True��$��10,10,10,10q�   Columns 4  .System.Windows.Controls.DataGridCheckBoxColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Choose��   Width5  /System.Windows.Controls.DataGridLengthConverter$ 70    
IsReadOnly$ False��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *	IsChecked+ �� Mode$ TwoWay=�4  .System.Windows.Controls.DataGridTemplateColumn  $	 QTY��$	 140    CellTemplate �� .R��� 
�������
���   ����� *QTY+  $
 Name��$	 150  �� .R��� 
�������
���   ����� *
ItemName+  $ Price��$	 140  �� .R��� 
�������
���   ����� *Price+  $ 	LineTotal��$	 150  �� .R��� 
�������
���   ����� *	LineTotal+]� $��1��.+��� $��10,10,10,10q�$��20(�	Comments:�� -   $��
commentBox�� �� TextWrapping$
 Wrap=�$��10,10,10,10q�$��5,5,5,5q�]� $��1��$��0��#���   .+��� -   $��Complimentary��$��25(�$��50,10,50,10q�$��Center=�$��Center=�
�������#���   � $��1��$��1��#���   $��RightToLeft=�.+��� -   $��17(�$��Right=�$��Bottom=�$��	30,5,30,5q�
�������#���   $��10,10,10,10q�.��Back