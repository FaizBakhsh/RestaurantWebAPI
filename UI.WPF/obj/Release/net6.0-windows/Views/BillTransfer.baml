   M S B A M L   `   `   `  ���� I  ERestaurant.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Restaurant.WPF.ViewsRestaurant.WPF.Views  '    !Restaurant.WPF.Views.BillTransfer   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     4local"clr-namespace:Restaurant.WPF.Views     T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f;Controls,http://metro.mahapps.com/winfx/xaml/controls    � Title$  Bill Transfer��$	��500��$
��1000�� � WindowStartupLocation$ CenterScreen=�.��� .+���    MahApps.Brushes.Highlight#���   $
��Left=�$��Stretch=�$��25,25,25,25q�._�&   System.Windows.Controls.DataGrid  -   $��	orderList��
���   �  MahApps.Brushes.Accent4#���     CanUserDeleteRows$
 True��   CanUserAddRows$
 True��   AutoGenerateColumns$ False��$��1q�$��Stretch=�$��2,10,2,2q�   CanUserResizeColumns$
 True��"   VerticalScrollBarVisibility$ Visible=�$   HorizontalScrollBarVisibility$ Hidden=�   CanUserSortColumns$
 True��$��10,10,10,10q�	   Columns	 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn
   Header$
 Bill_No��   Width5  /System.Windows.Controls.DataGridLengthConverter$	 150    CellTemplate �� .R��� 
�������
���   ����� *Id+  $
 
Bill_Title��$	 150  �� .R��� 
�������
���   ����� *	BillTitle+  $
 Net Bill��$	 150  �� .R��� 
�������
���   ����� *
NetTotal+  $
 	Bill Type��$	 150  �� .R��� 
�������
���   ����� *PaymentMethod+� $��Stretch=�$��Right=� � Orientation$ Vertical=�$��25,35,25,25q�.+��� $��22(�Transfer Selected Bill To�� -   $��Cash_btn��$��30,10,30,10q�$��18(�$��0,40,0,0q�.��Cash�� -   $��Card_btn��$��30,10,30,10q�$��18(�$��0,10,0,0q�.��	Visa Card�� -   $��30,10,30,10q�$��18(�$��	0,120,0,0q�.��Exit