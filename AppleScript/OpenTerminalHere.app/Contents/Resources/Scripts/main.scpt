FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��

	Open Terminal Here
	
	A toolbar script for Mac OS X 10
	
	Written by Marc Liyanage
	
	
	See http://www.apple.com/applescript/macosx/toolbar_scripts/ for
	more information about toolbar scripts.
	
	See http://www.entropy.ch/software/applescript/ for the latest
	version of this script.
	
	
	History:
	
	30-OCT-2001: Version 1.0, adapted from one of the example toolbar scripts
	30-OCT-2001: Now handles embedded single quote characters in file names
	30-OCT-2001: Now handles folders on volumes other than the startup volume
	30-OCT-2001: Now handles click on icon in top-level (machine) window
	31-OCT-2001: Now displays a nicer terminal window title, courtesy of Alain Content
	11-NOV-2001: Now folders within application packages (.app directories) and has a new icon
	12-NOV-2001: New properties to set terminal columns and rows as the Terminal does not use default settings
	14-NOV-2001: Major change, now handles 8-bit characters in all shells, and quotes and spaces in tcsh
	18-NOV-2001: Version 1.1: Rewrite, now uses a temporary file  ~/.OpenTerminalHere to communicate
	             the directory name between AppleScript and the shell because this is much more reliable for 8-bit characters
	16-JAN-2006: Version 2.0: Rewrite, now uses "quoted form of" and "POSIX Path". This gets rid of
	             Perl and temp files, but it no longer handles files instead of folders.
	24-JAN-2007: Version 2.1: Integrated enhancements by Stephan Hradek, can again handle dropped files.
	18-NOV-2007: Leopard Update. Detects busy tab and opens a new one if needed - Jonathan Austin
	11-JAN-2008: Leopard Update. Detects if finder has a window. If not it, it opens terminal at the root of startup drive. - M Auayan
	22-APR-2010: Always open new tab - jameslow.com
	
     � 	 	� 
 
 	 O p e n   T e r m i n a l   H e r e 
 	 
 	 A   t o o l b a r   s c r i p t   f o r   M a c   O S   X   1 0 
 	 
 	 W r i t t e n   b y   M a r c   L i y a n a g e 
 	 
 	 
 	 S e e   h t t p : / / w w w . a p p l e . c o m / a p p l e s c r i p t / m a c o s x / t o o l b a r _ s c r i p t s /   f o r 
 	 m o r e   i n f o r m a t i o n   a b o u t   t o o l b a r   s c r i p t s . 
 	 
 	 S e e   h t t p : / / w w w . e n t r o p y . c h / s o f t w a r e / a p p l e s c r i p t /   f o r   t h e   l a t e s t 
 	 v e r s i o n   o f   t h i s   s c r i p t . 
 	 
 	 
 	 H i s t o r y : 
 	 
 	 3 0 - O C T - 2 0 0 1 :   V e r s i o n   1 . 0 ,   a d a p t e d   f r o m   o n e   o f   t h e   e x a m p l e   t o o l b a r   s c r i p t s 
 	 3 0 - O C T - 2 0 0 1 :   N o w   h a n d l e s   e m b e d d e d   s i n g l e   q u o t e   c h a r a c t e r s   i n   f i l e   n a m e s 
 	 3 0 - O C T - 2 0 0 1 :   N o w   h a n d l e s   f o l d e r s   o n   v o l u m e s   o t h e r   t h a n   t h e   s t a r t u p   v o l u m e 
 	 3 0 - O C T - 2 0 0 1 :   N o w   h a n d l e s   c l i c k   o n   i c o n   i n   t o p - l e v e l   ( m a c h i n e )   w i n d o w 
 	 3 1 - O C T - 2 0 0 1 :   N o w   d i s p l a y s   a   n i c e r   t e r m i n a l   w i n d o w   t i t l e ,   c o u r t e s y   o f   A l a i n   C o n t e n t 
 	 1 1 - N O V - 2 0 0 1 :   N o w   f o l d e r s   w i t h i n   a p p l i c a t i o n   p a c k a g e s   ( . a p p   d i r e c t o r i e s )   a n d   h a s   a   n e w   i c o n 
 	 1 2 - N O V - 2 0 0 1 :   N e w   p r o p e r t i e s   t o   s e t   t e r m i n a l   c o l u m n s   a n d   r o w s   a s   t h e   T e r m i n a l   d o e s   n o t   u s e   d e f a u l t   s e t t i n g s 
 	 1 4 - N O V - 2 0 0 1 :   M a j o r   c h a n g e ,   n o w   h a n d l e s   8 - b i t   c h a r a c t e r s   i n   a l l   s h e l l s ,   a n d   q u o t e s   a n d   s p a c e s   i n   t c s h 
 	 1 8 - N O V - 2 0 0 1 :   V e r s i o n   1 . 1 :   R e w r i t e ,   n o w   u s e s   a   t e m p o r a r y   f i l e     ~ / . O p e n T e r m i n a l H e r e   t o   c o m m u n i c a t e 
 	                           t h e   d i r e c t o r y   n a m e   b e t w e e n   A p p l e S c r i p t   a n d   t h e   s h e l l   b e c a u s e   t h i s   i s   m u c h   m o r e   r e l i a b l e   f o r   8 - b i t   c h a r a c t e r s 
 	 1 6 - J A N - 2 0 0 6 :   V e r s i o n   2 . 0 :   R e w r i t e ,   n o w   u s e s   " q u o t e d   f o r m   o f "   a n d   " P O S I X   P a t h " .   T h i s   g e t s   r i d   o f 
 	                           P e r l   a n d   t e m p   f i l e s ,   b u t   i t   n o   l o n g e r   h a n d l e s   f i l e s   i n s t e a d   o f   f o l d e r s . 
 	 2 4 - J A N - 2 0 0 7 :   V e r s i o n   2 . 1 :   I n t e g r a t e d   e n h a n c e m e n t s   b y   S t e p h a n   H r a d e k ,   c a n   a g a i n   h a n d l e   d r o p p e d   f i l e s . 
 	 1 8 - N O V - 2 0 0 7 :   L e o p a r d   U p d a t e .   D e t e c t s   b u s y   t a b   a n d   o p e n s   a   n e w   o n e   i f   n e e d e d   -   J o n a t h a n   A u s t i n 
 	 1 1 - J A N - 2 0 0 8 :   L e o p a r d   U p d a t e .   D e t e c t s   i f   f i n d e r   h a s   a   w i n d o w .   I f   n o t   i t ,   i t   o p e n s   t e r m i n a l   a t   t h e   r o o t   o f   s t a r t u p   d r i v e .   -   M   A u a y a n 
 	 2 2 - A P R - 2 0 1 0 :   A l w a y s   o p e n   n e w   t a b   -   j a m e s l o w . c o m 
 	 
   
  
 l     ��������  ��  ��        l     ��������  ��  ��        l     ��������  ��  ��        l     ��  ��    . ( when the toolbar script icon is clicked     �   P   w h e n   t h e   t o o l b a r   s c r i p t   i c o n   i s   c l i c k e d      l     ��������  ��  ��        i         I     ������
�� .aevtoappnull  �   � ****��  ��    k     $       O         Q       ! "   r     # $ # c     % & % l    '���� ' l    (���� ( n     ) * ) 1    ��
�� 
fvtg * l    +���� + 4   �� ,
�� 
cwin , m   	 
���� ��  ��  ��  ��  ��  ��   & m    ��
�� 
alis $ o      ���� 0 this_folder   ! R      ������
�� .ascrerr ****      � ****��  ��   " r     - . - m     / / � 0 0   . o      ���� 0 this_folder    m      1 1�                                                                                  MACS  alis    Z  Mac                        ղ:�H+   ���
Finder.app                                                      �!����        ����  	                CoreServices    ձ�      �c     ��� � �  -Mac:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p    M a c  &System/Library/CoreServices/Finder.app  / ��     2�� 2 n   $ 3 4 3 I    $�� 5���� 0 process_item   5  6�� 6 o     ���� 0 this_folder  ��  ��   4  f    ��     7 8 7 l     ��������  ��  ��   8  9 : 9 l     �� ; <��   ; J D This handler processes folders dropped onto the toolbar script icon    < � = = �   T h i s   h a n d l e r   p r o c e s s e s   f o l d e r s   d r o p p e d   o n t o   t h e   t o o l b a r   s c r i p t   i c o n :  > ? > l     ��������  ��  ��   ?  @ A @ i     B C B I     �� D��
�� .aevtodocnull  �    alis D o      ���� 0 these_items  ��   C X      E�� F E n    G H G I    �� I���� 0 process_item   I  J�� J o    ���� 0 	this_item  ��  ��   H  f    �� 0 	this_item   F o    ���� 0 these_items   A  K L K l     ��������  ��  ��   L  M N M l     ��������  ��  ��   N  O P O l     ��������  ��  ��   P  Q R Q l     �� S T��   S ) # this subroutine converts the path     T � U U F   t h i s   s u b r o u t i n e   c o n v e r t s   t h e   p a t h   R  V W V l     ��������  ��  ��   W  X Y X i     Z [ Z I      �� \���� 0 process_item   \  ]�� ] o      ���� 0 	this_item  ��  ��   [ k     5 ^ ^  _ ` _ Z     , a b�� c a >     d e d o     ���� 0 	this_item   e m     f f � g g   b k    & h h  i j i r     k l k n    	 m n m 1    	��
�� 
psxp n o    ���� 0 	this_item   l o      ���� 0 the_path   j  o�� o W    & p q p r    ! r s r n     t u t 7   �� v w
�� 
ctxt v m    ����  w m    ������ u o    ���� 0 the_path   s o      ���� 0 the_path   q D     x y x o    ���� 0 the_path   y m     z z � { {  /��  ��   c r   ) , | } | m   ) * ~ ~ �     } o      ���� 0 the_path   `  � � � I   - 3�� ����� 0 activate_terminal   �  ��� � o   . /���� 0 the_path  ��  ��   �  ��� � l  4 4��������  ��  ��  ��   Y  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � %  this subroutine does its thing    � � � � >   t h i s   s u b r o u t i n e   d o e s   i t s   t h i n g �  � � � l     ��������  ��  ��   �  ��� � i     � � � I      �� ����� 0 activate_terminal   �  ��� � o      ���� 0 the_path  ��  ��   � O     � � � � k    � � �  � � � Z    � � ��� � � =    � � � l    ����� � I   �� ���
�� .corecnte****       **** � 2   ��
�� 
cwin��  ��  ��   � m    ����   � Z    C � ��� � � >    � � � o    ���� 0 the_path   � m     � � � � �   � I   !���� �
�� .coredoscnull    ��� null��   � �� ���
�� 
cmnd � b     � � � m     � � � � �  c d   � n     � � � 1    ��
�� 
strq � o    ���� 0 the_path  ��  ��   � k   $ C � �  � � � O  $ . � � � I  ( -������
�� .miscactvnull��� ��� null��  ��   � m   $ % � ��                                                                                      @ alis    R  Mac                        ղ:�H+   �F�Terminal.app                                                    �{1��[        ����  	                	Utilities     ձ�      ��     �F� �p  )Mac:Applications: Utilities: Terminal.app     T e r m i n a l . a p p    M a c  #Applications/Utilities/Terminal.app   / ��   �  ��� � O  / C � � � O  3 B � � � l 	 : A ����� � I  : A�� � �
�� .prcskprsnull���    utxt � m   : ; � � � � �  n � �� ���
�� 
faal � m   < =�
� eMdsKcmd��  ��  ��   � 4   3 7�~ �
�~ 
prcs � m   5 6 � � � � �  T e r m i n a l � m   / 0 � ��                                                                                  sevs  alis    v  Mac                        ղ:�H+   ���System Events.app                                               �9Րׄ        ����  	                CoreServices    ձ�      Րg     ��� � �  4Mac:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    M a c  -System/Library/CoreServices/System Events.app   / ��  ��  ��   � k   F � � �  � � � l  F F�} � ��}   � " if front window is busy then    � � � � 8 i f   f r o n t   w i n d o w   i s   b u s y   t h e n �  � � � l  F F�| � ��|   � J DCan be tested by looking at a manpage or running top in terminal.app    � � � � � C a n   b e   t e s t e d   b y   l o o k i n g   a t   a   m a n p a g e   o r   r u n n i n g   t o p   i n   t e r m i n a l . a p p �  � � � O  F P � � � I  J O�{�z�y
�{ .miscactvnull��� ��� null�z  �y   � m   F G � ��                                                                                      @ alis    R  Mac                        ղ:�H+   �F�Terminal.app                                                    �{1��[        ����  	                	Utilities     ձ�      ��     �F� �p  )Mac:Applications: Utilities: Terminal.app     T e r m i n a l . a p p    M a c  #Applications/Utilities/Terminal.app   / ��   �  � � � O  Q i � � � O  U h � � � l 	 ^ g ��x�w � I  ^ g�v � �
�v .prcskprsnull���    utxt � m   ^ a � � � � �  t � �u ��t
�u 
faal � m   b c�s
�s eMdsKcmd�t  �x  �w   � 4   U [�r �
�r 
prcs � m   W Z � � � � �  T e r m i n a l � m   Q R � ��                                                                                  sevs  alis    v  Mac                        ղ:�H+   ���System Events.app                                               �9Րׄ        ����  	                CoreServices    ձ�      Րg     ��� � �  4Mac:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    M a c  -System/Library/CoreServices/System Events.app   / ��   �  � � � l  j j�q � ��q   �  end if    � � � �  e n d   i f �  ��p � Z   j � � ��o�n � >  j o � � � o   j k�m�m 0 the_path   � m   k n � � � � �   � I  r ��l�k �
�l .coredoscnull    ��� null�k   � �j � �
�j 
cmnd � b   t { � � � m   t w � � � � �  c d   � n   w z � � � 1   x z�i
�i 
strq � o   w x�h�h 0 the_path   � �g ��f
�g 
kfil � 4   ~ ��e �
�e 
cwin � m   � ��d�d �f  �o  �n  �p   �  ��c � I  � ��b�a�`
�b .miscactvnull��� ��� null�a  �`  �c   � m      � ��                                                                                      @ alis    R  Mac                        ղ:�H+   �F�Terminal.app                                                    �{1��[        ����  	                	Utilities     ձ�      ��     �F� �p  )Mac:Applications: Utilities: Terminal.app     T e r m i n a l . a p p    M a c  #Applications/Utilities/Terminal.app   / ��  ��       
�_ � � � � �^�]�\�_   � �[�Z�Y�X�W�V�U�T
�[ .aevtoappnull  �   � ****
�Z .aevtodocnull  �    alis�Y 0 process_item  �X 0 activate_terminal  �W 0 this_folder  �V  �U  �T   � �S �R�Q�P
�S .aevtoappnull  �   � ****�R  �Q     	 1�O�N�M�L�K�J /�I
�O 
cwin
�N 
fvtg
�M 
alis�L 0 this_folder  �K  �J  �I 0 process_item  �P %�  *�k/�,�&E�W 
X  �E�UO)�k+  � �H C�G�F�E
�H .aevtodocnull  �    alis�G 0 these_items  �F   �D�C�D 0 these_items  �C 0 	this_item   �B�A�@�?
�B 
kocl
�A 
cobj
�@ .corecnte****       ****�? 0 process_item  �E  �[��l kh )�k+ [OY�� � �> [�=�<�;�> 0 process_item  �= �:�:   �9�9 0 	this_item  �<   �8�7�8 0 	this_item  �7 0 the_path    f�6 z�5�4 ~�3
�6 
psxp
�5 
ctxt�4���3 0 activate_terminal  �; 6�� %��,E�O h���[�\[Zk\Z�2E�[OY��Y �E�O*�k+ OP  �2 ��1�0	
�/�2 0 activate_terminal  �1 �.�.   �-�- 0 the_path  �0  	 �,�, 0 the_path  
  ��+�* ��) ��(�'�& ��% � ��$�#�" � � � ��!� 
�+ 
cwin
�* .corecnte****       ****
�) 
cmnd
�( 
strq
�' .coredoscnull    ��� null
�& .miscactvnull��� ��� null
�% 
prcs
�$ 
faal
�# eMdsKcmd
�" .prcskprsnull���    utxt
�! 
kfil�  �/ �� �*�-j j  8�� *���,%l Y !� *j UO� *��/ 	���l UUY H� *j UO� *�a / a ��l UUO�a  *�a ��,%a *�k/a  Y hO*j UNalis    J  Mac                        ղ:�H+   �My Games                                                        �Ỹ(-        ����  	                	Documents     ձ�      ̂��     � \   �  %Mac:Users: James: Documents: My Games     M y   G a m e s    M a c  Users/James/Documents/My Games  /    ��  �^  �]  �\   ascr  ��ޭ