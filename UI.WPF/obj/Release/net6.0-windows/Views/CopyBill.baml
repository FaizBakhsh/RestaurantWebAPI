   M S B A M L   `   `   `  ���� I  ERestaurant.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Restaurant.WPF.ViewsRestaurant.WPF.Views  #    Restaurant.WPF.Views.CopyBill   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f;Controls,http://metro.mahapps.com/winfx/xaml/controls  :d2http://schemas.microsoft.com/expression/blend/2008  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  .local"clr-namespace:Restaurant.WPF.Views    � Title$  	Copy Bill�� � WindowState$ 	Maximized=�$	��300��$
��1000��   MahApps.Brushes.Highlight#���   .���  � RowDefinitions �� $��70 ���  � ColumnDefinitions �� �� $	��500 �.+�� $��0��$��0��$��Center=�$
��Left=�.+�� .+��� $��	45,0,10,0q�$��17(�$��Center=�
�������	Bill No�� -   $��	SearchBox��$��5,7,5,5q�$	��200��$��35���� -   $��70��$��30��$��17(�$��10,0,0,0q�
�������#���   .��Search�� -   $��70��$��30��$��17(�$��5,0,0,0q�
�������#���   .��
View All� $��0��$��1��$��Center=�$��Center=�.+��� $��0,0,10,0q�$��22(�$��Center=�
�������Sale Details�� -   $	��140��$��30��$��17(�$��30,0,0,0q�
�������#���   .��Duplicate Bill�� -   $��70��$��30��$��17(�$��10,0,0,0q�
�������#���   .��Exit�� -   $��	DataTable��
�������$��1��$��	10,0,0,10q�._�&   System.Windows.Controls.DataGrid  -     Name$ 	OrderList��
���   �$��Stretch=�  MahApps.Brushes.Accent4#���     CanUserDeleteRows$
 True��   CanUserAddRows$
 True��   AutoGenerateColumns$ False��$��1q�$��Stretch=�$��10,10,10,10q�   CanUserResizeColumns$
 True��"	   VerticalScrollBarVisibility$
	 Auto=�$
   HorizontalScrollBarVisibility$

 Auto=�   CanUserSortColumns$
 True��$��10,10,10,10q�����  �� 
TargetType)  #System.Windows.Controls.DataGridRow"  .�-      Columns 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Bill No��   Width5  /System.Windows.Controls.DataGridLengthConverter$ 50    CellTemplate �� .R��� 
�������
���   ����� *Id+  $ 
Created On��$	 150  �� .R��� 
�������
���   ����� *	CreatedOn+  $ Net Bill��$	 150  �� .R��� 
�������
���   ����� *
NetTotal+  $ 
Order Type��$	 120  �� .R��� 
�������
���   ����� *	OrderType+  $ Payment Method��$	 120  �� .R��� 
�������
���   ����� *PaymentMethod+  $ 
BillTitle ��$	 120  �� .R��� 
�������
���   ����� *	BillTitle+  $ 	Discount ��$ 90  �� .R��� 
�������
���   ����� *
Discount+�� 
�������$��1��$��1��$��
10,0,10,10q�._�  -	   $ 	LineTable��
���   �#���  $
 True��$
 True��$ False��$��1q�$��Stretch=�$��10,10,10,10q�$��Stretch=�$
 True��$
	 Auto=�$

 Auto=�$
 True��$��10,10,10,10q� � 	Resources  �� Triggers �� Binding �� Value �� Property �� Value P� Property P� Value��%�   '        �� "   ��  �� *IsRMod+ true.a���  � ��
 �������  �� *
IsDealItem+ true.a���  � ��$
 Bold"���  � ��
 �����P�  �@ 
IsSelected$
 True��. ���  � ��
 ��ح�   $
 Item��$	 150  �� .R��� 
�������
���   ����� *
ItemName+  $ Quantity��$	 100  �� .R��� 
�������
���   ����� *QTY+  $ Price��$	 100  �� .R��� 
�������
���   ����� *Price+  $ 	LineTotal��$	 100  �� .R��� 
�������
���   ����� *	LineTotal+