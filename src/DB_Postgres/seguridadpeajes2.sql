PGDMP         +                }            seguridadpeajes    15.3    15.3 '    #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            &           1262    109646    seguridadpeajes    DATABASE     �   CREATE DATABASE seguridadpeajes WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE seguridadpeajes;
                postgres    false            �            1259    109647    login    TABLE     �   CREATE TABLE public.login (
    id_login integer NOT NULL,
    codigo_2fa text NOT NULL,
    estado_codigo2fa boolean NOT NULL,
    token text,
    estado_token boolean NOT NULL,
    usuarioid text
);
    DROP TABLE public.login;
       public         heap    postgres    false            �            1259    109652    login_id_login_seq    SEQUENCE     �   CREATE SEQUENCE public.login_id_login_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.login_id_login_seq;
       public          postgres    false    214            '           0    0    login_id_login_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.login_id_login_seq OWNED BY public.login.id_login;
          public          postgres    false    215            �            1259    109653    menu    TABLE     s   CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    nombre text NOT NULL,
    comentario text NOT NULL
);
    DROP TABLE public.menu;
       public         heap    postgres    false            �            1259    109658    menu_id_menu_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.menu_id_menu_seq;
       public          postgres    false    216            (           0    0    menu_id_menu_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.menu_id_menu_seq OWNED BY public.menu.id_menu;
          public          postgres    false    217            �            1259    109659    menurol    TABLE        CREATE TABLE public.menurol (
    id_menu_rol integer NOT NULL,
    listar boolean NOT NULL,
    guardar boolean NOT NULL,
    eliminar boolean NOT NULL,
    editar boolean NOT NULL,
    buscar_id boolean NOT NULL,
    rolid integer,
    menuid integer
);
    DROP TABLE public.menurol;
       public         heap    postgres    false            �            1259    109662    menurol_id_menu_rol_seq    SEQUENCE     �   CREATE SEQUENCE public.menurol_id_menu_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.menurol_id_menu_rol_seq;
       public          postgres    false    218            )           0    0    menurol_id_menu_rol_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.menurol_id_menu_rol_seq OWNED BY public.menurol.id_menu_rol;
          public          postgres    false    219            �            1259    109663    rol    TABLE     q   CREATE TABLE public.rol (
    id_rol integer NOT NULL,
    nombre text NOT NULL,
    comentario text NOT NULL
);
    DROP TABLE public.rol;
       public         heap    postgres    false            �            1259    109668    rol_id_rol_seq    SEQUENCE     �   CREATE SEQUENCE public.rol_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.rol_id_rol_seq;
       public          postgres    false    220            *           0    0    rol_id_rol_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.rol_id_rol_seq OWNED BY public.rol.id_rol;
          public          postgres    false    221            �            1259    109669    usuario    TABLE       CREATE TABLE public.usuario (
    id_usuario text NOT NULL,
    nombre text NOT NULL,
    correo text NOT NULL,
    celular text NOT NULL,
    clave text NOT NULL,
    rolid integer,
    hashvalidacion text,
    estadovalidacion boolean,
    aceptado boolean
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            x           2604    109674    login id_login    DEFAULT     p   ALTER TABLE ONLY public.login ALTER COLUMN id_login SET DEFAULT nextval('public.login_id_login_seq'::regclass);
 =   ALTER TABLE public.login ALTER COLUMN id_login DROP DEFAULT;
       public          postgres    false    215    214            y           2604    109675    menu id_menu    DEFAULT     l   ALTER TABLE ONLY public.menu ALTER COLUMN id_menu SET DEFAULT nextval('public.menu_id_menu_seq'::regclass);
 ;   ALTER TABLE public.menu ALTER COLUMN id_menu DROP DEFAULT;
       public          postgres    false    217    216            z           2604    109676    menurol id_menu_rol    DEFAULT     z   ALTER TABLE ONLY public.menurol ALTER COLUMN id_menu_rol SET DEFAULT nextval('public.menurol_id_menu_rol_seq'::regclass);
 B   ALTER TABLE public.menurol ALTER COLUMN id_menu_rol DROP DEFAULT;
       public          postgres    false    219    218            {           2604    109677 
   rol id_rol    DEFAULT     h   ALTER TABLE ONLY public.rol ALTER COLUMN id_rol SET DEFAULT nextval('public.rol_id_rol_seq'::regclass);
 9   ALTER TABLE public.rol ALTER COLUMN id_rol DROP DEFAULT;
       public          postgres    false    221    220                      0    109647    login 
   TABLE DATA           g   COPY public.login (id_login, codigo_2fa, estado_codigo2fa, token, estado_token, usuarioid) FROM stdin;
    public          postgres    false    214   �*                 0    109653    menu 
   TABLE DATA           ;   COPY public.menu (id_menu, nombre, comentario) FROM stdin;
    public          postgres    false    216   .                 0    109659    menurol 
   TABLE DATA           k   COPY public.menurol (id_menu_rol, listar, guardar, eliminar, editar, buscar_id, rolid, menuid) FROM stdin;
    public          postgres    false    218   =.                 0    109663    rol 
   TABLE DATA           9   COPY public.rol (id_rol, nombre, comentario) FROM stdin;
    public          postgres    false    220   b.                  0    109669    usuario 
   TABLE DATA           �   COPY public.usuario (id_usuario, nombre, correo, celular, clave, rolid, hashvalidacion, estadovalidacion, aceptado) FROM stdin;
    public          postgres    false    222   �.       +           0    0    login_id_login_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.login_id_login_seq', 225, true);
          public          postgres    false    215            ,           0    0    menu_id_menu_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.menu_id_menu_seq', 8, true);
          public          postgres    false    217            -           0    0    menurol_id_menu_rol_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.menurol_id_menu_rol_seq', 19, true);
          public          postgres    false    219            .           0    0    rol_id_rol_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.rol_id_rol_seq', 6, true);
          public          postgres    false    221            }           2606    109679    login login_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id_login);
 :   ALTER TABLE ONLY public.login DROP CONSTRAINT login_pkey;
       public            postgres    false    214                       2606    109681    menu menu_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id_menu);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public            postgres    false    216            �           2606    109683    menurol menurol_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.menurol
    ADD CONSTRAINT menurol_pkey PRIMARY KEY (id_menu_rol);
 >   ALTER TABLE ONLY public.menurol DROP CONSTRAINT menurol_pkey;
       public            postgres    false    218            �           2606    109685    rol rol_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);
 6   ALTER TABLE ONLY public.rol DROP CONSTRAINT rol_pkey;
       public            postgres    false    220            �           2606    109687    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    222            �           2606    109688    menurol fk_menuid    FK CONSTRAINT     s   ALTER TABLE ONLY public.menurol
    ADD CONSTRAINT fk_menuid FOREIGN KEY (menuid) REFERENCES public.menu(id_menu);
 ;   ALTER TABLE ONLY public.menurol DROP CONSTRAINT fk_menuid;
       public          postgres    false    218    3199    216            �           2606    109693    usuario fk_rolid    FK CONSTRAINT     o   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_rolid FOREIGN KEY (rolid) REFERENCES public.rol(id_rol);
 :   ALTER TABLE ONLY public.usuario DROP CONSTRAINT fk_rolid;
       public          postgres    false    222    220    3203            �           2606    109698    menurol fk_rolid    FK CONSTRAINT     o   ALTER TABLE ONLY public.menurol
    ADD CONSTRAINT fk_rolid FOREIGN KEY (rolid) REFERENCES public.rol(id_rol);
 :   ALTER TABLE ONLY public.menurol DROP CONSTRAINT fk_rolid;
       public          postgres    false    220    218    3203            �           2606    109703    login fk_usuarioid    FK CONSTRAINT     }   ALTER TABLE ONLY public.login
    ADD CONSTRAINT fk_usuarioid FOREIGN KEY (usuarioid) REFERENCES public.usuario(id_usuario);
 <   ALTER TABLE ONLY public.login DROP CONSTRAINT fk_usuarioid;
       public          postgres    false    214    3205    222                 x���ɮ�J�1�]4E+�fB*mNb�H+l)��`r'��0��R�/k�E�4�@?����{�gf��Τ�0S�j}�cAeԢ�]A�s�<�+�](��*�Rs���O�w��Gs�q���Ƹr{5d�A�͗T�Պ�`']��O��}t�{+��c�nz4����\�sJ�3���tAk���\"����&��4������9p
