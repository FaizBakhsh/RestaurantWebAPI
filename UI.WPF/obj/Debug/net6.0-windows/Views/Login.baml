   M S B A M L   `   `   `  ����I  ERestaurant.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Restaurant.WPF.ViewsRestaurant.WPF.Views  5   	        Restaurant.WPF.Views.Login   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:Restaurant.WPF.Views     5   	   T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f;Controls,http://metro.mahapps.com/winfx/xaml/controls  5   	     � Title$  Login��5	   
   $	��430��6    � 
ResizeMode$ NoResize=�6%      MahApps.Brushes.Accent#���   6<    � WindowStyle$ 
ToolWindow=�6s   $��1q�5
      $	��716��6&   $	��430��63   $	��716��6C    � WindowState$ Normal=�6R   (  "MahApps.Metro.Controls.MetroWindow   WindowTransitionsEnabled$
 True��6g   .��5      �  � RowDefinitions 5   
   �� 5      $��75 �6   6+   �� 5      6   �� 5      $��30 �6   6+    � ColumnDefinitions 5   
   �� 5      $	��150 �6   6.   �� 5      6#   �� 5      $	��150 �6    6/   .+�5   
   G� -   5        $��InputBox��5   Q   $��1��6   $��10,10,10,10q�6;   $��1��6b   #���   6o   $��43��6�   $	��Top=�6�   $��	35,0,35,0q�6�   $	��343��6�   5      �� 5   
   -   5        $��1��5      $��1��6!   $��2��6/     MahApps.Brushes.Accent4#���  6P     MahApps.Brushes.Text#���  6�   $��Stretch=�6�   $��41��6�   $��0,46,0,0q�6�   $	��Top=�6�   $	��112��6  �� 5   
   -   5        $��1��5      $��1��6!   $��3��6/   #���  6P   #���  6�   $��Stretch=�6�   $��41��6�   $��
233,46,0,0q�6�   $	��Top=�6�   $	��112��6  �� 5   
   -   5        $��1��5      $��1��6!   $��1��6/   #���  6P   #���  6�   $��Stretch=�6�   $��41��6�   $��
0,46,233,0q�6�   $	��Top=�6�   $	��112��6  �� 5   
   -   5        $��1��5      $��1��6!   $��5��6/   #���  6P   #���  6�   $��Stretch=�6�   $��41��6�   $��0,90,0,0q�6�   $	��Top=�6�   $	��112��6  �� 5   
   -   5        $��1��5      $��1��6!   $��6��6/   #���  6P   #���  6�   $��Stretch=�6�   $��41��6�   $��
233,90,0,0q�6�   $	��Top=�6�   $	��112��6  �� 5   
   -   5        $��1��5      $��1��6!   $��4��6/   #���  6P   #���  6�   $��41��6�   $��
0,90,233,0q�6�   $	��Top=�6�   $	��112��6�   �� 5   
   -   5        $��1��5      $��1��6!   $��8��6/   #���  6P   #���  6�   $��Stretch=�6�   $��41��6�   $��	0,135,0,0q�6�   $	��Top=�6�   $	��112��6  �� 5    
   -	   5        $��1��5       $��1��6!   $��9��6/   #���  6P   #���  6�   $��Stretch=�6�   $��41��6�   $��233,135,0,0q�6�   $	��Top=�6�   $	��112��6  �� 5!   
   -
   5        $��1��5!      $��1��6!   $��7��6/   #���  6P   #���  6�   $��Stretch=�6�   $��41��6�   $��0,136,233,0q�6�   $	��Top=�6�   $	��112��6  �� 5"   
   -   5        $��1��5"      $��1��6!   $��0��6/   #���  6P   #���  6�   $��Stretch=�6�   $��41��6�   $��	0,180,0,0q�6�   $	��Top=�6�   $	��112��6  �� 5#   
   -   5        $��1��5#      $��1��6!   $��0q�6.   $��	BackSpace��6C   $��Stretch=�6m   $��41��6�   $��233,180,0,0q�6�   $	��Top=�6�   $	��112��6�   �� 5$   
   -   5        $��1��5$      $��1��6!   $��0q�6.   $��Clear��6C   $��Stretch=�6e   $��41��6�   $��32,181,264,0q�6�   $	��Top=�6�   $	��112��6�   �� 5%   
   -   5        $��1��5%      $��1��6!   $��0q�6.   $��Logout��6C   $��Stretch=�6g   $��41��6�   $��150,226,151,0q�6�   $	��Top=�6�   $	��112��6�   �� 5&   
   -   5        $��1��5&      $��1��6!   $��0q�6.   $
��Exit��6B   $��Stretch=�6b   $��41��6�   $��233,226,0,0q�6�   $	��Top=�6�   $	��112��6�   �� 5'   
   -   5        $��loginBtn��5'   /   $��1��6   $��1��6"   $��0q�6?   $��Login��6S   $��Stretch=�6c   $��41��6�   $��35,226,268,0q�6�   $	��Top=�6�   $	��112��6�   �� 5)   
   $��30��6   $��Stretch=�6!   $��Bottom=�6?   #���   6Z   $��2��6�   $��3��6�   6�   5+      5,      