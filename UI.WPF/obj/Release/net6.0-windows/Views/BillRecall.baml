   M S B A M L   `   `   `  ���� I  ERestaurant.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Restaurant.WPF.ViewsRestaurant.WPF.Views  %    Restaurant.WPF.Views.BillRecall   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f;Controls,http://metro.mahapps.com/winfx/xaml/controls  :d2http://schemas.microsoft.com/expression/blend/2008  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  .local"clr-namespace:Restaurant.WPF.Views    � Title$  Bill Recall�� � WindowState$ 	Maximized=�$	��300��$	��900��.���  � RowDefinitions �� $��70 ��� �� $��50 �.+�� $��0��$��Center=�.+�� .+��� $��	45,0,10,0q�$��17(�$��Center=�Search By Bill No�� -   $��	SearchBox��$��5,7,5,5q�$	��200��$��35���� -   $��70��$��30��$��10,0,0,0q�.��Search�� -   $��70��$��30��$��5,0,0,0q�.��
View All�� -   $��70��$��30��$��5,0,0,0q�.��
Dispatch�� -   $��0��$��30,10,30,10q�$��45��$��18(�$��
20,0,100,0q�$��Right=�.��
Cash Out�� -   $��	DataTable��   MahApps.Brushes.Highlight#���   $��1��$��10,10,10,10q�._�&   System.Windows.Controls.DataGrid  -     Name$ 	OrderList��
���   �  MahApps.Brushes.Accent4#���     CanUserDeleteRows$
 True��   CanUserAddRows$
 True��   AutoGenerateColumns$ False��$��1q�$��Stretch=�$��2,10,2,2q�   CanUserResizeColumns$
 True��"   VerticalScrollBarVisibility$ Visible=�$	   HorizontalScrollBarVisibility$
	 Auto=�
   CanUserSortColumns$

 True��$��10,10,10,10q�   Columns 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Bill No��   Width5  /System.Windows.Controls.DataGridLengthConverter$ 60    CellTemplate �� .R��� 
�������
���   ����� *Id+  $ 
Created On��$	 120  �� .R��� 
�������
���   ����� *	CreatedOn+  $ Net Bill��$	 100  �� .R��� 
�������
���   ����� *
NetTotal+  $ 
Order Type��$	 100  �� .R��� 
�������
���   ����� *	OrderType+  $ Status��$	 100  �� .R��� 
�������
���   ����� *Status+  $ Payment Method��$	 100  �� .R��� 
�������
���   ����� *PaymentMethod+  $ 
BillTitle ��$	 120  �� .R��� 
�������
���   ����� *	BillTitle+  $ Address��$	 120  �� .R��� 
�������
���   ����� *	Address+  $ Phone No��$	 120  �� .R��� 
�������
���   ����� *	PhoneNo+  $ Rider Id��$	 110  �� .R��� 
�������
���   ����� *	RiderId+  $ Dispatched Time��$	 130  �� .R��� 
�������
���   ����� *DispatchedTime+  $ Delivered Time��$	 140  �� .R��� 
�������
���   ����� *DeliveryTime+� $��2��$��10,0,0,0q�$��Center=�.+��� -   $��	30,5,30,5q�$��17(�.��Recall�� -	   $��	30,5,30,5q�$��17(�.��Back