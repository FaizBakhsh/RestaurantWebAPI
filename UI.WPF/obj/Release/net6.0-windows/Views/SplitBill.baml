   M S B A M L   `   `   `  ���� I  ERestaurant.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Restaurant.WPF.ViewsRestaurant.WPF.Views  $    Restaurant.WPF.Views.SplitBill   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f;Controls,http://metro.mahapps.com/winfx/xaml/controls  :d2http://schemas.microsoft.com/expression/blend/2008  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  .local"clr-namespace:Restaurant.WPF.Views    � Title$  
Split Bill��(  "MahApps.Metro.Controls.MetroWindow   WindowTransitionsEnabled$
 True�� � WindowState$ 	Maximized=�   MahApps.Brushes.Accent3#���   .���  � RowDefinitions �� �� $��70 � � ColumnDefinitions �� $	��230 ��� �� .+��� $��Stretch=�$��
20,20,0,20q�
�������._��� .���� -   $��orderListSP���� 
�������$��20,20,10,20q�$��1��$��0��._��� -   $��	DataTable��$��1��$��5,5,5,5q�  MahApps.Brushes.Highlight#���  ._�&   System.Windows.Controls.DataGrid  -     Name$ LineGrid��$��Stretch=�
���   �   SelectionUnit$ FullRow=�   AutoGenerateColumns$ False��$��2q�$��Stretch=�$��
10,10,2,10q�   CanUserResizeColumns$
 True��"	   VerticalScrollBarVisibility$	 Visible=�$
   HorizontalScrollBarVisibility$
 Hidden=�   CanUserSortColumns$
 True��$��10,10,10,10q�����  �� 
TargetType)  #System.Windows.Controls.DataGridRow"  .�-      Columns 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn   Header$	 QTY��   Width5  /System.Windows.Controls.DataGridLengthConverter$ 50    CellTemplate �� .R��� ���� *QTY+���� *Color+���� *
ForeGround+  $
 Name��$	 150  �� .R��� ���� *
ItemName+���� *Color+���� *
ForeGround+  $ Price��$	 100  �� .R��� ���� *Price+���� *Color+���� *
ForeGround+  $ Total��$	 100  �� .R��� ���� *	LineTotal+���� *Color+���� *
ForeGround+  $ Status��$	 100  �� .R��� ���� *Status+���� *Color+���� *
ForeGround+�� 
�������$��
0,20,20,20q�$��2��$��0��._��� $��1��$��5,5,5,5q�#���  ._�  -   $ selectedLines��
���   �$��Stretch=�!   EnableColumnVirtualization$
 True��   EnableRowVirtualization$
 True��   CanUserDeleteRows$
 True��   SelectionMode$ Extended=�$ FullRow=�   CanUserAddRows$
 True��$ False��$��2q�$��Stretch=�$��
10,10,2,10q�$
 True��$	 Visible=�$
 Hidden=�$
 True��$��10,10,10,10q�   $	 QTY��$ 70  �� .R��� 
�������
���   ����� *QTY+  $
 Name��$	 200  �� .R��� 
�������
���   ����� *
ItemName+  $ Price��$	 100  �� .R��� 
�������
���   ����� *Price+  $ Total��$	 110  �� .R��� 
�������
���   ����� *	LineTotal+� $��1��$��
20,0,20,10q�$��1��$��Stretch=�$��Stretch=�.+��� -   $��30,15,30,15q�$��18(�$
��Bold"�$��Center=�.��Back�� -   $��splitButton��$��30,15,30,15q�$��18(�$
��Bold"�$��Center=�.��
Split bill�� $��30,15,30,15q�$��18(�$
��Bold"�$��Center=�.��
Merge Bill