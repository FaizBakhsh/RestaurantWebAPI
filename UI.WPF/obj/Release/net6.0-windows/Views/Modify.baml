   M S B A M L   `   `   `  ���� I  ERestaurant.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Restaurant.WPF.ViewsRestaurant.WPF.Views  !    Restaurant.WPF.Views.Modify   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     4local"clr-namespace:Restaurant.WPF.Views     T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f;Controls,http://metro.mahapps.com/winfx/xaml/controls    � Title$  Modifier�� � WindowState$ 	Maximized=�'  !System.Windows.Shell.WindowChrome   ResizeGripDirection$ Bottom=�$	��500��$	��900��.���  � ColumnDefinitions �� ��  � RowDefinitions �� �� $��60 �.+��� -   $��	DataTable��$��0��$��5,5,5,5q�   MahApps.Brushes.Highlight#���   ._�&   System.Windows.Controls.DataGrid  -     Name$ 
SOLineGrid��
���   �$��Stretch=�!   EnableColumnVirtualization$
 True��   EnableRowVirtualization$
 True��   CanUserDeleteRows$
 True��	   SelectionMode$	 Extended=�
   SelectionUnit$
 FullRow=�   CanUserAddRows$
 True��   AutoGenerateColumns$ False��$��2q�$��Stretch=�$��
10,10,2,10q�   CanUserResizeColumns$
 True��"   VerticalScrollBarVisibility$ Visible=�$   HorizontalScrollBarVisibility$ Hidden=�   CanUserSortColumns$
 True��$��10,10,10,10q�   Columns 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn   Header$
 Name��   Width5  /System.Windows.Controls.DataGridLengthConverter$	 150    CellTemplate �� .R��� 
�������
���   ����� *
ItemName+  $	 QTY��$	 150  �� .R��� 
�������
���   ����� *QTY+  $ Price��$	 150  �� .R��� 
�������
���   ����� *Price+  $ 	LineTotal��$	 150  �� .R��� 
�������
���   ����� *	LineTotal+�� -   $��1��$��0��$��17(�$
��Left=�$��Bottom=�$��	30,5,30,5q�
�������#���   $��10,10,120,10q�.��Delete� $��1��  MahApps.Brushes.Accent2#���  .+�� -   $��
ModifierWP��$��40q��� -   $��1��$��1��$��17(�$��Right=�$��Bottom=�$��	30,5,30,5q�$��10,10,10,10q�.��Back�� -   $��1��$��1��$��17(�$��Right=�$��Bottom=�$��	30,5,30,5q�$��10,10,120,10q�.��Save