���e�`+K��I��(xԲ�Uz�{�߸�(.��38�%hrG8�qC��V�CO�I]��g<i�`9'�"�&/�k�\7]1��-jcR1i[�ON�s���J���P��ƴ�����4�gGKj�V��o1ť6)��SSG�h
i��E�7[׃��(�9�ױ?�@l����3{<*�q<�0�'R�Zޜ��M��[�용�+�R��N�����8�u��	�2O�D�u�v:��xUP��w�XE��A;��0.��q�:�g�9w,ך�kY2g�S�B@d�/��"xm�P
�G�MF~{�R��Ӎ��ğuH�%�;��rK��U�`(��Y���+6�u�����'�����!0�7[f�:�GsΝ{�R��J�,�W��u*�����J�8�8"�n`�X,uH,}��[���{�ƬS�V��ϻ��+_ٶ���Ƕ$��
Q���t��3���
���ĭ_�c*�w*W��#Nh�����?D%
����	ΈtEp���R��B���v���f����p��"ʄ�L;dW]��4~�nÿ6��M{�R�������~}}�         (   x�3�tt�����M�+UHL����,.)JL�/����� ��	�            x�3�,�CCNC�=... /��         +   x�3�tt������QHL����,.)JL�/R(HI����� �7
w          j   x�%�1�0 ��y/@q���҅�/`q ��
��U��vM51	���[�s��ܯ���=�����3����,��e�YJ%͕Ҧ�i�&e5�b��<�C�B���     