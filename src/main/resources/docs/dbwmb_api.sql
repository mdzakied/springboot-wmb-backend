PGDMP                       |         	   dbwmb_api    16.1    16.1 2               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25375 	   dbwmb_api    DATABASE     �   CREATE DATABASE dbwmb_api WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbwmb_api;
                postgres    false            �            1259    25810    m_image    TABLE     �   CREATE TABLE public.m_image (
    id character varying(255) NOT NULL,
    content_type character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    size bigint NOT NULL
);
    DROP TABLE public.m_image;
       public         heap    postgres    false            �            1259    25383    m_menu    TABLE     �   CREATE TABLE public.m_menu (
    id character varying NOT NULL,
    name character varying NOT NULL,
    price integer,
    image_id character varying(255)
);
    DROP TABLE public.m_menu;
       public         heap    postgres    false            �            1259    25648    m_role    TABLE     %  CREATE TABLE public.m_role (
    id character varying(255) NOT NULL,
    role character varying(255),
    CONSTRAINT m_role_role_check CHECK (((role)::text = ANY ((ARRAY['ROLE_SUPER_ADMIN'::character varying, 'ROLE_ADMIN'::character varying, 'ROLE_CUSTOMER'::character varying])::text[])))
);
    DROP TABLE public.m_role;
       public         heap    postgres    false            �            1259    25390    m_table    TABLE     m   CREATE TABLE public.m_table (
    id character varying NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.m_table;
       public         heap    postgres    false            �            1259    25397    m_trans_type    TABLE     t   CREATE TABLE public.m_trans_type (
    id character varying NOT NULL,
    description character varying NOT NULL
);
     DROP TABLE public.m_trans_type;
       public         heap    postgres    false            �            1259    25376    m_user    TABLE     �   CREATE TABLE public.m_user (
    id character varying NOT NULL,
    name character varying NOT NULL,
    phone_number character varying,
    status boolean,
    user_acount_id character varying(255)
);
    DROP TABLE public.m_user;
       public         heap    postgres    false            �            1259    25838    m_user_account    TABLE     �   CREATE TABLE public.m_user_account (
    id character varying(255) NOT NULL,
    is_enable boolean,
    password character varying(255) NOT NULL,
    username character varying(255) NOT NULL
);
 "   DROP TABLE public.m_user_account;
       public         heap    postgres    false            �            1259    25845    m_user_account_role    TABLE     �   CREATE TABLE public.m_user_account_role (
    user_account_id character varying(255) NOT NULL,
    role_id character varying(255) NOT NULL
);
 '   DROP TABLE public.m_user_account_role;
       public         heap    postgres    false            �            1259    25404    t_bill    TABLE       CREATE TABLE public.t_bill (
    id character varying NOT NULL,
    trans_date timestamp(6) without time zone NOT NULL,
    user_id character varying,
    table_id character varying,
    trans_type character varying NOT NULL,
    payment_id character varying(255)
);
    DROP TABLE public.t_bill;
       public         heap    postgres    false            �            1259    25411    t_bill_detail    TABLE     �   CREATE TABLE public.t_bill_detail (
    id character varying NOT NULL,
    bill_id character varying,
    menu_id character varying,
    qty integer NOT NULL,
    price integer NOT NULL
);
 !   DROP TABLE public.t_bill_detail;
       public         heap    postgres    false            �            1259    25824 	   t_payment    TABLE     �   CREATE TABLE public.t_payment (
    id character varying(255) NOT NULL,
    redirect_url character varying(255),
    token character varying(255),
    transaction_status character varying(255)
);
    DROP TABLE public.t_payment;
       public         heap    postgres    false            �          0    25810    m_image 
   TABLE DATA           E   COPY public.m_image (id, content_type, name, path, size) FROM stdin;
    public          postgres    false    222   /=       �          0    25383    m_menu 
   TABLE DATA           ;   COPY public.m_menu (id, name, price, image_id) FROM stdin;
    public          postgres    false    216   �=       �          0    25648    m_role 
   TABLE DATA           *   COPY public.m_role (id, role) FROM stdin;
    public          postgres    false    221   A       �          0    25390    m_table 
   TABLE DATA           +   COPY public.m_table (id, name) FROM stdin;
    public          postgres    false    217   �A       �          0    25397    m_trans_type 
   TABLE DATA           7   COPY public.m_trans_type (id, description) FROM stdin;
    public          postgres    false    218   �B       �          0    25376    m_user 
   TABLE DATA           P   COPY public.m_user (id, name, phone_number, status, user_acount_id) FROM stdin;
    public          postgres    false    215   �B                  0    25838    m_user_account 
   TABLE DATA           K   COPY public.m_user_account (id, is_enable, password, username) FROM stdin;
    public          postgres    false    224   �C                 0    25845    m_user_account_role 
   TABLE DATA           G   COPY public.m_user_account_role (user_account_id, role_id) FROM stdin;
    public          postgres    false    225   �D       �          0    25404    t_bill 
   TABLE DATA           [   COPY public.t_bill (id, trans_date, user_id, table_id, trans_type, payment_id) FROM stdin;
    public          postgres    false    219   XE       �          0    25411    t_bill_detail 
   TABLE DATA           I   COPY public.t_bill_detail (id, bill_id, menu_id, qty, price) FROM stdin;
    public          postgres    false    220   �F       �          0    25824 	   t_payment 
   TABLE DATA           P   COPY public.t_payment (id, redirect_url, token, transaction_status) FROM stdin;
    public          postgres    false    223   H       W           2606    25816    m_image m_image_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.m_image
    ADD CONSTRAINT m_image_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.m_image DROP CONSTRAINT m_image_pkey;
       public            postgres    false    222            G           2606    25389    m_menu m_menu_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.m_menu
    ADD CONSTRAINT m_menu_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.m_menu DROP CONSTRAINT m_menu_pkey;
       public            postgres    false    216            U           2606    25655    m_role m_role_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.m_role
    ADD CONSTRAINT m_role_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.m_role DROP CONSTRAINT m_role_pkey;
       public            postgres    false    221            K           2606    25396    m_table m_table_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.m_table
    ADD CONSTRAINT m_table_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.m_table DROP CONSTRAINT m_table_pkey;
       public            postgres    false    217            M           2606    25403    m_trans_type m_trans_type_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.m_trans_type
    ADD CONSTRAINT m_trans_type_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.m_trans_type DROP CONSTRAINT m_trans_type_pkey;
       public            postgres    false    218            [           2606    25844 "   m_user_account m_user_account_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.m_user_account
    ADD CONSTRAINT m_user_account_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.m_user_account DROP CONSTRAINT m_user_account_pkey;
       public            postgres    false    224            C           2606    25382    m_user m_user_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.m_user
    ADD CONSTRAINT m_user_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.m_user DROP CONSTRAINT m_user_pkey;
       public            postgres    false    215            S           2606    25417     t_bill_detail t_bill_detail_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.t_bill_detail
    ADD CONSTRAINT t_bill_detail_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.t_bill_detail DROP CONSTRAINT t_bill_detail_pkey;
       public            postgres    false    220            O           2606    25410    t_bill t_bill_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.t_bill
    ADD CONSTRAINT t_bill_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.t_bill DROP CONSTRAINT t_bill_pkey;
       public            postgres    false    219            Y           2606    25830    t_payment t_payment_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.t_payment
    ADD CONSTRAINT t_payment_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.t_payment DROP CONSTRAINT t_payment_pkey;
       public            postgres    false    223            I           2606    25818 #   m_menu uk_20wgc30wmqu7frqgw5mbbxgr9 
   CONSTRAINT     b   ALTER TABLE ONLY public.m_menu
    ADD CONSTRAINT uk_20wgc30wmqu7frqgw5mbbxgr9 UNIQUE (image_id);
 M   ALTER TABLE ONLY public.m_menu DROP CONSTRAINT uk_20wgc30wmqu7frqgw5mbbxgr9;
       public            postgres    false    216            Q           2606    25832 #   t_bill uk_5gbd3p3aghnmrmqn77ma2knrc 
   CONSTRAINT     d   ALTER TABLE ONLY public.t_bill
    ADD CONSTRAINT uk_5gbd3p3aghnmrmqn77ma2knrc UNIQUE (payment_id);
 M   ALTER TABLE ONLY public.t_bill DROP CONSTRAINT uk_5gbd3p3aghnmrmqn77ma2knrc;
       public            postgres    false    219            E           2606    25851 #   m_user uk_efbaxpe7uhpsvflvfgecb0fsf 
   CONSTRAINT     h   ALTER TABLE ONLY public.m_user
    ADD CONSTRAINT uk_efbaxpe7uhpsvflvfgecb0fsf UNIQUE (user_acount_id);
 M   ALTER TABLE ONLY public.m_user DROP CONSTRAINT uk_efbaxpe7uhpsvflvfgecb0fsf;
       public            postgres    false    215            ]           2606    25853 +   m_user_account uk_lveldxh9ud3mkuqk8vexltugi 
   CONSTRAINT     j   ALTER TABLE ONLY public.m_user_account
    ADD CONSTRAINT uk_lveldxh9ud3mkuqk8vexltugi UNIQUE (username);
 U   ALTER TABLE ONLY public.m_user_account DROP CONSTRAINT uk_lveldxh9ud3mkuqk8vexltugi;
       public            postgres    false    224            f           2606    25859 /   m_user_account_role fk3454ub2g25rxlc7dfbtfjcp10    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_user_account_role
    ADD CONSTRAINT fk3454ub2g25rxlc7dfbtfjcp10 FOREIGN KEY (role_id) REFERENCES public.m_role(id);
 Y   ALTER TABLE ONLY public.m_user_account_role DROP CONSTRAINT fk3454ub2g25rxlc7dfbtfjcp10;
       public          postgres    false    221    4693    225            _           2606    25819 "   m_menu fk3te4r8i7owxnuceempaw3v1ym    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_menu
    ADD CONSTRAINT fk3te4r8i7owxnuceempaw3v1ym FOREIGN KEY (image_id) REFERENCES public.m_image(id);
 L   ALTER TABLE ONLY public.m_menu DROP CONSTRAINT fk3te4r8i7owxnuceempaw3v1ym;
       public          postgres    false    4695    216    222            `           2606    25482 "   t_bill fk9ncaaotbxschlqy74r5mmsiwe    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_bill
    ADD CONSTRAINT fk9ncaaotbxschlqy74r5mmsiwe FOREIGN KEY (trans_type) REFERENCES public.m_trans_type(id);
 L   ALTER TABLE ONLY public.t_bill DROP CONSTRAINT fk9ncaaotbxschlqy74r5mmsiwe;
       public          postgres    false    219    218    4685            a           2606    25833 "   t_bill fkcos40syk1ngm90ev1v2cpcl7g    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_bill
    ADD CONSTRAINT fkcos40syk1ngm90ev1v2cpcl7g FOREIGN KEY (payment_id) REFERENCES public.t_payment(id);
 L   ALTER TABLE ONLY public.t_bill DROP CONSTRAINT fkcos40syk1ngm90ev1v2cpcl7g;
       public          postgres    false    4697    223    219            b           2606    25477 "   t_bill fkgi8nvfq5amrc9die4vkmonwxf    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_bill
    ADD CONSTRAINT fkgi8nvfq5amrc9die4vkmonwxf FOREIGN KEY (table_id) REFERENCES public.m_table(id);
 L   ALTER TABLE ONLY public.t_bill DROP CONSTRAINT fkgi8nvfq5amrc9die4vkmonwxf;
       public          postgres    false    4683    217    219            g           2606    25864 /   m_user_account_role fkiof37osqt93rgnavdrtoc6qml    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_user_account_role
    ADD CONSTRAINT fkiof37osqt93rgnavdrtoc6qml FOREIGN KEY (user_account_id) REFERENCES public.m_user_account(id);
 Y   ALTER TABLE ONLY public.m_user_account_role DROP CONSTRAINT fkiof37osqt93rgnavdrtoc6qml;
       public          postgres    false    4699    225    224            d           2606    25487 )   t_bill_detail fkkn1f8xw6ado3wrokhvjppu8qq    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_bill_detail
    ADD CONSTRAINT fkkn1f8xw6ado3wrokhvjppu8qq FOREIGN KEY (bill_id) REFERENCES public.t_bill(id);
 S   ALTER TABLE ONLY public.t_bill_detail DROP CONSTRAINT fkkn1f8xw6ado3wrokhvjppu8qq;
       public          postgres    false    4687    220    219            c           2606    25472 "   t_bill fklmpbsqe22nwtls8scu4gtebta    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_bill
    ADD CONSTRAINT fklmpbsqe22nwtls8scu4gtebta FOREIGN KEY (user_id) REFERENCES public.m_user(id);
 L   ALTER TABLE ONLY public.t_bill DROP CONSTRAINT fklmpbsqe22nwtls8scu4gtebta;
       public          postgres    false    215    4675    219            ^           2606    25854 "   m_user fko42d7jy3ckkrknvwcy4iqtisj    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_user
    ADD CONSTRAINT fko42d7jy3ckkrknvwcy4iqtisj FOREIGN KEY (user_acount_id) REFERENCES public.m_user_account(id);
 L   ALTER TABLE ONLY public.m_user DROP CONSTRAINT fko42d7jy3ckkrknvwcy4iqtisj;
       public          postgres    false    215    4699    224            e           2606    25492 )   t_bill_detail fktf1dxdwko9gpahytlvhfxc39k    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_bill_detail
    ADD CONSTRAINT fktf1dxdwko9gpahytlvhfxc39k FOREIGN KEY (menu_id) REFERENCES public.m_menu(id);
 S   ALTER TABLE ONLY public.t_bill_detail DROP CONSTRAINT fktf1dxdwko9gpahytlvhfxc39k;
       public          postgres    false    216    4679    220            �   �   x�}��� g},�mW;v����)F����_���].W���Y��X]qbJ�3�U�����o2뤡˲��D'x)��i�PM^&�E�.��d�x&�	��� ܂>��D��;0�庒7|���f�5��@����L�.w{
��wݖ9�<�E�EA      �     x�]T�nG>��B/�bf����i��p�����3�X�-	r�"o_���^��؏���c���١��A�� m�Z��I^���_��!,_?�$�9FA����*�jo�g
-_���y��xZ�&<����11Ь�'�"�\��fX�����@���Z	Npv�Af���h�������ݽ�+�%�wd��X�WgG}2h�q�Tr	!^(�u����r��B)c%�u��!FlU������ɮ,G���	�a�Y@s,CfDʆ��m��x�÷%nH���J��˚�鏎3jVQ)ݗ=ϻ_��t|\��L�!)+��
d1xjfPз�*1����ݗ�����M����*�i�@u(�ೆ!y	�š;9|{|]�_L2M=X""�Uq�V� qΑ����7˶�;��I��スODO�Si:���x��Γ<�nO��.�b�����,fψ[ �X{썤���`�r�,�kD���h�?^%
:v$�N�:�j4u��0��{�{�İ9�a�%���j�s̓�EN}�������`Kٮ�z�޽��쏆��+:K2O�7�>ȓ��U1���z�{rP��m�:K�	M/}x=����B;r\��L(����I�o��Q�ܢ��65�qL�N̞Pt�An��	���}>��ucSR���k!U$�
^�'�؅�ۉo8�a�}��̰V)Uh�ͪ����y�|M�N����y�8	#z�]_v��A#h
=Pn�*��'�V���2Lm�V�;\\w�̙F��?�Y����;�׃Q�-
~9�&`v�z�[�������{�j�      �   �   x�%�1�0 ����(v��t@��tC��4����Y���@z���̔�	��Or)�k>��3���X�o��=�J�+�&퐤{�Z��5|�DD��0KQ�@�٩�@6�}߾�2��:��H�)      �      x�%��u1E�Q/� @���!A�%������s���	�c�o6@��ru����t�7� $�ǆ��r�i�[ ����ه���`�pK�V ��4���e�$`���$���v�S^<n�dN�y:GLA�$z>�$��Ą1�Ⱦ��T
8�-��z�ܯ�hLg萩�U[d�/)K*&Y��齪xEp�:管��Y钱F&��_I�v���� =�-�y;�.�6�Z`������_������]f      �   $   x�s��tM,Q���
q�I�NUp,O������ m3      �   �   x��1B! ��'��ZkO�`t,ll����m�Y�C�)p�:M DDu�t�����kz�"D�	��:��4Ј ���ezv�^V[�6�����\�Z�����{B52����BC���Ő���u�*1�q�9�.            x�E�Ar�0  �3��k�ɑ jk+BԎN/		be +�zۓ/�Y\�yII�@:�r��0F�WFoL��@{r~/5���c�E��Z��"�&bK{���E��5mT��c�s45�[�Z�_�)�@�f�?��*@m(�R��
e��Sa�e�e=[�����^T�V,�`��c�v������ƇC�[pc�gm"��B����a�,� �~!�+���4�Ys�U�W�%J����n�yz�ko���|��Ҍ1I��E9^��i�O�`�         �   x��α�1Q����$��9�D�!�l����El;�Z�]`<��*��v�����G�3�Ѻn�а�o$
���P���´�d��r�I+&3��Ob���\:x�<ũ���:��g�!�/v���qe�_��Nb%BO��{�	�L��
�|����i�}g[�      �   -  x���=�1@�S��g�.E�4�Rn6���f�ҦI�B���"v��C��N&B���P�RN#+� ��K���p�ip���A���*
=b��q�̹�r�vv+aA���]������k���`.:hA�	�����i�=�:v��g�O6
��Ö��/����{i5s:�@�F�bAu,n.�li�w4���T�4��̽��ya���+mI{������ןW���,>ж��`�A���Mo�u����Oy�����g�؟0��N����� y�-��a%`�[��r���s��_���T      �   \  x��Rˑ!<�˅-�e/���f��bYVK�6�0.���M��J������ǽ|2�P6����Y�ل��	2,�Q��G
����a2�=�1�g��*pX�Sa�u�`�[�?~�Jh����-p��t]�D���#��9�����k�t����"�߃*���l->�8��	�ǚ���}�u�ѩ�5�j+ľ9
�+���8�;�7^u���.,�ؙ��:fMN�|,�c���VMͳ�1���8yH�]���.LZ�0����-HUl~s���W	]�����#����;	�����R{� �Zډ�s�V��jh�~��4��8����6�V(y٩.}������������7      �   �  x����n%)�וwq.���7�C�E~�D�y��m�f��Z�t
>��1�GQ봀�)�(ȣ��:v���_��||<ɛ���ϯ/��)o_���z�z��۟v���~y�F �
{5R7�-e�w���S��O�\�������H:�j�A۔ݛ�x��}�UW����N`��ٱ�9��ُS�+�D[���!��!x�i����XǨ�]���,:�"gh^\�qJ�`5nXgW(T�`��r^s��R]�O���-�5�� 3�Ԛ��D?��Pʜ �hUY]��o�6"?��n���cM+���0����)��캶���O ��L�M���<�E��f���ayem����s�5&<N����p*@�it���D���mpߣmuе�vCj��s�u�=XK�6=	�g��Ns�̬���{Q)�X���~��[q��O
)��D�̄{�eXpz (�v�R�aG�zѯ:���,�hZ���_����^�z��)����U�x� ��A2�pdvh�u_�@�O��X�1�w�nn����E����gh��=����~��?��=+r��jX��\��Ssy�6���2$��8%z��Z�h����L/�\���_m\d�%��j�EVҔi6v��h��qJ�úwV:ÿD��,B��T0��iS�Ng�����m�ٵ36�����as����������?����     